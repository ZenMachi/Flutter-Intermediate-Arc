import 'package:shared_preferences/shared_preferences.dart';

class SettingsLocalDataSource {
  final String darkTheme = "dark_theme";
  final String langKey = "lang";

  Future<bool> getDarkTheme() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getBool(darkTheme) ?? false;
  }

  Future<bool> setDarkTheme(bool value) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.setBool(darkTheme, value);
  }

  Future<bool> setLanguage(String locale) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.setString(langKey, locale);
  }

  Future<String> getLanguage() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(langKey) ?? "en";
  }
}
