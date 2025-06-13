import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  final Future<String?> Function() getToken;
  final Future<String?> Function() refreshToken;
  final void Function(String newToken) saveToken;

  bool _isRefreshing = false;
  final List<_QueuedRequest> _queuedRequests = [];

  AuthInterceptor({
    required this.getToken,
    required this.refreshToken,
    required this.saveToken,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await getToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final isUnauthorized = err.response?.statusCode == 401;

    if (isUnauthorized && !_isRefreshing) {
      _isRefreshing = true;

      try {
        final newToken = await refreshToken();

        if (newToken != null) {
          saveToken(newToken);

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
        } else {
          handler.next(err);
        }
      } catch (_) {
        handler.next(err);
      } finally {
        _isRefreshing = false;
      }
    } else if (isUnauthorized && _isRefreshing) {
      // Queue the request while token is being refreshed
      _queuedRequests.add(
        _QueuedRequest(
          dio: err.requestOptions.extra['dio'],
          options: err.requestOptions,
          handler: handler,
        ),
      );
    } else {
      handler.next(err);
    }
  }
}

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
