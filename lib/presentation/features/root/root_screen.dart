import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    // final authNotifier = ref.read(authProvider.notifier);

    return LayoutBuilder(
      builder: (context, constraints) => ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 900),
        child: AutoTabsScaffold(
          routes: [HomeRoute(), HomeRoute(), HomeRoute()],
          // constraints.maxWidth < 640?
          // : Flexible(
          //     child: Row(
          //       mainAxisSize: MainAxisSize.max,
          //       children: [
          //         NavigationRail(
          //           labelType: NavigationRailLabelType.selected,
          //           selectedIndex: tabsRouter.activeIndex,
          //           onDestinationSelected: tabsRouter.setActiveIndex,
          //           destinations: const [
          //             NavigationRailDestination(
          //               icon: Icon(Icons.home_outlined),
          //               selectedIcon: Icon(Icons.home),
          //               label: Text('Home'),
          //             ),
          //             NavigationRailDestination(
          //               icon: Icon(Icons.calendar_month_outlined),
          //               selectedIcon: Icon(Icons.calendar_month),
          //               label: Text('Calendar'),
          //             ),
          //             NavigationRailDestination(
          //               icon: Icon(Icons.email_outlined),
          //               selectedIcon: Icon(Icons.email),
          //               label: Text('Email'),
          //             ),
          //           ],
          //         ),
          //       ],
          //     ),
          //   ),
          
          // appBarBuilder: (context, router) {
          //   return AppBar(
          //     backgroundColor: Colors.transparent,
          //     elevation: null,
          //     flexibleSpace: ClipRRect(
          //       borderRadius: BorderRadius.only(
          //         bottomLeft: Radius.circular(0),
          //         bottomRight: Radius.circular(0),
          //       ),
          //       child: BackdropFilter(
          //         blendMode: BlendMode.src,
          //         filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
          //         child: Container(
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.only(
          //               bottomLeft: Radius.circular(0),
          //               bottomRight: Radius.circular(0),
          //             ),
          //             border: BoxBorder.fromLTRB(
          //               bottom: BorderSide(width: 1, color: Colors.white10),
          //             ),
          //             color: Colors.black12,
          //           ),
          //         ),
          //       ),
          //     ),
          //     leading: Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: CircleAvatar(),
          //     ),
          //     actions: [IconButton(onPressed: () {}, icon: Icon(Icons.logout))],
          //     title: SvgPicture.asset(
          //       "assets/white1.svg",
          //       colorFilter: ColorFilter.mode(Colors.white70, BlendMode.srcIn),
          //       width: 36,
          //     ),
          //   );
          // },
          backgroundColor: Colors.black,
          extendBody: true,
          bottomNavigationBuilder: (context, tabsRouter) {
            return CustomBottomNavigationBar(
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
            );
          },
        ),
      ),
    );
  }
}
