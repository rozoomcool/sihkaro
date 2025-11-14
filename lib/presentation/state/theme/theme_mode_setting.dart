import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sihkaro/presentation/state/theme/theme_repo.dart';

part 'theme_mode_setting.g.dart';

@riverpod
class ThemeModeSetting extends _$ThemeModeSetting {
  @override
  FutureOr<ThemeMode> build() async {
    final repo = await ref.read(themeRepoProvider.future);
    return repo.getTheme();
  }

  void changeTheme() async {
    final repo = await ref.read(themeRepoProvider.future);
    final mode = repo.getTheme();
    if (mode == ThemeMode.dark) {
      state = AsyncValue.data(ThemeMode.light);
      repo.saveTheme(ThemeMode.light);
    } else {
      state = AsyncValue.data(ThemeMode.dark);
      repo.saveTheme(ThemeMode.dark);
    }
  }
}
