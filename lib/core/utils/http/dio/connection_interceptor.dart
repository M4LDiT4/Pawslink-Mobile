
import 'dart:io';

import 'package:dio/dio.dart';

class ConnectionInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.error is SocketException) {

      final newError = DioException(
        requestOptions: err.requestOptions,
        type: DioExceptionType.unknown,
        error: 'No internet connection',
        response: Response(
          requestOptions: err.requestOptions,
          statusCode: 503,
          data: {
            'error': 'No internet connection. Check your connection and try again',
          },
        ),
      );

      handler.next(newError); // replaces the error
    }

    // Always forward the error if it's not handled above
    handler.next(err);
  }
}
