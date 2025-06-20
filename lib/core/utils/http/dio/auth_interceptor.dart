import 'package:dio/dio.dart';
import 'package:mobile_app_template/core/utils/logger/logger.dart';

/// Intercepts HTTP requests to attach authentication tokens,
/// refreshes expired tokens on 401, and retries queued requests.
class AuthInterceptor extends Interceptor {
  final Future<String?> Function() getAccessToken;
  final Future<void> Function() rotateToken;
  final Dio dio;

  bool _isRefreshing = false;
  final List<_QueuedRequest> _queuedRequests = [];

  AuthInterceptor({
    required this.getAccessToken,
    required this.rotateToken,
    required this.dio,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      final token = await getAccessToken();
      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }

      // Store dio in extra for retry context
      options.extra['dio'] = dio;
      handler.next(options);
    } catch (e) {
      TLogger.error("Error attaching token: $e");
      handler.next(options); // proceed without token
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    TLogger.warning("Request failed with error: ${err.response?.statusCode} ${err.message}");

    final isUnauthorized = err.response?.statusCode == 401;

    if (isUnauthorized) {
      if (!_isRefreshing) {
        _isRefreshing = true;

        rotateToken().then((_) async {
          final newToken = await getAccessToken();
          if (newToken != null) {
            // Retry all queued requests
            for (final request in _queuedRequests) {
              final updatedOptions = request.options.copyWith(
                headers: {
                  ...request.options.headers,
                  'Authorization': 'Bearer $newToken',
                },
              );

              try {
                final response = await request.dio.fetch(updatedOptions);
                request.handler.resolve(response);
              } catch (e) {
                request.handler.reject(e as DioException);
              }
            }

            _queuedRequests.clear();

            // Retry the current failed request
            final updatedOptions = err.requestOptions.copyWith(
              headers: {
                ...err.requestOptions.headers,
                'Authorization': 'Bearer $newToken',
              },
            );

            try {
              final response = await dio.fetch(updatedOptions);
              handler.resolve(response);
            } catch (e) {
              handler.reject(e as DioException);
            }
          } else {
            TLogger.warning("Token refresh returned null");
            handler.next(err);
          }

          _isRefreshing = false;
        }).catchError((error) {
          TLogger.error("Token refresh failed: $error");
          _isRefreshing = false;
          handler.next(err);
        });
      } else {
        // Queue current request until refresh completes
        _queuedRequests.add(
          _QueuedRequest(
            dio: err.requestOptions.extra['dio'] ?? dio,
            options: err.requestOptions,
            handler: handler,
          ),
        );
      }
    } else {
      // Forward other errors
      handler.next(err);
    }
  }
}

/// Internal class to hold requests waiting for token refresh
class _QueuedRequest {
  final Dio dio;
  final RequestOptions options;
  final ErrorInterceptorHandler handler;

  _QueuedRequest({
    required this.dio,
    required this.options,
    required this.handler,
  });
}
