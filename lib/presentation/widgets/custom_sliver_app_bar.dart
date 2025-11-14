import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sihkaro/presentation/state/theme/theme_mode_setting.dart';
import 'package:sihkaro/presentation/widgets/glossy_card.dart';

class CustomSliverAppBar extends HookConsumerWidget {
  const CustomSliverAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeSettingProvider);
    return SliverAppBar(
      pinned: true,
      backgroundColor: Colors.transparent,
      elevation: null,
      flexibleSpace: GlossyCard(
        border: BoxBorder.fromLTRB(
          bottom: BorderSide(
            color: themeMode.value == ThemeMode.dark
                ? Colors.white10
                : Colors.black12,
            width: 1,
          ),
        ),
        borderRadius: BorderRadius.all(Radius.zero),
        child: Container(),
      ),
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(),
      ),
      actions: [IconButton(onPressed: () {}, icon: Icon(Icons.logout))],
      title: SvgPicture.asset(
        "assets/white1.svg",
        colorFilter: ColorFilter.mode(
          themeMode.value == ThemeMode.dark ? Colors.white70 : Colors.black87,
          BlendMode.srcIn,
        ),
        width: 36,
      ),
    );
  }
}
