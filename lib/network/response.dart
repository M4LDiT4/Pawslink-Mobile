import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as dio;
import 'package:mobile_app_template/core/utils/logger/logger.dart';

/// ## TResponse
/// Generic class for storing API responses
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

  /// ### fromDioResponse
  /// Creates a `TResponse` from a `dio.Response`.
  factory TResponse.fromDioResponse(
    dio.Response response, {
    required T Function(dynamic) parser,
    String fieldName = 'data',
  }) {
    final parsedData = _decodeResponse(response.data);
    if(parsedData == null){
      return TResponse.nullResponse(
        message: 'Dio Null Response',
        statusCode: 200,
        isSuccessful: true
      );
    }
    return TResponse.parseFromJson(
      parsedData, 
      parser: parser,
      statusCode: response.statusCode,
      isSuccessful: response.statusCode != null? response.statusCode! >= 200 && response.statusCode! < 300: null 
    );
  }

  /// Creates a successful response template
  factory TResponse.successful({String? message, int? statusCode}) {
    return TResponse<T>(
      success: true,
      statusCode: statusCode ?? 200,
      message: message ?? 'Operation successful',
    );
  }

  /// Creates a failed response template
  factory TResponse.failed({String? message, int? statusCode}) {
    return TResponse<T>(
      success: false,
      statusCode: statusCode ?? 400,
      message: message ?? "Operation failed",
    );
  }

  factory TResponse.parseFromJson(
    Map<String, dynamic> json,{
      required Function(dynamic) parser,
      String targetField = 'data',
      bool? isSuccessful,
      int? statusCode,
      String? message
    }
  ){
    if(json[targetField] == null){
      throw const FormatException("JSON has no data field");
    }

    T? data;
    try{
      data = parser(json[targetField]);
    }catch(err, stack){
      TLogger.error("Parsing JSON to TResponse failed: ${err.toString()}");
      TLogger.debug('Stack: ${stack.toString()}');
      data = null;
    }

    return TResponse(
      success: isSuccessful ?? json['success'] ?? false, 
      statusCode: statusCode ?? json['statusCode'] ?? 400,
      data: data,
      message: message?? json['message'] ?? json['error'] ?? "No message provided"
    );
  }

  static Map<String, dynamic>? _decodeResponse(dynamic data){
    try{
      final parsedData = jsonDecode(data);
      return {'data': parsedData};
    }catch(err){
      TLogger.error("Failed to decode data: ${err.toString()}");
      return null;
    }
  }

  bool get isSuccessful => success;

  factory TResponse.nullResponse({
    String? message,
    int? statusCode,
    bool? isSuccessful
  }) => TResponse(
    success: isSuccessful?? false, 
    statusCode: statusCode ?? 400,
    message: message ?? 'Null Response',
    data: null
  );

  @override
  String toString() {
    return 'TResponse<$T>(success: $success, statusCode: $statusCode, message: $message, data: ${jsonEncode(data)})';
  }
}
