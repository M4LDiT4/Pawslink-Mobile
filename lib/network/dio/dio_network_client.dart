import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:mobile_app_template/core/utils/file/file_load_response.dart';
import 'package:mobile_app_template/core/utils/file/file_utility.dart';
import 'package:mobile_app_template/core/utils/logger/logger.dart';

import 'package:mobile_app_template/network/multipart_file_data.dart';
import 'package:mobile_app_template/network/network_client.dart';
import 'package:mobile_app_template/network/operation_response.dart';


class DioNetworkClient extends NetworkClient {

  late final Dio _dio;

  DioNetworkClient(Dio dio): _dio = dio;

  Future<OperationResponse<T>> _request<T>(
    Future<Response> Function() requestFn,
    T Function(dynamic) dataParser,
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
          statusCode: _mapDioErrorToStatusCode(err),
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
  Future<OperationResponse<T>>post<T>(
    String url,
    {
      Map<String, String>? fields,
      Map<String, String>? headers,
      List<MultipartFileData>? files,
      T Function(dynamic)? dataParser
    }
  ) => _sendWithMethod(
    "POST", 
    url, 
    dataParser: dataParser,
    fields: fields,
    headers: headers,
    files: files
  );
  @override
  Future<OperationResponse<T>> put<T>(
    String url,
    {
      Map<String, String>? fields,
      Map<String, String>? headers,
      List<MultipartFileData>? files,
      T Function(dynamic)? dataParser
    }
  ) => _sendWithMethod(
    "PUT", 
    url, 
    dataParser: dataParser,
    fields: fields,
    headers: headers,
    files: files
  );
  @override
  Future<OperationResponse<T>> get<T>(
    String url,
    {
      Map<String, dynamic>? queryParameters,
      Map<String, String>? headers,
      T Function(dynamic)? dataParser
    }
  ){
    dataParser ??= defaultParser;
    return _request(
      () => _dio.get(url, queryParameters: queryParameters, options: Options(headers: headers)), 
      dataParser, 
      url
    );
  }
  @override
  Future<OperationResponse<T>> delete<T>(
    String url,
    {
      Map<String, dynamic>? queryParameters,
      Map<String, String>? headers,
      T Function(dynamic)? dataParser
    }
  ){
    dataParser ??= defaultParser;
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


  Future<FormData> _attachFiles(
    List<MultipartFileData> files,
    FormData formData, {
    Future<FileLoadResponse> Function(String, String)? fileLoader,
  }) async {
    // Use dependency injection for testability
    final loader = fileLoader ?? TFileUtility.loadFileInIsolate;

    // Return immediately when files is empty
    if (files.isEmpty) {
      return formData;
    }

    final fileResponse = await Future.wait(
      files.map((f) => loader(f.fieldName, f.filePath)).toList(),
      eagerError: true,
    );

    for (var i = 0; i < fileResponse.length; i++) {
      final file = fileResponse[i];
      final original = files[i];

      if (file.error != null || file.bytes == null) {
        throw Exception(
          "Parsing file ${original.filePath} failed: ${file.error ?? 'Unknown Error'}",
        );
      }

      formData.files.add(
        MapEntry(
          original.fieldName,
          MultipartFile.fromBytes(
            file.bytes!,
            filename: file.fileName ??
                original.filePath.split('/').last,
          ),
        ),
      );
    }
    return formData;
  }


  Future<OperationResponse<T>> _sendWithMethod<T>(
    String method,
    String url, {
    Map<String, String>? fields,
    Map<String, String>? headers,
    List<MultipartFileData>? files,
    T Function(dynamic)? dataParser,
  }) {
    dataParser ??= defaultParser; // default parser if dataParser is not provided
    //send form data if at least one file is attached
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

    //send a json string if there is no file/s attached
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

  OperationResponse<T> _responseHandler<T>(
    Response response,
    T Function(dynamic) dataParser
  ){
    return OperationResponse.fromDioResponse(
      response, 
      parser: dataParser
    );
  }

  int _mapDioErrorToStatusCode(DioException err) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
        return 408; // Request Timeout

      case DioExceptionType.receiveTimeout:
        return 504; // Gateway Timeout

      case DioExceptionType.badResponse:
        return err.response?.statusCode ?? 500;

      case DioExceptionType.cancel:
        return 499; // Client Closed Request

      case DioExceptionType.badCertificate:
        return 495; // SSL Certificate Error

      case DioExceptionType.connectionError:
        return 503; // Service Unavailable

      case DioExceptionType.unknown:
        return 520; // Unknown Error
    }
  }
  /// Parses the data as of the same type as the type parameter
  /// ### Parameters:
  /// - **[data]**: data from the [Response.data].
  /// If [Response.data] is a [Map], data is taken from the `data` field
  /// ### Notes:
  ///  - Parses the data to dynamic
  ///  - Assumes that if the [Response.data] is a [Map], the data will be taken from the
  /// `data` key of the map 
  T defaultParser<T>(dynamic data) => data as T;
}


