import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sihkaro/presentation/router/auth_guard.dart';
import 'package:sihkaro/presentation/router/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  final WidgetRef ref;
  late final _authGuard = AuthGuard(ref);

  AppRouter(this.ref);

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: RootRoute.page,
      path: "/",
      guards: [_authGuard],
      children: [
        AutoRoute(page: ChatRoute.page, path: "chat"),
        AutoRoute(page: HomeRoute.page, path: "home"),
        AutoRoute(page: SettingRoute.page, path: "setting"),
      ],
    ),
    AutoRoute(page: NoteRoute.page, path: "/note"),
    AutoRoute(page: AuthRoute.page, path: "/auth"),
  ];
}
