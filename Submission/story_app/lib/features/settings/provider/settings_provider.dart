import 'package:flutter/material.dart';
import 'package:story_app/features/settings/data/local/settings_local_data_source.dart';

class SettingsProvider extends ChangeNotifier {
  SettingsLocalDataSource localDataSource;

  SettingsProvider({required this.localDataSource});

  bool _isDark = false;
  Locale? _locale;
  Locale? get locale => _locale;

  ThemeMode get themeMode => _isDark ? ThemeMode.dark : ThemeMode.light;

  bool get isDark => _isDark;

  void toggleTheme(bool value) {
    localDataSource.setDarkTheme(value);
    getTheme();
  }

  Future<void> getTheme() async {
    _isDark = await localDataSource.getDarkTheme();
    notifyListeners();
  }

  void setLocale(Locale locale) async {
    _locale = locale;
    await localDataSource.setLanguage(locale.languageCode);
    notifyListeners();
  }

  Future<Locale> getLocale() async {
    final code = await localDataSource.getLanguage();
    notifyListeners();
    return _locale = Locale(code);
  }
}
