import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sihkaro/domain/repo/theme_repo.dart';

part 'theme_repo.g.dart';

@Riverpod(keepAlive: true)
Future<ThemeRepository> themeRepo(ref) async {
  final prefs = await SharedPreferences.getInstance();
  return ThemeRepository(prefs);
}