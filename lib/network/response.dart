import 'dart:convert';

import 'package:get/get_connect/connect.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_app_template/core/utils/logger/logger.dart';
import 'package:dio/dio.dart' as dio;

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
class TResponse<T> {
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
  /// Generates a [TResponse] object from a JSON map.
  factory TResponse.fromJson(
    Map<String, dynamic> json, {
    T Function(dynamic)? fromData,
    String? fieldName = "data",
    bool? isSuccessful,
    int? statusCode,
  }) {
    T? parsedData;

    try {
      final value = json[fieldName];
      if (value != null) {
        if (fromData != null) {
          // Handle lists automatically
          if (value is List) {
            parsedData = value.map((e) => fromData(e)).toList() as T;
          } else {
            parsedData = fromData(value);
          }
        } else if (value is T) {
          parsedData = value;
        } else if (T != dynamic && value is Map<String, dynamic>) {
          // Custom object without parser → throw explicit error
          throw FormatException(
              "Custom object type $T for '$fieldName' requires a fromData parser");
        }
      }
    } catch (err) {
      TLogger.error(
        "Failed to parse '$fieldName' as $T in [fromJson]: ${err.toString()}",
      );
      parsedData = null;
    }

    return TResponse<T>(
      success: isSuccessful ?? json['success'] ?? false,
      message: json['message'] ?? json['error']?.toString() ?? 'No Message Provided',
      data: parsedData,
      statusCode: statusCode ?? json['statusCode'] ?? 200,
    );
  }

  /// ## fromHttpResponse
  /// Generates a [TResponse] object from an [http.Response].
  factory TResponse.fromHttpResponse(
    http.Response response, {
    T Function(dynamic)? fromData,
    String fieldName = 'data',
  }) {
    try {
      if (response.body.isEmpty) {
        throw const FormatException("Empty response body");
      }

      final jsonResponse = json.decode(response.body);

      if (jsonResponse is! Map<String, dynamic>) {
        throw FormatException(
          "Expects JSON object, received: ${jsonResponse.runtimeType}",
        );
      }

      // Success is true if statusCode is 2xx, even if the API doesn't explicitly say so
      final isSuccess = response.statusCode >= 200 && response.statusCode < 300;

      return TResponse<T>.fromJson(
        jsonResponse,
        fromData: fromData,
        fieldName: fieldName,
        isSuccessful: isSuccess,
        statusCode: response.statusCode,
      );
    } catch (err) {
      TLogger.error("Failed to parse http response: ${err.toString()}");
      final isSuccess = response.statusCode >= 200 && response.statusCode < 300;
      return TResponse<T>(
        success: isSuccess,
        message: isSuccess ? 'Success (non-JSON)' : 'Failed to parse response',
        data: null,
        statusCode: response.statusCode,
      );
    }
  }

  factory TResponse.fromDioResponse(
    dio.Response response,
   { T Function(dynamic)? fromData,
    String fieldName = 'data'}
  ){
    try{
      if(response.data.isEmpty){
        throw const FormatException('Empty response body');
      }
      final jsonResponse = jsonDecode(response.data);

      if(jsonResponse is! Map<String, dynamic>){
        throw FormatException('Expects JSON object: received: ${jsonResponse.runtimeType}');
      }

      bool? isSuccessful;
      if(response.statusCode != null){
        isSuccessful = response.statusCode! >= 200 && response.statusCode! < 300;
      }

      return TResponse.fromJson(
        jsonResponse,
        fromData: fromData,
        isSuccessful: isSuccessful,
        statusCode: response.statusCode
      );
    }catch(err){
      TLogger.error('Failed to parse dio Response: ${err.toString()}');
      return TResponse.failed(
        message: 'Failed to parse dio Response: ${err.toString()}',
        statusCode: response.statusCode ?? 400
      );
    }
  }

  /// ## successful
  /// Generates a successful response template
  factory TResponse.successful({String? message, int? statusCode}) {
    return TResponse<T>(
      success: true,
      statusCode: statusCode ?? 200,
      message: message ?? 'Operation successful',
    );
  }

  /// ## failed
  /// Generates a failed response template
  factory TResponse.failed({String? message, int? statusCode}) {
    return TResponse<T>(
      success: false,
      statusCode: statusCode ?? 400,
      message: message ?? "Operation Failed",
    );
  }

  /// Checks if the response is successful
  bool get isSuccessful => success;

  /// Presents the data in a readable [String] format
  @override
  String toString() {
    return 'TResponse<$T>(success: $success, statusCode: $statusCode, message: $message, data: ${jsonEncode(data)})';
  }
}
