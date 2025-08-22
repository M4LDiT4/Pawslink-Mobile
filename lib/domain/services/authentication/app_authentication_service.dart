
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile_app_template/core/utils/logger/logger.dart';
import 'package:mobile_app_template/network/network_client.dart';
import 'package:mobile_app_template/network/operation_response.dart';
import 'package:mobile_app_template/domain/services/local_storage/local_secure_storage.dart';

/// Service for handling app authentication and sessions
/// 
/// ### Dependencies
/// - [NetworkClient] -> used for making network requests
/// - [LocalSecureStorageService] -> stores the tokens and is the only gateway to get session tokens
class AppAuthenticationService {
  NetworkClient? _client;
  LocalSecureStorageService? _localSecureStorage;
  Uri? _baseUrl;

  static const String _signIn = "/sign-in";
  static const String _signUp = "/sign-up";
  static const String _baseAuth = "auth";
  static const String _refresh = "/refresh";

  AppAuthenticationService._internal();

  static final AppAuthenticationService _instance = AppAuthenticationService._internal();

  factory AppAuthenticationService() => _instance;

  void init(
    NetworkClient client,
    LocalSecureStorageService localSecureStorage,
  ) {
    if(_client != null) return;

    final backendUrl = dotenv.env['BACKEND_URL'];

    if(backendUrl == null) throw Exception("Missing Authentication API Configuration");

    _client = client;
    _baseUrl = Uri.parse(backendUrl);
    _localSecureStorage = localSecureStorage;
  }

  Future<OperationResponse> signIn(String username, String password) async {
    _checkIfPreConditionValid();
    final base = _baseUrl!;
    final url = Uri(
      scheme: base.scheme,
      port: base.port,
      host: base.host,
      path: '${base.path}$_baseAuth$_signIn'
    );

    final payload = {
      "email": username,
      "password": password
    };

    final response = await _client!.post<_AuthToken>(
      url.toString(), 
      fields: payload,
      dataParser: _parseAuthResponse
    );
    final data = response.data;
    if(data == null){
      return OperationResponse.failedResponse(
        message: response.message?? "Sign in failed\n"
      );
    }
    if(data.accessToken == null || data.refreshToken == null){
      TLogger.error("Access token or refreshed token has a value of null\n `access token`: ${data.accessToken}  `refresh token`: ${data.refreshToken}");
      return OperationResponse.failedResponse(
        message: response.message ?? 'Sign in failed\n'
      );
    }

    await _saveTokens(data);

    return OperationResponse.successfulResponse(
      message:  "Sign in successful"
    );
  }

  Future<OperationResponse> signUp(
    String username,
    String email,
    String password
  ) async{
    _checkIfPreConditionValid();
    final base = _baseUrl!;
    final uri = Uri(
      scheme: base.scheme,
      port: base.port,
      host: base.host,
      path: '${base.path}$_baseAuth$_signUp'
    );
    final payload = {
      'username': username,
      'pasword': password,
      'email': email
    };
    final response = await _client!.post<_AuthToken>(
      uri.toString(), 
      fields: payload,
      dataParser: _parseAuthResponse
    );

    final data = response.data;

    if(data == null){
      return OperationResponse.failedResponse(
        message: response.message ?? 'Sign up Failed'
      );
    }
    if(data.accessToken == null || data.refreshToken == null){
      TLogger.error("Access token or refreshed token has a value of null\n `access token`: ${data.accessToken}  `refresh token`: ${data.refreshToken}");
      return OperationResponse.failedResponse(
        message: response.message ?? 'Sign up Failed'
      );
    }

    await _saveTokens(data);
    return OperationResponse.successfulResponse(
      message: "Sign up successful"
    );
  }

  /// Rotates the token by getting the stored refresh token in the local secure storage
  /// ### What it does
  /// - checks if there is refresh token, if there is none throws an Exception
  /// - saves the result of the backend token rotation
  /// ### Usage
  /// ```dart
  ///   await AppAuthenticationService.rotateTokens(); // get and save tokens
  ///   final newToken = await LocalSecureStorageService.getData( // get the new tokens
  ///     LocalSecureStorageService.accessToken
  ///   )
  /// ```
  Future<void> rotateToken() async {
    _checkIfPreConditionValid();

    final refreshToken = await _localSecureStorage!.getData(
      LocalSecureStorageService.refreshToken
    );

    if(refreshToken == null) {
      TLogger.warning('Refresh token is null, cannot continue with token rotation, should go back to sign in');
      throw Exception("Login data expired, please login again");
    }
    final base = _baseUrl!;
    final uri = Uri(
      scheme: base.scheme,
      host: base.host,
      port: base.port,
      path:  '${base.path}$_baseAuth$_refresh'
    );

    final payload = {
      'refreshToken': refreshToken
    };

    final response = await _client!.post(
      uri.toString(),
      fields: payload,
      dataParser: _parseAuthResponse
    );
    _AuthToken token;
    if(response.data == null){
      TLogger.error(response.message?? 'RefreshToken is null');
      token = _AuthToken(accessToken: null, refreshToken: null);
    }else{
      token = response.data!;
    }
    await _saveTokens(token);
  }

  Future<String?> getAccessToken() async{
    _checkIfPreConditionValid();
    final accessToken = await _localSecureStorage!.getData(
      LocalSecureStorageService.accessToken
    );
    return accessToken;
  }

  _AuthToken _parseAuthResponse (dynamic data) {
    TLogger.debug(data.toString());
    if(data is Map<String, dynamic>){
      return _AuthToken(
        accessToken: data['accessToken'], 
        refreshToken: data['refreshToken']
      );
    }
    return _AuthToken(accessToken: null, refreshToken: null);
  }

  Future<void> _saveTokens(_AuthToken authToken)async{
    await _localSecureStorage!.saveData(LocalSecureStorageService.accessToken, authToken.accessToken);
    await _localSecureStorage!.saveData(LocalSecureStorageService.refreshToken, authToken.refreshToken);
  }


  void _checkIfPreConditionValid (){
    if(_client == null || _baseUrl == null || _localSecureStorage == null){
      throw Exception('App Authentication Service is not initialized, initialize using the `init` method before using');
    }
  }
}

class _AuthToken {
  final String? accessToken;
  final String? refreshToken;

  _AuthToken({
    required this.accessToken,
    required this.refreshToken
  });
}
