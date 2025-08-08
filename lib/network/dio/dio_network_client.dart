import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mobile_app_template/core/utils/logger/logger.dart';
import 'package:mobile_app_template/network/multipart_file_data.dart';
import 'package:mobile_app_template/network/network_client.dart';
import 'package:mobile_app_template/network/response.dart';

class DioNetworkClient extends NetworkClient {
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

  @override
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

  @override
  Future<TResponse<T>> delete<T>({
     required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    required T Function(Map<String, dynamic>) dataParser
  }){
    return _request(
      () => _dio.delete(
        url,
        options: Options(headers: headers)
      ), 
      dataParser, 
      url
    );
  }

  @override 
  Future<TResponse<T>> postJson<T>({
    required String url,
    required dynamic body,
    Map<String, String>? headers,
    required T Function(Map<String, dynamic>) dataParser
  }){
    return _request(
      () => _dio.post(
        url,
        data: jsonEncode(body),
        options:Options(
          headers: {...?headers, 'Content-Type': 'application/json'}
        )
      ), dataParser, 
      url  
    );
  }

  @override
  Future<TResponse<T>> putJson<T>({
    required String url,
    required dynamic body,
    Map<String, String>? headers,
    required T Function(Map<String, dynamic>) dataParser
  }){
    return _request(
      () => _dio.put(
        url,
        data:jsonEncode(body),
        options: Options(
          headers: {...?headers, 'Content-Type': 'application/json' }
        )
      ), 
      dataParser, 
      url
    );
  }

  @override 
  Future<TResponse<T>> postMultipart<T>({
    required String url,
    Map<String, String>? fields,
    Map<String, String>? headers,
    List<MultipartFileData>? files,
    required T Function(Map<String, dynamic>) dataParser
  }){
    return _sendMultipart(method: 'POST', url: url, dataParser: dataParser);
  }

  @override
  Future<TResponse<T>> putMultipart<T>({
    required String url,
    Map<String, String>? fields,
    Map<String, String>? headers,
    List<MultipartFileData>? files,
    required T Function(Map<String, dynamic>) dataParser
  }){
    return _sendMultipart(method: 'PUT', url: url, dataParser: dataParser);
  }

  Future<TResponse<T>> _sendMultipart<T>({
    required String method,
    required String url,
    Map<String, String>? fields,
    Map<String, String>? headers,
    List<MultipartFileData>? files,
    required T Function(Map<String, dynamic>) dataParser,
  }){
    final formData = FormData();
    if(fields != null) formData.fields.addAll(fields.entries);

    if(files != null){
      for(final f in files){
        formData.files.add(MapEntry(
            f.fieldName,
            MultipartFile.fromFileSync(f.filePath, filename: f.fileName) 
          )
        );
      }
    }

    return _request(
      () => _dio.request(
        url,
        data: formData,
        options: Options(
          method: method,
          headers: {...?headers, 'Content-Type': 'multipart/form-data'}
        )
      ),
      dataParser,
      url
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


