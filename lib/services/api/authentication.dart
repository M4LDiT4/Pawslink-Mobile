import 'package:mobile_app_template/core/utils/helpers/app_exception.dart';
import 'package:mobile_app_template/core/utils/http/http_client.dart';
import 'package:mobile_app_template/core/utils/http/response.dart';
import 'package:mobile_app_template/services/local_storage/local_secure_storage.dart';

class TAuthenticationService {
  //urls and paths
  static const String _baseUrl = '192.168.1.105/auth';
  static const String _signIn = "/sign-in";

  //singleton
  TAuthenticationService._internal();

  static final TAuthenticationService _instance =
    TAuthenticationService._internal();

  factory TAuthenticationService() => _instance;

  Future<void> signIn(String username, String password) async{
    final url = Uri.http(_baseUrl, _signIn);

    final payload = {
      "username": username,
      "password" : password
    };

    final TResponse<Map<String, dynamic>> response = await THttpHelper.postJson(url: url, body: payload, fromJson:THttpHelper.defaultFromJson);
    if (!response.isSuccess) {
      throw TAppException("Sign in failed: ${response.message}");
    }
    final data = response.data;
    if (data == null) {
      throw TAppException("Sign in failed: No data received");
    }
    if(!(data.containsKey('refreshToken') && data.containsKey('accessToken'))){
      throw TAppException("Sign in failed: Invalid response structure");
    }
    final String accessToken = data['accessToken'];
    final String refreshToken = data['refreshToken'];

    await LocalSecureStorageService().saveAccessToken(accessToken);
    await LocalSecureStorageService().saveRefreshToken(refreshToken);
  }


}