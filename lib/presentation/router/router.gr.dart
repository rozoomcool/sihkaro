// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:sihkaro/presentation/features/auth/auth.dart' as _i1;
import 'package:sihkaro/presentation/features/chat/chat_screen.dart' as _i2;
import 'package:sihkaro/presentation/features/home/home.dart' as _i3;
import 'package:sihkaro/presentation/features/note/note_screen.dart' as _i4;
import 'package:sihkaro/presentation/features/root/root_screen.dart' as _i5;
import 'package:sihkaro/presentation/features/setting/setting.dart' as _i6;

/// generated route for
/// [_i1.AuthScreen]
class AuthRoute extends _i7.PageRouteInfo<void> {
  const AuthRoute({List<_i7.PageRouteInfo>? children})
    : super(AuthRoute.name, initialChildren: children);

  static const String name = 'AuthRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i1.AuthScreen();
    },
  );
}

/// generated route for
/// [_i2.ChatScreen]
class ChatRoute extends _i7.PageRouteInfo<void> {
  const ChatRoute({List<_i7.PageRouteInfo>? children})
    : super(ChatRoute.name, initialChildren: children);

  static const String name = 'ChatRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i2.ChatScreen();
    },
  );
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomeScreen();
    },
  );
}

/// generated route for
/// [_i4.NoteScreen]
class NoteRoute extends _i7.PageRouteInfo<NoteRouteArgs> {
  NoteRoute({
    _i8.Key? key,
    required String id,
    List<_i7.PageRouteInfo>? children,
  }) : super(
         NoteRoute.name,
         args: NoteRouteArgs(key: key, id: id),
         initialChildren: children,
       );

  static const String name = 'NoteRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NoteRouteArgs>();
      return _i4.NoteScreen(key: args.key, id: args.id);
    },
  );
}

class NoteRouteArgs {
  const NoteRouteArgs({this.key, required this.id});

  final _i8.Key? key;

  final String id;

  @override
  String toString() {
    return 'NoteRouteArgs{key: $key, id: $id}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! NoteRouteArgs) return false;
    return key == other.key && id == other.id;
  }

  @override
  int get hashCode => key.hashCode ^ id.hashCode;
}

/// generated route for
/// [_i5.RootScreen]
class RootRoute extends _i7.PageRouteInfo<void> {
  const RootRoute({List<_i7.PageRouteInfo>? children})
    : super(RootRoute.name, initialChildren: children);

  static const String name = 'RootRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i5.RootScreen();
    },
  );
}

/// generated route for
/// [_i6.SettingScreen]
class SettingRoute extends _i7.PageRouteInfo<void> {
  const SettingRoute({List<_i7.PageRouteInfo>? children})
    : super(SettingRoute.name, initialChildren: children);

  static const String name = 'SettingRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i6.SettingScreen();
    },
  );
}
