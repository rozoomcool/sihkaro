import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_mode_setting.g.dart';

@riverpod
class ThemeModeSetting extends _$ThemeModeSetting {
  @override
  ThemeMode build() => ThemeMode.dark;
  void changeTheme() => state = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
}
