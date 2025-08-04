import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile_app_template/core/utils/helpers/app_exception.dart';
import 'package:mobile_app_template/core/utils/http/dio_client.dart';
import 'package:mobile_app_template/core/utils/http/response.dart';
import 'package:mobile_app_template/core/utils/logger/logger.dart';
import 'package:mobile_app_template/services/local_storage/local_secure_storage.dart';

/// ## TAuthenticationService
/// A singleton service for handling user authentication.
/// Provides methods for signing in, signing up, and rotating tokens.
/// Uses [DioHTTPHelper] for making HTTP requests and [LocalSecureStorageService]
/// for secure storage of authentication tokens.
/// ### Usage
/// ```dart
/// final authService = TAuthenticationService();
/// await authService.init(dioHttpHelper);
/// try {
///   final response = await authService.signIn('username', 'password');
///   // Handle successful sign-in
/// } catch (e) {
///   // Handle sign-in error
/// }
/// ```
//// ### Methods
/// - **signIn**: Signs in a user with username and password.
/// - **signUp**: Signs up a new user with username, email, and password.
/// - **rotateToken**: Rotates the access token using the refresh token stored in secure storage.
/// - **getAccesstoken**: Retrieves the access token from secure storage.
/// - **_processAuthResponse**: Parses the authentication response to extract access and refresh tokens.
/// ### Exceptions
/// - Throws [TAppException] if any operation fails, such as missing environment variables or
///   if the API response does not contain the expected tokens.
/// - Throws [TAppException] if the refresh token is not found in secure storage during token rotation.
/// ### Dependencies
/// - [DioHTTPHelper]: For making HTTP requests.
/// - [LocalSecureStorageService]: For securely storing and retrieving authentication tokens.
/// ### Note
/// This service should be initialized with a valid [DioHTTPHelper] instance before use.
class TAuthenticationService {
  //urls and paths
  static const String _signIn = "/sign-in";
  static const String _signUp = "/sign-up";
  static const String _baseAuth = "/auth";
  static const String _refresh = "refresh";
  late Uri _baseUri;

  //secure storage
  LocalSecureStorageService secureStorageService = LocalSecureStorageService();

  late final DioHTTPHelper _dio; 

  TAuthenticationService._internal();

  static final TAuthenticationService _instance =
    TAuthenticationService._internal();

  factory TAuthenticationService() => _instance;

  Future<void> init(DioHTTPHelper httpService) async {
    final backendUrl = dotenv.env['BACKEND_URL'];
    if(backendUrl == null) throw throw TAppException('Missing LOCALHOST_IP_ADDRESS in .env');
    _baseUri = Uri.parse('${backendUrl}auth');
    _dio = httpService;
  }

  /// Signs in a user with the provided username and password.
  /// ### Parameters
  /// - **[String]** username: The username or email of the user.
  /// - **[String]** password: The password of the user.
  /// ### Returns
  /// A [Future<TResponse>] that resolves to the authentication response containing access and refresh tokens.
  /// ### Throws
  /// - Throws [TAppException] if the sign-in fails or if the response does not contain the expected tokens.
  /// - Throws [TAppException] if the access or refresh token is null after a successful sign-in.
  /// ### Note
  /// The access and refresh tokens are saved to secure storage upon successful sign-in.
  /// The access token is used for subsequent authenticated requests, while the refresh token is used to
  /// obtain a new access token when the current one expires.
  /// ### Example
  /// ```dart
  /// final authService = TAuthenticationService();
  /// await authService.init(dioHttpHelper);
  /// try {
  ///   final response = await authService.signIn('username', 'password');
  ///   // Handle successful sign-in
  /// } catch (e) {
  ///   // Handle sign-in error
  /// }
  /// ``` 
  Future<TResponse> signIn(String username, String password) async{
    final url = Uri(
      scheme: _baseUri.scheme,
      port: _baseUri.port,
      host: _baseUri.host,
      path: '${_baseUri.path}$_signIn'
    );

    final payload = {
      "email": username,
      "password" : password
    };

    TLogger.info(url.toString());

    final response = await _dio.postJson<_AuthToken>(
      uri: url,
      body: payload,
      fromJson: _processAuthResponse
    );

    final data = response.data;
    if(data == null){
      throw TAppException(response.message ?? "Sign in failed");
    }
    if(data.accessToken == null || data.refreshToken == null){
      throw TAppException("Signup successful but not authentication details received. Contact Support");
    }
    await secureStorageService.saveData(LocalSecureStorageService.accessToken, response.data!.accessToken);
    await secureStorageService.saveData(LocalSecureStorageService.refreshToken, response.data!.refreshToken);
    return response;
  }

