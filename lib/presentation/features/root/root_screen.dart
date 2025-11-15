import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sihkaro/presentation/router/router.gr.dart';
import 'package:sihkaro/presentation/state/theme/theme_mode_setting.dart';
import 'package:sihkaro/presentation/widgets/app_logo.dart';
import 'package:sihkaro/presentation/widgets/custom_button_navigation_bar.dart';

@RoutePage()
class RootScreen extends HookConsumerWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final extendedSideBar = useState(false);
    // final authAsync = ref.watch(authProvider);
    // final authNotifier = ref.read(authProvider.notifier);

    final themeMode = ref.watch(themeModeSettingProvider);

    return LayoutBuilder(
      builder: (context, constraints) => ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 900),
        child: AutoTabsScaffold(
          routes: [HomeRoute(), HomeRoute(), SettingRoute()],
          backgroundColor: themeMode.value == ThemeMode.dark
              ? Colors.black
              : Colors.white,
          extendBody: true,
          bottomNavigationBuilder: (context, tabsRouter) {
            return CustomBottomNavigationBar(
              border: BoxBorder.fromLTRB(
                top: BorderSide(
                  width: 1,
                  color: themeMode.value == ThemeMode.dark
                      ? Colors.white10
                      : Colors.black12,
                ),
              ),
              color: themeMode.value == ThemeMode.dark
                  ? Colors.black.withAlpha(70)
                  : Colors.white.withAlpha(10),
              selectedIndex: tabsRouter.activeIndex,
              onTap: tabsRouter.setActiveIndex,
              items: [
                CustomBottomNavigationBarItem(
                  label: 'Home',
                  selectedIcon: Icons.home_filled,
                  defaultIcon: Icons.home_filled,
                ),
                CustomBottomNavigationBarItem(
                  label: 'Chat',
                  selectedIcon: Icons.chat_rounded,
                  defaultIcon: Icons.chat_rounded,
                  selectedWidget: AppLogo(
                    size: 28,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  defaultWidget: AppLogo(size: 28),
                ),
                CustomBottomNavigationBarItem(
                  label: 'Settings',
                  selectedIcon: Icons.settings_rounded,
                  defaultIcon: Icons.settings_rounded,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
