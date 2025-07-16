import 'package:flutter/material.dart';
import 'package:sihkaro/presentation/features/source/source_panel.dart';
import 'package:sihkaro/presentation/features/studio/studio_panel.dart';
import 'package:sihkaro/presentation/state/theme_mode_state_widget.dart';
import 'package:sihkaro/presentation/widgets/collapsed_container.dart';
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
        title: Text("SihKaro"),
        centerTitle: false,
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
                  Flexible(
                    fit: FlexFit.tight,
                    child: CollapsedContainer(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(12),
                      ),
                      collapsedSize: 48,
                      axis: Axis.horizontal,
                      alignment: Alignment.topLeft,
                      builder: (context, _, __) {
                        return Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 8.0,
                                    left: 8.0,
                                    right: 8.0,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Чат",
                                        style: Theme.of(
                                          context,
                                        ).textTheme.titleMedium,
                                      ),
                                      IconButton(
                                        onPressed: null,
                                        icon: Icon(Icons.chat),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ),
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
