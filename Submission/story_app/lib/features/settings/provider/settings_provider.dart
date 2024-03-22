import 'package:flutter/material.dart';
import 'package:story_app/features/settings/data/local/settings_local_data_source.dart';

class SettingsProvider extends ChangeNotifier {
  SettingsLocalDataSource localDataSource;

  SettingsProvider({required this.localDataSource});

  ThemeMode get themeMode => _isDark ? ThemeMode.dark : ThemeMode.light;

  bool _isDark = false;
  bool get isDark => _isDark;

  toggleTheme(bool value) {
    localDataSource.setDarkTheme(value);
    getTheme();
  }

  Future<void> getTheme() async {
    _isDark = await localDataSource.getDarkTheme();
    notifyListeners();
  }
}