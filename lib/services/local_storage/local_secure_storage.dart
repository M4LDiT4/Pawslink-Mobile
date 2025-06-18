
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
  static const String accessToken = "access_token";
  static const String refreshToken = "refresh_token";

  final List<String> _keyList = [accessToken, refreshToken];

  Future<void> saveData(String key, String? data) async{
    await _storage.write(key: key, value: data);
  }

  Future<String?> getData(String key) async {
    return await _storage.read(key: key);
  }

  Future<void> deleteData(String key) async {
    await _storage.delete(key: key);
  }

  Future<void> clearAllData()async{
  for(final key in _keyList){
      await _storage.delete(key: key);
    }
  }
}