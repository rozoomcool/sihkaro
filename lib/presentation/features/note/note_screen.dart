import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:sihkaro/presentation/features/chat/chat_panel.dart';
import 'package:sihkaro/presentation/features/source/source_panel.dart';
import 'package:sihkaro/presentation/features/studio/studio_panel.dart';

@RoutePage()
class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SideBar(extended: extendedSideBar),
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
      );
  }
}