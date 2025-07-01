import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenService {
  static final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  static Future<void> saveToken(String token) async {
    await _secureStorage.write(key: 'access_token', value: token);
  }

  static Future<String?> getToken() async {
    return await _secureStorage.read(key: 'access_token');
  }

  static Future<void> clearToken() async {
    await _secureStorage.delete(key: 'access_token');
  }
}
