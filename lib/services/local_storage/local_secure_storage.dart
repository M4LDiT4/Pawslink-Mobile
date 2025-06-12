
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// This service is used to store sensitive data securely on the device
class LocalSecureStorageService {
  static final LocalSecureStorageService _instance =
      LocalSecureStorageService._internal();

  factory LocalSecureStorageService() => _instance;
  LocalSecureStorageService._internal();

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  //keys for storing values
  //prevents typos and makes it easier to manage keys
  static const String _accessToken = "access_token";
  static const String _refreshToken = "refresh_token";

  //save tokens
  Future<void> saveAccessToken(String token) async {
    await _storage.write(key: _accessToken, value: token);
  }

  Future<String?> getAccessToken() async {
    return await _storage.read(key :_accessToken);
  }

  Future<void> deleteAccessToken() async{
    await _storage.delete(key: _accessToken);
  }

  Future<void> saveRefreshToken(String token) async {
    await _storage.write(key: _refreshToken, value: token);
  }

  Future<String?> getRefreshToken() async {
    return await _storage.read(key: _refreshToken);
  }

  Future<void> deleteRefreshToken() async{
    await _storage.delete(key: _refreshToken);
  }

  Future<void> clearTokens() async {
    await deleteAccessToken();
    await deleteRefreshToken();
  }
}