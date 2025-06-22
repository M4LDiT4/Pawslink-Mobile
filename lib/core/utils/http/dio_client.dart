import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_app_template/core/utils/http/dio/auth_interceptor.dart';
import 'package:mobile_app_template/core/utils/http/dio/connection_interceptor.dart';
import 'package:mobile_app_template/core/utils/http/response.dart';
import 'package:mobile_app_template/core/utils/logger/logger.dart';
import 'package:mobile_app_template/services/api/authentication.dart';
import 'package:path_provider/path_provider.dart';

class DioHTTPHelper {
  static final DioHTTPHelper _instance = DioHTTPHelper._internal();
  late final Dio _dio;

  factory DioHTTPHelper() => _instance;

  DioHTTPHelper._internal() {
    _init();
  }

  Future<void> _init() async {
    final cacheDir = await getTemporaryDirectory();
    final cacheOptions = CacheOptions(
      store: HiveCacheStore(cacheDir.path),
      policy: CachePolicy.request,
      hitCacheOnErrorExcept: [401, 403],
      maxStale: const Duration(days: 7),
    );

    _dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        contentType: 'application/json',
        responseType: ResponseType.json,
      ),
    );

    _dio.interceptors.addAll([
      DioCacheInterceptor(options: cacheOptions),

      ConnectionInterceptor(),

      AuthInterceptor(
        getAccessToken: TAuthenticationService().getAccesstoken,
        rotateToken: TAuthenticationService().rotateToken,
        dio: _dio,
      ),
      RetryInterceptor(
        dio: _dio,
        retries: 3,
        retryDelays: const [
          Duration(seconds: 1),
          Duration(seconds: 2),
          Duration(seconds: 3),
        ],
        logPrint: print,
      ),
    ]);
  }

  Future<TResponse<T>> get<T>({
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      final response = await _dio.get(url, queryParameters: queryParameters, options: Options(headers: headers));
      return _handleResponse<T>(response, fromJson);
    } on DioException catch (e) {
      TLogger.error('Dio Exception: ${e.toString()}');
      final response = e.response ?? Response(
        requestOptions: RequestOptions(path: url),
        statusCode: 500,
        data: {'error': e.message ?? 'No response received'},
      );
      return _handleResponse<T>(response, fromJson);
    } catch (e, stack) {
      TLogger.error('Unknown error: $e\n$stack');
      final fallbackResponse = Response(
        requestOptions: RequestOptions(path: url),
        statusCode: 500,
        data: {'error': e.toString()},
      );
      return _handleResponse<T>(fallbackResponse, fromJson);
    }
  }

  Future<TResponse<T>> delete<T>({
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      final response = await _dio.delete(url, queryParameters: queryParameters, options: Options(headers: headers));
      return _handleResponse<T>(response, fromJson);
    } on DioException catch (e) {
      TLogger.error('Dio Exception: ${e.toString()}');
      final response = e.response ?? Response(
        requestOptions: RequestOptions(path: url),
        statusCode: 500,
        data: {'error': e.message ?? 'No response received'},
      );
      return _handleResponse<T>(response, fromJson);
    } catch (e, stack) {
      TLogger.error('Unknown error: $e\n$stack');
      final fallbackResponse = Response(
        requestOptions: RequestOptions(path: url),
        statusCode: 500,
        data: {'error': e.toString()},
      );
      return _handleResponse<T>(fallbackResponse, fromJson);
    }
  }

  Future<TResponse<T>> postJson<T>({
    required Uri uri,
    required dynamic body,
    Map<String, String>? headers,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      final response = await _dio.post(uri.toString(), data: jsonEncode(body), options: Options(headers: {
        'Content-Type': 'application/json',
        ...?headers,
      }));
      return _handleResponse<T>(response, fromJson);
    } on DioException catch (e) {
      TLogger.error('Dio Exception: ${e.toString()}');
      final response = e.response ?? Response(
        requestOptions: RequestOptions(path: uri.toString()),
        statusCode: 500,
        data: {'error': e.message ?? 'No response received'},
      );
      return _handleResponse<T>(response, fromJson);
    } catch (e, stack) {
      TLogger.error('Unknown error: $e\n$stack');
      final fallbackResponse = Response(
        requestOptions: RequestOptions(path: uri.toString()),
        statusCode: 500,
        data: {'error': e.toString()},
      );
      return _handleResponse<T>(fallbackResponse, fromJson);
    }
  }

  Future<TResponse<T>> putJson<T>({
    required String url,
    required dynamic body,
    Map<String, String>? headers,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      final response = await _dio.put(url, data: jsonEncode(body), options: Options(headers: {
        'Content-Type': 'application/json',
        ...?headers,
      }));
      return _handleResponse<T>(response, fromJson);
    } on DioException catch (e) {
      TLogger.error('Dio Exception: ${e.toString()}');
      final response = e.response ?? Response(
        requestOptions: RequestOptions(path: url),
        statusCode: 500,
        data: {'error': e.message ?? 'No response received'},
      );
      return _handleResponse<T>(response, fromJson);
    } catch (e, stack) {
      TLogger.error('Unknown error: $e\n$stack');
      final fallbackResponse = Response(
        requestOptions: RequestOptions(path: url),
        statusCode: 500,
        data: {'error': e.toString()},
      );
      return _handleResponse<T>(fallbackResponse, fromJson);
    }
  }

  Future<TResponse<T>> postForm<T>({
    required String url,
    required Map<String, String> fields,
    Map<String, String>? headers,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      final response = await _dio.post(url, data: FormData.fromMap(fields), options: Options(headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        ...?headers,
      }));
      return _handleResponse<T>(response, fromJson);
    } on DioException catch (e) {
      TLogger.error('Dio Exception: ${e.toString()}');
      final response = e.response ?? Response(
        requestOptions: RequestOptions(path: url),
        statusCode: 500,
        data: {'error': e.message ?? 'No response received'},
      );
      return _handleResponse<T>(response, fromJson);
    } catch (e, stack) {
      TLogger.error('Unknown error: $e\n$stack');
      final fallbackResponse = Response(
        requestOptions: RequestOptions(path: url),
        statusCode: 500,
        data: {'error': e.toString()},
      );
      return _handleResponse<T>(fallbackResponse, fromJson);
    }
  }

  Future<TResponse<T>> putForm<T>({
    required String url,
    required Map<String, String> fields,
    Map<String, String>? headers,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      final response = await _dio.put(url, data: FormData.fromMap(fields), options: Options(headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        ...?headers,
      }));
      return _handleResponse<T>(response, fromJson);
    } on DioException catch (e) {
      TLogger.error('Dio Exception: ${e.toString()}');
      final response = e.response ?? Response(
        requestOptions: RequestOptions(path: url),
        statusCode: 500,
        data: {'error': e.message ?? 'No response received'},
      );
      return _handleResponse<T>(response, fromJson);
    } catch (e, stack) {
      TLogger.error('Unknown error: $e\n$stack');
      final fallbackResponse = Response(
        requestOptions: RequestOptions(path: url),
        statusCode: 500,
        data: {'error': e.toString()},
      );
      return _handleResponse<T>(fallbackResponse, fromJson);
    }
  }

  Future<TResponse<T>> postMultipart<T>({
    required Uri url,
    Map<String, String>? fields,
    Map<String, String>? headers,
    List<MapEntry<String, MultipartFile>>? files,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    final data = FormData();

    // Add fields
    if (fields != null) data.fields.addAll(fields.entries);

    // Add files with keys like file0, file1, ...
    if (files != null) {
      data.files.addAll(files);
    }

    try {
      final response = await _dio.post(
        url.toString(),
        data: data,
        options: Options(headers: {
          'Content-Type': 'multipart/form-data',
          ...?headers,
        }),
      );
      return _handleResponse<T>(response, fromJson);
    } on DioException catch (e) {
      TLogger.error('Dio Exception: ${e.message}');
      final response = e.response ??
          Response(
            requestOptions: RequestOptions(path: url.toString()),
            statusCode: 500,
            data: {'error': e.message},
          );
      return _handleResponse<T>(response, fromJson);
    } catch (e) {
      TLogger.error('Unknown error: $e\n');
      final fallbackResponse = Response(
        requestOptions: RequestOptions(path: url.toString()),
        statusCode: 500,
        data: {'error': e.toString()},
      );
      return _handleResponse<T>(fallbackResponse, fromJson);
    }
  }


  Future<TResponse<T>> putMultipart<T>({
    required String url,
    Map<String, String>? fields,
    List<MultipartFile>? files,
    Map<String, String>? headers,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    final data = FormData();
    if (fields != null) data.fields.addAll(fields.entries);
    if (files != null) data.files.addAll(List.generate(files.length, (i) => MapEntry("file$i", files[i])));

    try {
      final response = await _dio.put(url, data: data, options: Options(headers: headers));
      return _handleResponse<T>(response, fromJson);
    } on DioException catch (e) {
      TLogger.error('Dio Exception: ${e.toString()}');
      final response = e.response ?? Response(
        requestOptions: RequestOptions(path: url),
        statusCode: 500,
        data: {'error': e.message ?? 'No response received'},
      );
      return _handleResponse<T>(response, fromJson);
    } catch (e, stack) {
      TLogger.error('Unknown error: $e\n$stack');
      final fallbackResponse = Response(
        requestOptions: RequestOptions(path: url),
        statusCode: 500,
        data: {'error': e.toString()},
      );
      return _handleResponse<T>(fallbackResponse, fromJson);
    }
  }

  TResponse<T> _handleResponse<T>(Response response, T Function(Map<String, dynamic>) fromJson) {
    try {
      TLogger.info(response.toString());
      final Map<String, dynamic> data = response.data;
      final isSuccess = response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300;

      return TResponse<T>(
        success: isSuccess,
        message: data['error']?.toString() ?? (isSuccess ? 'Success' : 'Unknown error occurred'),
        data: data['data'] != null ? fromJson(data['data']) : null,
        statusCode: response.statusCode ?? 400,
      );
    } catch (e) {
      return TResponse<T>(
        success: false,
        message: e.toString(),
        data: null,
        statusCode: response.statusCode ?? 400,
      );
    }
  }

  static Future<MultipartFile> createMultiPartFileFromXFile(XFile file) {
    return MultipartFile.fromFile(file.path, filename: file.name);
  }

  static Map<String, dynamic> defaultFromJson(Map<String, dynamic> json) => json;

}
