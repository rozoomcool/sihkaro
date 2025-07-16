import 'package:flutter/material.dart';

class ThemeModeStateWidget extends InheritedWidget {
  final ThemeMode data;
  final VoidCallback change;

  const ThemeModeStateWidget({
    super.key,
    required super.child,
    required this.data,
    required this.change,
  });

  static ThemeModeStateWidget of(BuildContext context) {
    final ThemeModeStateWidget? result =
        context.dependOnInheritedWidgetOfExactType<ThemeModeStateWidget>();
    assert(result != null, 'No ThemeModeStateWidget found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ThemeModeStateWidget oldWidget) {
    return oldWidget.data != data;
  }
}
