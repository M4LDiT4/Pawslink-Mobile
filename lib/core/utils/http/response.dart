import 'dart:convert';

import 'package:http/http.dart' as http;


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

  factory TResponse.fromJson(Map<String, dynamic> json) {
    return TResponse<T>(
      success: json['success'] ?? false,
      message: json['message'],
      data: json['data'] != null ? json['data'] as T : null,
      statusCode: json['statusCode'] ?? 200,
    );
  }

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
}