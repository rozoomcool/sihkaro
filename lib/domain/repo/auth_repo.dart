import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  static const _tokenKey = 'auth_token';
  final SharedPreferences _prefs;

  AuthRepository(this._prefs);

  Future<void> saveToken(String token) async {
    await _prefs.setString(_tokenKey, token);
  }

  String? getTokenSync() => _prefs.getString(_tokenKey);

  Future<String?> getToken() async => _prefs.getString(_tokenKey);

  Future<void> clearToken() async {
    await _prefs.remove(_tokenKey);
  }

  bool isAuthenticatedSync() {
    final token = _prefs.getString(_tokenKey);
    return token != null && token.isNotEmpty;
  }

  Future<bool> isAuthenticated() async {
    final token = _prefs.getString(_tokenKey);
    return token != null && token.isNotEmpty;
  }
}
