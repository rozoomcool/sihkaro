import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sihkaro/presentation/features/chat/chat_panel.dart';
import 'package:sihkaro/presentation/features/source/source_panel.dart';
import 'package:sihkaro/presentation/features/studio/studio_panel.dart';
import 'package:sihkaro/presentation/widgets/glossy_card.dart';

@RoutePage()
class NoteScreen extends HookConsumerWidget {
  const NoteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        notificationPredicate: (_) => false,
        flexibleSpace: GlossyCard(
          child: Container(),
          borderRadius: BorderRadius.all(Radius.zero),
          border: BoxBorder.fromLTRB(
            bottom: BorderSide(width: 1, color: Colors.white10),
          ),
        ),
        elevation: null,
        title: Text("Блокнот 1"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.source))],
      ),
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.symmetric(horizontal: 16),
        color: Colors.transparent,
        child: GlossyCard(
          padding: EdgeInsets.all(8),
          borderRadius: BorderRadius.circular(20),
          border: BoxBorder.all(width: 1, color: Colors.white10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: TextField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: "Введите запрос",
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.send_rounded)),
            ],
          ),
        ),
      ),
      body: Placeholder(),
    );
  }
}
