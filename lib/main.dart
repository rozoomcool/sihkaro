import 'package:flutter/material.dart';
import 'package:sihkaro/presentation/features/root/root_screen.dart';
import 'package:sihkaro/presentation/state/theme_mode_state_widget.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  ThemeMode mode = ThemeMode.dark;

  void toggleTheme() => setState(() {
    mode = (mode == ThemeMode.dark) ? ThemeMode.light : ThemeMode.dark;
  });

  @override
  Widget build(BuildContext context) {
    return ThemeModeStateWidget(
      data: mode,
      change: toggleTheme,
      child: MaterialApp(
        darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
          colorScheme: ColorScheme.fromSeed(
            brightness: Brightness.dark,
            seedColor: Color(0xFF0092b8),
            secondary: Color(0xFF74d4ff),
            surfaceContainerLow: Color(0xFF292524),
            surface: Color(0xFF1c1917),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(16)
              )
            )
          )
        ),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Color(0xFF0092b8),
            secondary: Color(0xFF74d4ff),
            surfaceContainerLow: Color(0xFFf4f4f5),
          ),
        ),
        themeMode: mode,
        debugShowCheckedModeBanner: false,
        home: RootLayout(),
      ),
    );
  }
}
