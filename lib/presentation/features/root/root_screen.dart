import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sihkaro/presentation/state/theme_mode_state_widget.dart';
// import 'package:sihkaro/presentation/widgets/side_bar.dart';

@RoutePage()
class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  bool extendedSideBar = false;

  final Shader linearGradient = LinearGradient(
    colors: <Color>[Colors.purple, Colors.cyan],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 50.0, 20.0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text(
          "MindbookLM",
          style: TextStyle(
            // fontSize: 60.0,
            fontWeight: FontWeight.bold,
            foreground: Paint()..shader = linearGradient,
          ),
        ),
        centerTitle: false,
        elevation: 0,
        scrolledUnderElevation: 0,
        notificationPredicate: (_) => false,
        leading: IconButton(
          onPressed: () {
            setState(() {
              extendedSideBar = !extendedSideBar;
            });
          },
          icon: Icon(Icons.menu),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: ThemeModeStateWidget.of(context).change,
              icon: Icon(Icons.light_mode),
            ),
          ),
        ],
      ),
      body: AutoRouter(),
    );
  }
}
