import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sihkaro/presentation/router/router.gr.dart';
import 'package:sihkaro/presentation/state/theme/theme_mode_setting.dart';
import 'package:sihkaro/presentation/widgets/custom_sliver_app_bar.dart';
import 'package:sihkaro/presentation/widgets/glossy_card.dart';

class SettingItem {
  String title;
  IconData icon;
  VoidCallback onTap;

  SettingItem({required this.title, required this.icon, required this.onTap});
}

final settings = [
  SettingItem(title: 'Тема', icon: Icons.sunny, onTap: () {}),
  SettingItem(title: 'Память', icon: Icons.data_array, onTap: () {}),
];

@RoutePage()
class SettingScreen extends HookConsumerWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeSettingProvider);
    final themeModeNotifier = ref.read(themeModeSettingProvider.notifier);

    return CustomScrollView(
      slivers: [
        CustomSliverAppBar(),
        SliverList.list(
          children: [
            ListTile(
              title: Text("Темная тема"),
              leading: Icon(Icons.sunny),
              trailing: Switch(
                value: themeMode == ThemeMode.dark ? true : false,
                onChanged: (_) {
                  themeModeNotifier.changeTheme();
                },
              ),
            ),
            Divider(color: Colors.white10),
          ],
        ),
      ],
    );
  }
}
