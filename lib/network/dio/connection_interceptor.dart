
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mobile_app_template/core/utils/logger/logger.dart';

class ConnectionInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    TLogger.error("Failed with error: ${err.response?.statusCode} ${err.message}");
    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.error is SocketException) {

      final newError = DioException(
        requestOptions: err.requestOptions,
        type: DioExceptionType.unknown,
        error: 'Connection Error',
        response: Response(
          requestOptions: err.requestOptions,
          statusCode: 503,
          data: {
            'error': 'Problem connecting to the server',
          },
        ),
      );

      handler.reject(newError); // replaces the error
      return; //prevents fall through of error 
    }

    // Always forward the error if it's not handled above
    handler.next(err);
  }
}
