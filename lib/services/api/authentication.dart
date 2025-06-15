import 'package:mobile_app_template/core/utils/helpers/app_exception.dart';
import 'package:mobile_app_template/core/utils/http/dio_client.dart';
import 'package:mobile_app_template/core/utils/http/response.dart';
import 'package:mobile_app_template/services/local_storage/local_secure_storage.dart';

//authentication service
class TAuthenticationService {
  //urls and paths
  static const String _signIn = "/sign-in";
  static const String _baseAuth = "/auth";
  final _baseUri = Uri.parse('192.168.1.105/auth');

  //secure storage
  LocalSecureStorageService secureStorageService = LocalSecureStorageService();

  //singleton
  TAuthenticationService._internal();

  static final TAuthenticationService _instance =
    TAuthenticationService._internal();

  factory TAuthenticationService() => _instance;

  Future<void> signIn(String username, String password) async{
    final url = Uri(
      scheme: _baseUri.scheme,
      port: _baseUri.port,
      host: _baseUri.host,
      path: _signIn
    );

    final payload = {
      "username": username,
      "password" : password
    };

    final response = await DioHTTPHelper().postJson<_AuthToken>(
      uri: url,
      body: payload,
      fromJson: _processSigninResponse
    );
    await secureStorageService.saveData(LocalSecureStorageService.accessToken, response.data!.accessToken);
    await secureStorageService.saveData(LocalSecureStorageService.refreshToken, response.data!.refreshToken);
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

  _AuthToken _processSigninResponse(Map<String, dynamic> data){
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