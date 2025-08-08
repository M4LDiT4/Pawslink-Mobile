import 'package:mobile_app_template/network/multipart_file_data.dart';
import 'package:mobile_app_template/network/response.dart';

abstract class NetworkClient {
  Future<TResponse<T>> get<T> ({
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    required T Function(Map<String, dynamic>) dataParser
  });

  Future<TResponse<T>> delete<T> ({
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    required T Function(Map<String, dynamic>) dataParser
  });

  Future<TResponse<T>> postJson<T> ({
    required String url,
    required dynamic body,
    Map<String, String>? headers,
    required T Function(Map<String, dynamic>) dataParser
  });

  Future<TResponse<T>> putJson<T>({
    required String url,
    required dynamic body,
    Map<String, String>? headers,
    required T Function(Map<String, dynamic>) dataParser
  });

  Future<TResponse<T>> postMultipart<T> ({
    required String url,
    Map<String, String>? fields,
    Map<String, String>? headers,
    List<MultipartFileData>? files,
    required T Function(Map<String, dynamic>) dataParser
  });

  Future<TResponse<T>> putMultipart<T>({
    required String url,
    Map<String, String>? fields,
    Map<String, String>? headers,
    List<MultipartFileData>? files,
    required T Function(Map<String, dynamic>) dataParser
  });

}