import 'package:flutter/material.dart';
import 'package:sihkaro/presentation/features/chat/chat_panel.dart';
import 'package:sihkaro/presentation/features/source/source_panel.dart';
import 'package:sihkaro/presentation/features/studio/studio_panel.dart';
import 'package:sihkaro/presentation/state/theme_mode_state_widget.dart';
import 'package:sihkaro/presentation/widgets/side_bar.dart';

class RootLayout extends StatefulWidget {
  const RootLayout({super.key});

  @override
  State<RootLayout> createState() => _RootLayoutState();
}

class _RootLayoutState extends State<RootLayout> {
  bool extendedSideBar = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: Text("Sihkaro"),
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
      body: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SideBar(extended: extendedSideBar),
          Flexible(
            fit: FlexFit.tight,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                spacing: 12,
                children: [
                  SourcePanel(),
                  Flexible(fit: FlexFit.tight, child: ChatPanel()),
                  StudioPanel(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
