import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sihkaro/presentation/router/router.gr.dart';
import 'package:sihkaro/presentation/state/auth/auth.dart';
import 'package:sihkaro/presentation/state/theme/theme_mode_setting.dart';
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
          // list of your tab routes
          // routes used here must be declared as children
          // routes of /dashboard
          routes: const [HomeRoute(), HomeRoute(), HomeRoute()],
          builder: (context, child, controller) {
            // obtain the scoped TabsRouter controller using context
            final tabsRouter = AutoTabsRouter.of(context);
            // Here we're building our Scaffold inside of AutoTabsRouter
            // to access the tabsRouter controller provided in this context
            //
            // alternatively, you could use a global key
            return Scaffold(
              body: child,
              appBar: AppBar(
                title: Text(
                  "MindbookLM",
                  style: TextStyle(
                    // fontSize: 60.0,
                    // fontWeight: FontWeight.bold,
                    // foreground: Paint()..shader = linearGradient,
                  ),
                ),
                backgroundColor: Colors.transparent,
                centerTitle: false,
                elevation: 0,
                scrolledUnderElevation: 0,
                notificationPredicate: (_) => false,
                leading: Icon(Icons.logo_dev, size: 36),
              ),
              bottomNavigationBar: constraints.maxWidth > 375 ? null : CustomBottomNavigationBar(
                selectedIndex: tabsRouter.activeIndex,
                onTap: tabsRouter.setActiveIndex,
                items: [
                  CustomBottomNavigationBarItem(
                    label: 'Statistics',
                    selectedIcon: Icons.home_rounded,
                    defaultIcon: Icons.home_filled,
                  ),
                  CustomBottomNavigationBarItem(
                    label: 'Home',
                    selectedIcon: Icons.home_rounded,
                    defaultIcon: Icons.home_filled,
                  ),
                  CustomBottomNavigationBarItem(
                    label: 'Settings',
                    selectedIcon: Icons.home_rounded,
                    defaultIcon: Icons.home_filled,
                  ),
                  // CustomBottomNavigationBarItem(
                  //     label: 'Statistics', selectedIcon: Icons.graphic_eq_rounded, defaultIcon: Icons.graphic_eq_outlined),
                ],
              ),
              // NavigationBar(
              //   selectedIndex: tabsRouter.activeIndex,
              //   onDestinationSelected: (index) {
              //     // here we switch between tabs
              //     tabsRouter.setActiveIndex(index);
              //   },
              //   destinations: [
              //     NavigationDestination(
              //       label: 'Users',
              //       icon: Icon(Icons.account_box_outlined),
              //     ),
              //     NavigationDestination(
              //       label: 'Posts',
              //       icon: Icon(Icons.newspaper),
              //     ),
              //     NavigationDestination(
              //       label: 'Settings',
              //       icon: Icon(Icons.settings),
              //     ),
              //   ],
              // ),
            );
          },
        ),
      ),
    );

    // return AutoTabsScaffold(
    //   extendBody: true,
    //   extendBodyBehindAppBar: true,
    //   routes: const [HomeRoute(), HomeRoute(), HomeRoute()],
    //   // backgroundColor: Colors.transparent,
    //   transitionBuilder: (context, child, animation) =>
    //       ScaleTransition(scale: animation, child: child),
    //   appBarBuilder: (context, _) => AppBar(
    //     title: Text("Workaem"),
    //     backgroundColor: Colors.transparent,
    //     elevation: 0,
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.only(
    //         bottomLeft: Radius.circular(20),
    //         bottomRight: Radius.circular(20),
    //       ),
    //     ),
    //     flexibleSpace: ClipRRect(
    //       borderRadius: BorderRadius.only(
    //         bottomLeft: Radius.circular(20),
    //         bottomRight: Radius.circular(20),
    //       ),
    //       child: BackdropFilter(
    //         blendMode: BlendMode.src,
    //         filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
    //         child: Container(
    //           decoration: BoxDecoration(
    //             borderRadius: BorderRadius.only(
    //               bottomLeft: Radius.circular(20),
    //               bottomRight: Radius.circular(20),
    //             ),
    //             color: Colors.black.withAlpha(70),
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    //   bottomNavigationBuilder: (_, tabsRouter) {
    //     return CustomBottomNavigationBar(
    //       selectedIndex: tabsRouter.activeIndex,
    //       onTap: tabsRouter.setActiveIndex,
    //       items: [
    //         CustomBottomNavigationBarItem(
    //           label: 'Statistics',
    //           selectedIcon: Icons.home_rounded,
    //           defaultIcon: Icons.home_filled,
    //         ),
    //         CustomBottomNavigationBarItem(
    //           label: 'Home',
    //           selectedIcon: Icons.home_rounded,
    //           defaultIcon: Icons.home_filled,
    //         ),
    //         CustomBottomNavigationBarItem(
    //           label: 'Settings',
    //           selectedIcon: Icons.home_rounded,
    //           defaultIcon: Icons.home_filled,
    //         ),
    //         // CustomBottomNavigationBarItem(
    //         //     label: 'Statistics', selectedIcon: Icons.graphic_eq_rounded, defaultIcon: Icons.graphic_eq_outlined),
    //       ],
    //     );
    //   },
    // );

    // return Scaffold(
    //   backgroundColor: Color.fromARGB(0, 200, 200, 200),
    //   // backgroundColor: Theme.of(context).colorScheme.surface,
    //   appBar: AppBar(
    //     title: Text(
    //       "MindbookLM",
    //       style: TextStyle(
    //         // fontSize: 60.0,
    //         // fontWeight: FontWeight.bold,
    //         // foreground: Paint()..shader = linearGradient,
    //       ),
    //     ),
    //     centerTitle: false,
    //     elevation: 0,
    //     scrolledUnderElevation: 0,
    //     notificationPredicate: (_) => false,
    //     leading: Icon(Icons.logo_dev, size: 36,),
    //     actions: [
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: IconButton(
    //           onPressed: themeModeSettingNotifier.changeTheme,
    //           icon: Icon(Icons.light_mode),
    //         ),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: IconButton(
    //           onPressed: authNotifier.logout,
    //           icon: Icon(Icons.logout),
    //         ),
    //       ),
    //     ],
    //   ),
    //   body: AutoRouter(),
    // );
  }
}
