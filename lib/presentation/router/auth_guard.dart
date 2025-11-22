import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sihkaro/presentation/router/router.gr.dart';
import 'package:sihkaro/presentation/state/auth/auth.dart';

class AuthGuard extends AutoRouteGuard {
  final WidgetRef ref;

  AuthGuard(this.ref);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final authAsync = await ref.watch(authProvider.future);
    // final authState = await ref.read(authProvider.future);

    if (authAsync == AuthStatus.authenticated) {
      resolver.next(true);
    } else {
      router.replace(const AuthRoute());
    }

    // authAsync.when(
    //   data: (status) {
    //     if (status == AuthStatus.authenticated) {
    //       resolver.next(true);
    //     } else {
    //       router.replace(const AuthRoute());
    //     }
    //   },
    //   error: (err, trace) {
    //       router.replace(const AuthRoute());

    //   },
    //   loading: () {
    //       router.replace(const AuthRoute());

    //   },
    // );
  }
}
