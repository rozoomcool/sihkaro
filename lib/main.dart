import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sihkaro/domain/api/dio.dart';
import 'package:sihkaro/domain/api/notebook/notebook.dart';
import 'package:sihkaro/domain/repo/auth_repo.dart';
import 'package:sihkaro/domain/repo/theme_repo.dart';
import 'package:sihkaro/presentation/router/router.dart';
import 'package:sihkaro/presentation/state/theme/theme_mode_setting.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting();

  // Register shared preferences
  final sharedPrefs = await SharedPreferences.getInstance();
  GetIt.I.registerFactory<SharedPreferences>(() => sharedPrefs);

  // Register repositories
  GetIt.I.registerFactory(() => AuthRepository(GetIt.I<SharedPreferences>()));
  GetIt.I.registerFactory(() => ThemeRepository(GetIt.I()));

  // Register Rest Clients
  GetIt.I.registerFactory(() => configureDio(GetIt.I()));
  GetIt.I.registerFactory(() => NotebookRestClient(GetIt.I()));

  runApp(ProviderScope(child: const MainApp()));
}

class MainApp extends HookConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeSettingProvider);
    final appRouter = useState(AppRouter(ref));

    useEffect(() {
      appRouter.value.navigationHistory.addListener(() {
        debugPrint(appRouter.value.navigationHistory.toString());
      });
      return null;
    }, []);

    return MaterialApp.router(
      darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          // seedColor: Colors.cyanAccent
          seedColor: Color(0xFF0092b8),
          secondary: Color(0xFF74d4ff),
          surfaceContainerLow: Color.fromARGB(255, 0, 0, 0),
          surface: Colors.black,
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(16),
            ),
          ),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(16),
            ),
          ),
        ),
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(16),
          ),
        ),
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(16),
            ),
          ),
        ),
      ),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF0092b8),
          secondary: Color(0xFF74d4ff),
          surfaceContainerLow: Color(0xFFf4f4f5),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(16),
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(16),
            ),
          ),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(16),
            ),
          ),
        ),
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(16),
          ),
        ),
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(16),
            ),
          ),
        ),
      ),
      themeMode: themeMode.value ?? ThemeMode.light,
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter.value.config(),
    );
  }
}
