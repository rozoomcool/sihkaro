import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeRepository {
  static const _themeKey = 'theme_mode';
  final SharedPreferences _prefs;

  ThemeRepository(this._prefs);

  Future<void> saveTheme(ThemeMode mode) async {
    await _prefs.setString(
      _themeKey,
      mode == ThemeMode.light ? 'light' : 'dark',
    );
  }

  ThemeMode getTheme() {
    final theme = _prefs.getString(_themeKey);
    if (theme == null) return ThemeMode.dark;
    return theme == 'dark' ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> clearTheme() async {
    await _prefs.remove(_themeKey);
  }
}
