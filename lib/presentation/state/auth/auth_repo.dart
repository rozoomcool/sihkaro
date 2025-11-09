import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sihkaro/domain/repo/auth_repo.dart';

part 'auth_repo.g.dart';

@Riverpod(keepAlive: true)
Future<AuthRepository> authRepository(ref) async {
  final prefs = await SharedPreferences.getInstance();
  return AuthRepository(prefs);
}