  /// Signs up a new user with the provided username, email, and password.
  /// ### Parameters
  /// - **[String]** username: The desired username for the new user.
  /// - **[String]** email: The email address of the new user.
  /// - **[String]** password: The password for the new user.
  /// ### Returns
  /// A [Future<TResponse>] that resolves to the authentication response containing access and refresh tokens.
  /// ### Throws
  /// - Throws [TAppException] if the sign-up fails or if the response does not contain the expected tokens.
  /// - Throws [TAppException] if the access or refresh token is null after a successful sign-up.
  /// ### Note
  /// The access and refresh tokens are saved to secure storage upon successful sign-up.
  /// The access token is used for subsequent authenticated requests, while the refresh token is used to
  /// obtain a new access token when the current one expires.
  /// ### Example
  /// ```dart 
  /// final authService = TAuthenticationService();
  /// await authService.init(dioHttpHelper);
  /// try {
  ///   final response = await authService.signUp('username', 'email;com', 'password');
  ///   // Handle successful sign-up
  /// } catch (e) {
  ///   // Handle sign-up error
  /// }
  /// ```
  Future<TResponse> signUp(String username, String email, String password) async {
    final uri = Uri(
      scheme: _baseUri.scheme,
      port: _baseUri.port,
      host: _baseUri.host,
      path: '${_baseUri.path}$_signUp'
    );

    final payload = {
      "username": username,
      "email": email,
      "password": password,
    };
    final response = await _dio.postJson<_AuthToken>(
      uri: uri, 
      body: payload, 
      fromJson: _processAuthResponse
    );

    final data = response.data;
    if(data == null){
      throw TAppException(response.message ?? "Sign up failed");
    }
    if(data.accessToken == null || data.refreshToken == null){
      throw TAppException("Signup successful but not authentication details received. Contact Support");
    }

    await secureStorageService.saveData(LocalSecureStorageService.accessToken, response.data!.accessToken);
    await secureStorageService.saveData(LocalSecureStorageService.refreshToken, response.data!.refreshToken);
    return response;
  }

  /// Rotates the access token using the refresh token stored in secure storage.
  /// Saves the new access and refresh tokens to secure storage.
  /// ### Throws
  /// - Throws [TAppException] if the refresh token is not found in secure storage.
  /// ### Note
  /// This method is typically called when the access token has expired and needs to be refreshed.
  /// It retrieves the refresh token from secure storage, makes a request to the API to obtain
  /// a new access token, and saves the new tokens back to secure storage.
  /// ### Example
  /// ```dart
  /// final authService = TAuthenticationService();
  /// await authService.init(dioHttpHelper);
  /// try {
  ///   await authService.rotateToken();
  ///   // Handle successful token rotation
  /// } catch (e) {
  ///   // Handle token rotation error
  /// }
  /// ```
  Future<void> rotateToken() async{
    ///pre: secure storage service is initialized
    ///post: saves access and refresh tokens to secure storage
    final refreshToken = await secureStorageService.getData(LocalSecureStorageService.refreshToken);
    if(refreshToken == null){
      throw TAppException("Login data expired, please login again");
    }
    final uri = Uri(
      scheme: _baseUri.scheme,
      host: _baseUri.host,
      port: _baseUri.port,
      path: '$_baseAuth/$_refresh'
    );
    final Map<String, String> body = {
      "refreshToken" : refreshToken
    };
    final response = await DioHTTPHelper().postJson<_AuthToken?>(
      uri: uri, 
      body: body, 
      fromJson: _processAuthResponse
    );
    await secureStorageService.saveData(LocalSecureStorageService.accessToken, response.data?.accessToken);
    await secureStorageService.saveData(LocalSecureStorageService.refreshToken, response.data?.refreshToken);
  }

  /// Parses the refresh and access tokens from api response
  /// ### Parameters
  /// -**[Map<String,dynamic>>]** data: The JSON response from the authentication API containing the tokens.
  /// ### Returns
  /// An instance of [_AuthToken] containing the access and refresh tokens.
  /// This method is used internally to process the API response after a sign-in or sign-up operation.
  /// ### Note
  /// This method is called after a successful sign-in or sign-up to extract the tokens from the response data.
  /// It is not intended to be called directly by users of the service.
  /// ### Example
  /// ```dart
  /// final authService = TAuthenticationService();
  /// final response = await authService.signIn('username', 'password');
  /// final authToken = authService._processAuthResponse(response.data);
  /// print('Access Token: ${authToken.accessToken}');
  /// print('Refresh Token: ${authToken.refreshToken}');
  /// ``` 
  _AuthToken _processAuthResponse(Map<String, dynamic> data){
    final refreshToken = data['refreshToken'];
    final accessToken = data['accessToken'];

    return _AuthToken(accessToken: accessToken, refreshToken: refreshToken);
  }

  /// Retrieves the access token from secure storage.
  /// ### Returns
  /// A [Future<String?>] that resolves to the access token if it exists, or null if it does not.
  /// This method is typically used to obtain the access token for making authenticated requests to the API.
  /// ### Example\
  /// ```dart
  /// final authService = TAuthenticationService();
  /// final accessToken = await authService.getAccesstoken();
  /// if (accessToken != null) {
  ///   // Use the access token for authenticated requests
  /// } else {
  ///   // Handle the case where the access token is not available
  /// }
  /// ```
  Future<String?> getAccesstoken(){
    return secureStorageService.getData(LocalSecureStorageService.accessToken);
  }
}

/// ## _AuthToken
/// Represents the authentication tokens returned by the API.
/// Contains both the access token and the refresh token.
/// ### Parameters
/// - **[String?]** accessToken: The access token used for authentication.
/// - **[String?]** refreshToken: The refresh token used to obtain a new access token when the current one expires.
class _AuthToken {
  final String? accessToken;
  final String? refreshToken;

  _AuthToken({
    required this.accessToken,
    required this.refreshToken
  });
}