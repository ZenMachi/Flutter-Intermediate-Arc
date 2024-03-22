import 'package:shared_preferences/shared_preferences.dart';

class SettingsLocalDataSource {
  final String darkTheme = "dark_theme";

  Future<bool> getDarkTheme() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getBool(darkTheme) ?? false;
  }

  Future<bool> setDarkTheme(bool value) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.setBool(darkTheme, value);
  }
}
