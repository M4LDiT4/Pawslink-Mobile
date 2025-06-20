import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile_app_template/core/utils/helpers/app_exception.dart';
import 'package:mobile_app_template/core/utils/http/dio_client.dart';
import 'package:mobile_app_template/core/utils/http/response.dart';
import 'package:mobile_app_template/core/utils/logger/logger.dart';
import 'package:mobile_app_template/services/local_storage/local_secure_storage.dart';

//authentication service
class TAuthenticationService {
  //urls and paths
  static const String _signIn = "/sign-in";
  static const String _signUp = "sign-up";
  static const String _baseAuth = "/auth";
  late Uri _baseUri;

  //secure storage
  LocalSecureStorageService secureStorageService = LocalSecureStorageService();

  final DioHTTPHelper _dio = DioHTTPHelper(); 

  //singleton
  TAuthenticationService._internal();

  static final TAuthenticationService _instance =
    TAuthenticationService._internal();

  factory TAuthenticationService() => _instance;

  Future<void> init() async {
    final ip = dotenv.env['LOCALHOST_IP_ADDRESS'];
    if(ip == null) throw throw TAppException('Missing LOCALHOST_IP_ADDRESS in .env');
    _baseUri = Uri.parse('http://$ip:8000/auth');
  }

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
      throw TAppException(response.message ?? "Sign up failed");
    }
    if(data.accessToken == null || data.refreshToken == null){
      throw TAppException("Signup successful but not authentication details received. Contact Support");
    }
    await secureStorageService.saveData(LocalSecureStorageService.accessToken, response.data!.accessToken);
    await secureStorageService.saveData(LocalSecureStorageService.refreshToken, response.data!.refreshToken);
    return response;
  }

  Future<TResponse> signUp(String username, String email, String password) async {
    final uri = Uri(
      scheme: _baseUri.scheme,
      port: _baseUri.port,
      host: _baseUri.host,
      path: '${_baseUri.path}/$_signUp'
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

  Future<TResponse> rotateToken() async{
    final refreshToken = await secureStorageService.getData(LocalSecureStorageService.refreshToken);
    if(refreshToken == null){
      throw TAppException("Login data expired, please login again");
    }
    final uri = Uri(
      scheme: _baseUri.scheme,
      host: _baseUri.host,
      port: _baseUri.port,
      path: _baseAuth
    );
    final Map<String, String> body = {
      "refreshToken" : refreshToken
    };
    final response = await DioHTTPHelper().postJson<String?>(
      uri: uri, 
      body: body, 
      fromJson: _processRefreshTokenResponse
    );
    return response;
  }

  String? _processRefreshTokenResponse(Map<String, dynamic> map){
    if(map.containsKey("refreshToken")){
      return map['refreshToken'];
    }
    return null;
  }

  _AuthToken _processAuthResponse(Map<String, dynamic> data){
    final refreshToken = data['refreshToken'];
    final accessToken = data['accessToken'];

    return _AuthToken(accessToken: accessToken, refreshToken: refreshToken);
  }

  //utility functions
  Future<String?> getAccesstoken(){
    return secureStorageService.getData(LocalSecureStorageService.accessToken);
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