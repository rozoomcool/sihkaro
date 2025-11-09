import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sihkaro/presentation/state/auth/auth_repo.dart';

part 'auth.g.dart';

enum AuthStatus { unknown, authenticated, unauthenticated }

@riverpod
class Auth extends _$Auth {
  @override
  FutureOr<AuthStatus> build() async {
    final repo = await ref.read(authRepositoryProvider.future);
    final isAuth = await repo.isAuthenticated();
    return isAuth ? AuthStatus.authenticated : AuthStatus.unauthenticated;
  }

  Future<void> login(String token) async {
    final repo = await ref.read(authRepositoryProvider.future);
    await repo.saveToken(token);
    state = const AsyncValue.data(AuthStatus.authenticated);
  }

  Future<void> logout() async {
    final repo = await ref.read(authRepositoryProvider.future);
    await repo.clearToken();
    state = const AsyncValue.data(AuthStatus.unauthenticated);
  }
}
