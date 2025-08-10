import 'package:mobile_app_template/network/multipart_file_data.dart';
import 'package:mobile_app_template/network/operation_response.dart';

abstract class NetworkClient {
  Future<OperationResponse<T>> post<T> (
    String url,
    {    
      Map<String, String>? fields,
      Map<String, String>? headers,
      List<MultipartFileData>? files,
      required T Function(dynamic) dataParser
    }
  );

  Future<OperationResponse<T>> put<T> (
    String url,
    {
      required T Function(dynamic) dataParser,
      Map<String, String>? fields,
      Map<String, String>? headers,
      List<MultipartFileData>? files,
    }
  );

  Future<OperationResponse<T>> get<T> (
    String url,
    {
      required T Function(dynamic) dataParser,
      Map<String, dynamic>? queryParameters,
      Map<String, String>? headers
    }
  );

  Future<OperationResponse<T>> delete<T> (
    String url,
    {
      required T Function(dynamic) dataParser,
      Map<String, String>? queryParameters,
      Map<String, String>? headers
    }
  );
}