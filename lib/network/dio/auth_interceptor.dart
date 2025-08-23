import 'package:dio/dio.dart';
import 'package:mobile_app_template/core/navigation/routes/app_routes.dart';
import 'package:mobile_app_template/core/utils/helpers/ui_helpers.dart';
import 'package:mobile_app_template/core/utils/logger/logger.dart';
import 'package:mobile_app_template/navigation/navigation_service.dart';

/// ## AuthInterceptor
/// An interceptor for Dio that handles authentication by attaching access tokens to requests.
/// It also manages token rotation in case of 401 Unauthorized responses.
/// ### Parameters
/// - **[Future<String?> Function()]** getAccessToken: A function to retrieve the current access token.
/// - **[Future<void> Function()]** rotateToken: A function to refresh the access token.
/// - **[Dio]** dio: The Dio instance to use for making requests.
/// ### Usage
/// This interceptor should be added to the Dio instance to automatically handle token management.
/// It will attach the access token to outgoing requests and handle 401 errors by refreshing the token
/// and retrying the request.
/// It also queues requests that come in while a token refresh is in progress, retrying them once the
/// new token is available.
/// If the token refresh fails, it will reject all queued requests with an error.
/// If the token refresh returns null, it will reject all queued requests with a "Token refresh returned null" error.
////// Example:
/// ```dart
/// final dio = Dio();
/// dio.interceptors.add(AuthInterceptor(
///   getAccessToken: () async {
///     // Your logic to get the access token 
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

  /// Initializes the interceptor with the provided functions and Dio instance.
  /// This function is called when the interceptor is added to the Dio instance.
  /// It sets up the interceptor to automatically attach the access token to requests
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

  /// Handles errors that occur during the request.
  /// If a 401 Unauthorized error occurs, it attempts to refresh the token.
  /// If the token refresh is successful, it retries the failed request and all queued requests.
  /// If the token refresh fails, it rejects all queued requests with an error.
  /// If the token refresh returns null, it rejects all queued requests with a "Token refresh returned null" error.
  /// For other errors, it forwards the error to the next handler.
  ///
  /// This function is called when an error occurs during the request.
  /// It checks if the error is a 401 Unauthorized error and attempts to refresh the token
  /// If the token refresh is successful, it retries the failed request and all queued requests.
  /// If the token refresh fails, it rejects all queued requests with an error.
  /// If the token refresh returns null, it rejects all queued requests with a "Token refresh returned null" error.
  /// For other errors, it forwards the error to the next handler.
  ///
  /// @param err The error that occurred during the request.
  /// @param handler The error interceptor handler to use for forwarding the error or resolving the request.
  /// @returns void
  /// @throws DioException if the token refresh fails or returns null.
  /// @example
  /// ```dart
  /// dio.interceptors.add(AuthInterceptor(
  ///   getAccessToken: () async {
  ///     // Your logic to get the access token
  ///     return 'your_access_token';
  ///   },
  ///   rotateToken: () async {
  ///     // Your logic to refresh the access token
  ///   },          
  ///   dio: dio,
  /// ));
  /// ```
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    TLogger.warning("Request failed: ${err.response?.statusCode} ${err.message}");

    final isUnauthorized = err.response?.statusCode == 401;

    if (!isUnauthorized) {
      handler.next(err);
      return;
    }

    TLogger.debug('Not authorized — attempting token refresh');

    // If already refreshing, queue the request
    if (_isRefreshing) {
      _queuedRequests.add(
        _QueuedRequest(
          dio: err.requestOptions.extra['dio'] ?? dio,
          options: err.requestOptions,
          handler: handler,
        ),
      );
      return;
    }

    _isRefreshing = true;

    rotateToken().then((_) async {
      final newToken = await getAccessToken();

      if (newToken == null) {
        _rejectAllQueued("Token refresh returned null", DioExceptionType.badResponse);
        handler.reject(
          DioException(
            requestOptions: err.requestOptions,
            error: "Token refresh returned null",
            type: DioExceptionType.badResponse,
          ),
        );
        TUIHelpers.showStateSnackBar("Session expired. Please log in again.");
        TNavigationService.offAllNamed(TAppRoutes.login);
        return;
      }

      TLogger.debug("New access token: $newToken");

      // Retry queued requests
      await _retryQueuedRequests(newToken);

      // Retry the original request
      _retryOriginalRequest(err, handler, newToken);
    }).catchError((error) {
      TLogger.error("Token refresh failed: $error");

      _rejectAllQueued(error.toString(), DioExceptionType.unknown);

      handler.reject(
        DioException(
          requestOptions: err.requestOptions,
          error: error.toString(),
        ),
      );
    }).whenComplete(() {
      _isRefreshing = false;
    });
  }

  /// Retries all queued requests with the new access token.
  /// This function iterates through all queued requests, updates their options with the new token,
  /// and attempts to fetch the response for each request.
  /// If a request fails, it rejects the request with the error.
  /// ### Parameters
  /// - **[String]** token: The new access token to use for the requests.
  /// ### Returns
  /// - **[Future<void>]** A future that completes when all queued requests have been retried.
  /// ### Example
  /// ```dart
  /// await _retryQueuedRequests(newToken);
  /// ```
  /// ### Notes
  /// - This function clears the queued requests after retrying them.
  /// - It uses the Dio instance stored in the request options to make the requests.
  /// - If a request fails, it rejects the request with a DioException containing the error.
  /// - If the request is successful, it resolves the request handler with the response.
  /// - If the request fails, it rejects the request handler with a DioException containing the error.
  /// - This function is called after a successful token refresh to retry all requests that were
  /// queued while the token was being refreshed.
  Future<void> _retryQueuedRequests(String token) async {
    for (final request in _queuedRequests) {
      final updatedOptions = request.options.copyWith(
        headers: {
          ...request.options.headers,
          'Authorization': 'Bearer $token',
        },
      );

      try {
        final response = await request.dio.fetch(updatedOptions);
        request.handler.resolve(response);
      } catch (e) {
        request.handler.reject(
          DioException(
            requestOptions: request.options,
            error: e,
            type: DioExceptionType.unknown,
          ),
        );
      }
    }

    _queuedRequests.clear();
  }
  /// Retries the original request that failed with a 401 Unauthorized error.
  /// This function updates the request options with the new access token and attempts to fetch the response
  /// using the Dio instance.
  /// If the request is successful, it resolves the request handler with the response.
  /// If the request fails, it rejects the request handler with a DioException containing the error.
  /// ### Parameters
  /// - **[DioException]** err: The original DioException that caused the retry.
  /// - **[ErrorInterceptorHandler]** handler: The error interceptor handler to use for resolving or rejecting the request.
  /// - **[String]** token: The new access token to use for the request.
  /// ### Returns
  /// - **[Future<void>]** A future that completes when the retry is done.
  /// ### Example
  /// ```dart
  /// _retryOriginalRequest(err, handler, newToken);
  /// ```
  /// ### Notes
  /// - This function is called after a successful token refresh to retry the original request that failed
  /// with a 401 Unauthorized error.
  /// - It uses the Dio instance stored in the request options to make the request.
  /// - If the request is successful, it resolves the request handler with the response.
  /// - If the request fails, it rejects the request handler with a DioException containing the error.
  /// - This function is necessary to ensure that the original request can be retried with the new access token
  /// after a token refresh.
  void _retryOriginalRequest(
    DioException err,
    ErrorInterceptorHandler handler,
    String token,
  ) async {
    final updatedOptions = err.requestOptions.copyWith(
      headers: {
        ...err.requestOptions.headers,
        'Authorization': 'Bearer $token',
      },
    );

    try {
      final response = await dio.fetch(updatedOptions);
      handler.resolve(response);
    } catch (e) {
      TLogger.error('Retry failed: $e');
      handler.reject(
        DioException(
          requestOptions: updatedOptions,
          error: e,
          type: DioExceptionType.unknown,
        ),
      );
    }
  }
  /// Rejects all queued requests with the provided error message and type.
  /// This function iterates through all queued requests and rejects each one with a DioException
  /// containing the provided error message and type.
  /// ### Parameters
  /// - **[String]** error: The error message to use for rejecting the requests.
  /// - **[DioExceptionType]** type: The type of the DioException to use for rejecting the requests.
  /// ### Returns
  /// - **[void]** This function does not return a value.
  /// ### Example
  /// ```dart
  /// _rejectAllQueued("Token refresh failed", DioExceptionType.unknown);
  /// ```
  /// ### Notes
  /// - This function is called when the token refresh fails or returns null.
  /// - It clears the queued requests after rejecting them.
  /// - It uses the DioExceptionType to categorize the error.
  /// - This function is necessary to ensure that all requests that were queued while the token was
  /// being refreshed are properly rejected with an error.
  void _rejectAllQueued(String error, DioExceptionType type) {
    for (final request in _queuedRequests) {
      request.handler.reject(
        DioException(
          requestOptions: request.options,
          type: type,
          error: error,
        ),
      );
    }
    _queuedRequests.clear();
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
