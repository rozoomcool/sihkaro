import 'package:auto_route/auto_route.dart';
import 'package:sihkaro/presentation/router/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: RootRoute.page, path: "/", children: [
      AutoRoute(page: NoteRoute.page, path: "note")
    ]),
    AutoRoute(page: AuthRoute.page, path: "/auth")
  ];
}