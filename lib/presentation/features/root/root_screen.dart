import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sihkaro/presentation/router/router.gr.dart';
import 'package:sihkaro/presentation/state/auth/auth.dart';
import 'package:sihkaro/presentation/widgets/custom_button_navigation_bar.dart';

@RoutePage()
class RootScreen extends HookConsumerWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final extendedSideBar = useState(false);
    // final authAsync = ref.watch(authProvider);
    final authNotifier = ref.read(authProvider.notifier);

    return LayoutBuilder(
      builder: (context, constraints) => ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 900),
        child: AutoTabsRouter.pageView(
          routes: const [HomeRoute(), HomeRoute(), HomeRoute()],
          builder: (context, child, controller) {
            final tabsRouter = AutoTabsRouter.of(context);

            return Scaffold(
              body: constraints.maxWidth < 640
                  ? Stack(
                      fit: StackFit.expand,
                      children: [
                        child,
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: CustomBottomNavigationBar(
                            selectedIndex: tabsRouter.activeIndex,
                            onTap: tabsRouter.setActiveIndex,
                            items: [
                              CustomBottomNavigationBarItem(
                                label: 'Statistics',
                                selectedIcon: Icons.home_filled,
                                defaultIcon: Icons.home_filled,
                              ),
                              CustomBottomNavigationBarItem(
                                label: 'Home',
                                selectedIcon: Icons.chat_rounded,
                                defaultIcon: Icons.chat_rounded,
                              ),
                              CustomBottomNavigationBarItem(
                                label: 'Settings',
                                selectedIcon: Icons.settings_rounded,
                                defaultIcon: Icons.settings_rounded,
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : Flexible(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          NavigationRail(
                            labelType: NavigationRailLabelType.selected,
                            selectedIndex: tabsRouter.activeIndex,
                            onDestinationSelected: tabsRouter.setActiveIndex,
                            destinations: const [
                              NavigationRailDestination(
                                icon: Icon(Icons.home_outlined),
                                selectedIcon: Icon(Icons.home),
                                label: Text('Home'),
                              ),
                              NavigationRailDestination(
                                icon: Icon(Icons.calendar_month_outlined),
                                selectedIcon: Icon(Icons.calendar_month),
                                label: Text('Calendar'),
                              ),
                              NavigationRailDestination(
                                icon: Icon(Icons.email_outlined),
                                selectedIcon: Icon(Icons.email),
                                label: Text('Email'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
              appBar: AppBar(
                // title: Text(
                //   "MindbookLM",
                //   style: TextStyle(
                //   ),
                // ),
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(),
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.logout_rounded),
                  ),
                ],
                backgroundColor: Colors.black,
                centerTitle: true,
                elevation: 0,
                scrolledUnderElevation: 0,
                notificationPredicate: (_) => false,
                title: Icon(Icons.logo_dev, size: 36),
              ),
              // bottomNavigationBar: constraints.maxWidth > 640
              //     ? null
              //     : CustomBottomNavigationBar(
              //         selectedIndex: tabsRouter.activeIndex,
              //         onTap: tabsRouter.setActiveIndex,
              //         items: [
              //           CustomBottomNavigationBarItem(
              //             label: 'Statistics',
              //             selectedIcon: Icons.home_filled,
              //             defaultIcon: Icons.home_filled,
              //           ),
              //           CustomBottomNavigationBarItem(
              //             label: 'Home',
              //             selectedIcon: Icons.chat_rounded,
              //             defaultIcon: Icons.chat_rounded,
              //           ),
              //           CustomBottomNavigationBarItem(
              //             label: 'Settings',
              //             selectedIcon: Icons.settings_rounded,
              //             defaultIcon: Icons.settings_rounded,
              //           ),
              //         ],
              //       ),
            );
          },
        ),
      ),
    );
  }
}
