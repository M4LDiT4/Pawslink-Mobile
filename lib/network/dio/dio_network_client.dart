import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:mobile_app_template/core/utils/file/file_utility.dart';
import 'package:mobile_app_template/core/utils/logger/logger.dart';
import 'package:mobile_app_template/network/dio/auth_interceptor.dart';
import 'package:mobile_app_template/network/dio/connection_interceptor.dart';
import 'package:mobile_app_template/network/multipart_file_data.dart';
import 'package:mobile_app_template/network/network_client.dart';
import 'package:mobile_app_template/network/operation_response.dart';
import 'package:mobile_app_template/services/api/authentication.dart';
import 'package:path_provider/path_provider.dart';

class DioNetworkClient extends NetworkClient {

  static final DioNetworkClient _instance = DioNetworkClient._internal();

  factory DioNetworkClient() => _instance;

  DioNetworkClient._internal();

  late final Dio _dio;

  Future<void> init() async{
    final cacheDir = await getTemporaryDirectory();
    final cacheOptions = CacheOptions(
      store: HiveCacheStore(cacheDir.path),
      policy: CachePolicy.request,
      hitCacheOnErrorExcept: [401, 403],
      maxStale: const Duration(days: 7)
    );

    _dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        contentType: 'application/json', //requests are json on default
        responseType: ResponseType.json, //responses are json in default
      )
    );

    _dio.interceptors.addAll(
      [
        DioCacheInterceptor(options: cacheOptions),

        ConnectionInterceptor(),

        AuthInterceptor(
          getAccessToken: TAuthenticationService().getAccesstoken, 
          rotateToken: TAuthenticationService().rotateToken, 
          dio: _dio
        ),

        RetryInterceptor(
          dio: _dio,
          retries: 3,
          retryDelays: const [
            Duration(seconds: 1),
            Duration(seconds: 2),
            Duration(seconds: 3)
          ],
          logPrint: print
        )
      ],
    );
  }


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
  Future<OperationResponse<T>>post<T>(
    String url,
    {
      Map<String, String>? fields,
      Map<String, String>? headers,
      List<MultipartFileData>? files,
      required T Function(dynamic) dataParser
    }
  ) => _sendWithMethod("POST", url, dataParser: dataParser);
  @override
  Future<OperationResponse<T>> put<T>(
    String url,
    {
      Map<String, String>? fields,
      Map<String, String>? headers,
      List<MultipartFileData>? files,
      required T Function(dynamic) dataParser
    }
  ) => _sendWithMethod("PUT", url, dataParser: dataParser);
  @override
  Future<OperationResponse<T>> get<T>(
    String url,
    {
      Map<String, dynamic>? queryParameters,
      Map<String, String>? headers,
      required T Function(dynamic) dataParser
    }
  ){
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
      Map<String, String>? queryParameters,
      Map<String, String>? headers,
      required T Function(dynamic) dataParser
    }
  ){
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

  Future<OperationResponse<T>> _sendWithMethod<T>(
    String method,
    String url, {
    Map<String, String>? fields,
    Map<String, String>? headers,
    List<MultipartFileData>? files,
    required T Function(dynamic) dataParser,
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

  OperationResponse<T> _responseHandler<T>(
    Response response,
    T Function(dynamic) dataParser
  ){
    return OperationResponse.fromDioResponse(
      response, 
      parser: dataParser
    );
  }

}


