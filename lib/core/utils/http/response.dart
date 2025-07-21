import 'dart:convert';

import 'package:http/http.dart' as http;

/// ## TResponse
/// Custom class for storing responses from repositories and services
/// 
/// This class:
/// - generates [TResponse] object from JSON
/// - generates [TResponse] object from [http.Response]
/// - allows dynamic classes for the [data] field
/// - automatically parses data from service and repository responses based on pre-set fields
/// ### Properties
/// - **[success]**: state that determines if the request is success or failure
/// - **[message]**: additional information for the result of the request
/// - **[data]**: data returned from the request
/// - **[statusCode]**: status code of the request
/// - 
class TResponse<T>{
  final bool success;
  final String? message;
  final T? data;
  final int statusCode;
  
  TResponse({
    required this.success,
    this.message,
    this.data,
    required this.statusCode,
  });

  /// ### fromJSON
  /// Generates a [TResponse] object from a json
  /// 
  /// This method
  /// - assumes that the json object has a success field which determines if the 
  /// request succeeded or not. Defaults to false if json object has no succes property
  /// - assumes that the json object has message property. Defaults to null if
  /// message property does not exist
  /// - assumes the json object has data field. If present parses the value of the data field 
  /// to the provided data type, otherwise provide null as value
  /// - assumes that the json object has statusCode field. Defaults to 200  
  /// 
  /// ### Parameters
  /// - **[json]**: object from which data, success, message and statusCode values will be derived from.
  /// Ideally this is for parsing values from custom API's
  /// 
  /// ### Returns
  /// [TResponse] object representation based on the given json object
  factory TResponse.fromJson(Map<String, dynamic> json) {
    return TResponse<T>(
      success: json['success'] ?? false,
      message: json['message'],
      data: json['data'] != null ? json['data'] as T : null,
      statusCode: json['statusCode'] ?? 200,
    );
  }

  /// ## fromHttpResponse
  /// Generates a [TResponse] object from a [http.Response] object
  /// 
  /// This method:
  /// - decodes the [http.Response] body to JSON
  /// - checks if [http.Response] object failed or succeeded
  /// - generates [TResponse] object from the given response object
  /// - if json parsing fails, return a [TResponse] object with [data] field = `null`
  /// 
  /// ### Parameters
  /// - **[response]**: response from service/repository call
  /// 
  /// ### Returns
  /// [TResponse] object that is derived from the [response]
  factory TResponse.fromHttpResponse(http.Response response) {
    try {
      final jsonResponse = json.decode(response.body);

      // Success is true if statusCode is 2xx, even if the API doesn't explicitly say so
      final isSuccess = response.statusCode >= 200 && response.statusCode < 300;

      return TResponse<T>(
        success: isSuccess,
        message: jsonResponse['error']?.toString() ?? (isSuccess ? 'Success' : 'Unknown error'),
        data: jsonResponse['data'] != null ? jsonResponse['data'] as T : null,
        statusCode: response.statusCode,
      );
    } catch (e) {
      // If response body isn't JSON or decoding fails
      final isSuccess = response.statusCode >= 200 && response.statusCode < 300;
      return TResponse<T>(
        success: isSuccess,
        message: isSuccess ? 'Success (non-JSON)' : 'Failed to parse response',
        data: null,
        statusCode: response.statusCode,
      );
    }
  }
  bool get isSuccess => success;


  ///presents the data in a easily readible [String] format
  @override
  String toString() {
    return 'TResponse<$T>(success: $success, statusCode: $statusCode, message: $message, data: ${jsonEncode(data)})';
  }
}