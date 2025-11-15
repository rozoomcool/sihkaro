import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sihkaro/presentation/state/theme/theme_mode_setting.dart';

class AppLogo extends HookConsumerWidget {
  const AppLogo({super.key, this.size});

  final double? size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeSettingProvider);
    return Image.asset(
      "assets/white1.png",
      // colorFilter: ColorFilter.mode(
      //   themeMode.value == ThemeMode.dark ? Colors.white70 : Colors.black87,
      //   BlendMode.srcIn,
      // ),
      color: themeMode.value == ThemeMode.dark
          ? Colors.white70
          : Colors.black87,
      width: size ?? 36,
    );
  }
}
