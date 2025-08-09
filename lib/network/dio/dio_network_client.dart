import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mobile_app_template/core/utils/file/file_utility.dart';
import 'package:mobile_app_template/core/utils/logger/logger.dart';
import 'package:mobile_app_template/network/multipart_file_data.dart';
import 'package:mobile_app_template/network/response.dart';

class DioNetworkClient {
  final Dio _dio;

  DioNetworkClient(this._dio);

  Future<TResponse<T>> _request<T>(
    Future<Response> Function() requestFn,
    T Function(Map<String, dynamic>) dataParser,
    String fallbackPath,
  ) async {
    try{
      final response = await requestFn();
      return _responseHandler(response, dataParser);
    }
    on DioException catch(err){
      TLogger.error('Dio Exception: ${err.toString()}');
      final fallbackResponse = err.response ??
        Response(
          requestOptions: RequestOptions(path: fallbackPath),
          statusCode: 500,
          data: {'error': err.message?? 'No response received'}
        );
      
      return _responseHandler(fallbackResponse, dataParser);
    }
    catch(err, stack){
      TLogger.error('Dio request failed with unknown error: ${err.toString()}');
      TLogger.debug('Stack: ${stack.toString()}');
      final fallbackResponse = Response(
        requestOptions: RequestOptions(
          path: fallbackPath,
        ),
        statusCode:500,
        data: {
          'error': err.toString()
        }
      );

      return _responseHandler(fallbackResponse, dataParser);
    }
  }

  Future<TResponse<T>>post<T>(
    String url,
    {
      Map<String, String>? fields,
      Map<String, String>? headers,
      List<MultipartFileData>? files,
      required T Function(Map<String, dynamic>) dataParser
    }
  ) => _sendWithMethod("POST", url, dataParser: dataParser);

  Future<TResponse<T>> put<T>(
    String url,
    {
      Map<String, String>? fields,
      Map<String, String>? headers,
      List<MultipartFileData>? files,
      required T Function(Map<String, dynamic>) dataParser
    }
  ) => _sendWithMethod("PUT", url, dataParser: dataParser);

  Future<TResponse<T>> get<T>({
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    required T Function(Map<String, dynamic>) dataParser
  }){
    return _request(
      () => _dio.get(url, queryParameters: queryParameters, options: Options(headers: headers)), 
      dataParser, 
      url
    );
  }

  Future<TResponse<T>> delete<T>({
     required String url,
    Map<String, String>? queryParameters,
    Map<String, String>? headers,
    required T Function(Map<String, dynamic>) dataParser
  }){
    return _request(
      () => _dio.delete(
        url,
        queryParameters: queryParameters,
        options: Options(headers: headers)
      ), 
      dataParser, 
      url
    );
  }


  Future<FormData> _attachFiles(List<MultipartFileData> files, FormData formData) async{
    //return immediately when files is empty
    if(files.isEmpty){
      return formData;
    }
    final fileResponse = await Future.wait(
      files.map((f) => TFileUtility.loadFileInIsolate(f.fieldName, f.filePath)
      ).toList(),
      eagerError: true
    );

    for( var i = 0; i < fileResponse.length; i++){
      final file = fileResponse[i];
      final original = files[i];

      if(file.error != null || file.bytes == null) {
        throw Exception(
          "Parsing file ${original.filePath} failed: ${file.error ?? 'Unknown Error'}"
        );
      }
      formData.files.add(
        MapEntry(
          original.fieldName, 
          MultipartFile.fromBytes(
            file.bytes!,
            filename: file.fileName ?? original.filePath.split('/').last
          )
        )
      );
    }
    return formData;
  }

  Future<TResponse<T>> _sendWithMethod<T>(
    String method,
    String url, {
    Map<String, String>? fields,
    Map<String, String>? headers,
    List<MultipartFileData>? files,
    required T Function(Map<String, dynamic>) dataParser,
  }) {
    if (files != null && files.isNotEmpty) {
      return _request(
        () async {
          final formData = await _attachFiles(files, FormData()..fields.addAll(fields?.entries ?? []));
          return _dio.request(url,
            data: formData,
            options: Options(method: method, headers: {...?headers, 'Content-Type': 'multipart/form-data'}),
          );
        },
        dataParser,
        url,
      );
    }

    return _request(
      () => _dio.request(
        url,
        data: jsonEncode(fields),
        options: Options(
          method: method, 
          headers: {...?headers, 'Content-Type': 'application/json'}
        ),
      ),
      dataParser,
      url,
    );
  }

  TResponse<T> _responseHandler<T>(
    Response response,
    T Function(Map<String, dynamic>) dataParser
  ){
      return TResponse<T>.fromDioResponse(
      response,
      fromData: dataParser as dynamic
    );
  }

}


