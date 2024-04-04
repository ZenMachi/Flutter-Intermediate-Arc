import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:story_app/features/authentication/data/model/login/user.dart';

class AuthLocalDataSource {
  final String stateKey = "state";
  final String userKey = "user";

  Future<bool> isLoggedIn() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getBool(stateKey) ?? false;
  }

  Future<bool> login() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.setBool(stateKey, true);
  }

  Future<bool> logout() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.setBool(stateKey, false);
  }

  Future<bool> saveUser(User user) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.setString(userKey, json.encode(user.toJson()));
  }

  Future<bool> deleteUser() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.setString(userKey, "");
  }

  Future<User?> getUser() async {
    final preferences = await SharedPreferences.getInstance();
    final jsonData = preferences.getString(userKey) ?? "";
    User? user;
    try {
      user = User.fromJson(json.decode(jsonData));
    } catch (e) {
      user = null;
    }
    return user;
  }
}
