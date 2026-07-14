import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CacheHelper {
  CacheHelper._();

  static const FlutterSecureStorage _storage = FlutterSecureStorage(aOptions: AndroidOptions(encryptedSharedPreferences: true));

  static const String _tokenKey = 'token';

  static Future<void> saveToken(String token) async {
    await _storage.write(
      key: 'token',
      value: token,
    );
  }
  static Future<String?> getToken() async {
    return await _storage.read(
      key: 'token',
    );
  }

  static Future<void> deleteToken() async {
    await _storage.delete(
      key: 'token',
    );
  }
}