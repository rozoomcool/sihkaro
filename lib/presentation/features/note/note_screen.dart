import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sihkaro/presentation/state/theme/theme_mode_setting.dart';
import 'package:sihkaro/presentation/widgets/glossy_card.dart';

@RoutePage()
class NoteScreen extends HookConsumerWidget {
  const NoteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeSettingProvider);

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
            bottom: BorderSide(
              width: 1,
              color: themeMode.value == ThemeMode.dark
                  ? Colors.white10
                  : Colors.black12,
            ),
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
