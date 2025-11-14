import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sihkaro/presentation/state/theme/theme_mode_setting.dart';

class GlossyCard extends HookConsumerWidget {
  const GlossyCard({
    super.key,
    required this.child,
    this.blueStrength,
    this.border,
    this.borderRadius,
    this.padding,
  });

  final Widget child;
  final double? blueStrength;
  final BoxBorder? border;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeSettingProvider);
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: blueStrength ?? 10,
          sigmaY: blueStrength ?? 10,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            border:
                border ??
                Border.all(
                  width: 1,
                  color: themeMode.value == ThemeMode.dark
                      ? Colors.white10
                      : Colors.black12,
                ),
            borderRadius: borderRadius ?? BorderRadius.circular(20),
          ),
          child: Padding(
            padding:
                padding ??
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
            child: child,
          ),
        ),
      ),
    );
  }
}
