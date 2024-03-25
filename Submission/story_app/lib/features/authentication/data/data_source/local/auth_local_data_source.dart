import 'package:shared_preferences/shared_preferences.dart';
import 'package:story_app/features/authentication/data/model/user.dart';

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
    return preferences.setString(userKey, user.toJsonString());
  }

  Future<bool> deleteUser() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.setString(userKey, "");
  }

  Future<User?> getUser() async {
    final preferences = await SharedPreferences.getInstance();
    final json = preferences.getString(userKey) ?? "";
    User? user;
    try {
      user = User.fromJsonString(json);
    } catch (e) {
      user = null;
    }
    return user;
  }
}
