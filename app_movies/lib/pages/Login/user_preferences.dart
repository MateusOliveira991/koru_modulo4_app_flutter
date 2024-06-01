

import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  Future<void> saveUser(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(email, password);
  }

  Future<String?> getUserPassword(String email) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(email);
  }

  Future<bool> userExists(String email) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(email);
  }
}
