import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sihkaro/presentation/state/theme/theme_mode_setting.dart';

class CustomDivider extends HookConsumerWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeSettingProvider);
    return Divider(
      thickness: 1,
      color: themeMode.value == ThemeMode.dark ? Colors.white10 : Colors.black12,
    );
  }
}
