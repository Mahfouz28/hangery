import 'package:hangery/core/utils/pref_helpers.dart';

class AuthManager {
  static bool isLoggedIn = false;

  static Future<void> init() async {
    final token = await PrefHelpers.getToken();
    isLoggedIn = token != null;
  }

  static Future<void> login(String token) async {
    await PrefHelpers.saveToken(token);
    isLoggedIn = true;
  }

  static Future<void> logout() async {
    await PrefHelpers.clearToken();
    isLoggedIn = false;
  }
}
