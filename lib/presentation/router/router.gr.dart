// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:sihkaro/presentation/features/auth/auth.dart' as _i1;
import 'package:sihkaro/presentation/features/chat/chat_screen.dart' as _i2;
import 'package:sihkaro/presentation/features/home/home.dart' as _i3;
import 'package:sihkaro/presentation/features/note/note_screen.dart' as _i4;
import 'package:sihkaro/presentation/features/root/root_screen.dart' as _i5;

/// generated route for
/// [_i1.AuthScreen]
class AuthRoute extends _i6.PageRouteInfo<void> {
  const AuthRoute({List<_i6.PageRouteInfo>? children})
    : super(AuthRoute.name, initialChildren: children);

  static const String name = 'AuthRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i1.AuthScreen();
    },
  );
}

/// generated route for
/// [_i2.ChatScreen]
class ChatRoute extends _i6.PageRouteInfo<void> {
  const ChatRoute({List<_i6.PageRouteInfo>? children})
    : super(ChatRoute.name, initialChildren: children);

  static const String name = 'ChatRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i2.ChatScreen();
    },
  );
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomeScreen();
    },
  );
}

/// generated route for
/// [_i4.NoteScreen]
class NoteRoute extends _i6.PageRouteInfo<void> {
  const NoteRoute({List<_i6.PageRouteInfo>? children})
    : super(NoteRoute.name, initialChildren: children);

  static const String name = 'NoteRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i4.NoteScreen();
    },
  );
}

/// generated route for
/// [_i5.RootScreen]
class RootRoute extends _i6.PageRouteInfo<void> {
  const RootRoute({List<_i6.PageRouteInfo>? children})
    : super(RootRoute.name, initialChildren: children);

  static const String name = 'RootRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i5.RootScreen();
    },
  );
}
