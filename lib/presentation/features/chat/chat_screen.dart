import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:markdown_widget/config/configs.dart';
import 'package:markdown_widget/widget/blocks/leaf/code_block.dart';
import 'package:markdown_widget/widget/inlines/code.dart';
import 'package:markdown_widget/widget/markdown.dart';
import 'package:sihkaro/presentation/features/note/note_screen.dart';
import 'package:sihkaro/presentation/state/theme/theme_mode_setting.dart';
import 'package:sihkaro/presentation/widgets/app_logo.dart';
import 'package:sihkaro/presentation/widgets/custom_app_bar.dart';
import 'package:sihkaro/presentation/widgets/glossy_card.dart';

@RoutePage()
class ChatScreen extends HookConsumerWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeSettingProvider);

    return Scaffold(
      // extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: themeMode.value == ThemeMode.dark
          ? Colors.black
          : Colors.white,
      appBar: CustomAppBar(),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                spacing: 16,
                children: [
                  SizedBox(
                    height:
                        MediaQuery.paddingOf(context).top +
                        kToolbarHeight,
                  ),
                  Row(
                    children: [
                      Expanded(flex: 1, child: SizedBox()),
                      Expanded(
                        flex: 6,
                        child: Card(
                          elevation: 0,
                          color: Theme.of(context).cardColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(24),
                          ),
                          child: Padding(
                            padding: EdgeInsetsGeometry.all(12),
                            child: Text(
                              "Напиши мне справочник по golang, приводя примеры и пояснения. Сделай его емким и обширным.",
                              maxLines: null,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        spacing: 16,
                        children: [
                          CircleAvatar(child: AppLogo(size: 24)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            spacing: 4,
                            children: [
                              Text(
                                "Прочитать 7 веб страниц",
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(
                                      decoration: TextDecoration.underline,
                                    ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Theme.of(context).colorScheme.onSurface,
                                size: 18,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Flexible(
                        child: MarkdownWidget(
                          padding: EdgeInsets.all(0),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          config: MarkdownConfig(
                            configs: [
                              PreConfig(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              CodeConfig(
                                style: TextStyle(
                                  backgroundColor: Theme.of(context).cardColor,
                                ),
                              ),
                            ],
                          ),
                          data: mrtext,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 270),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                right: 16.0,
                left: 16.0,
                bottom: MediaQuery.paddingOf(context).bottom + 16,
                // bottom: 16 + MediaQuery.of(context).viewPadding.bottom,
              ),
              child: GlossyCard(
                padding: EdgeInsets.all(8),
                borderRadius: BorderRadius.circular(28),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: TextField(
                        minLines: 1,
                        maxLines: 4,
                        decoration: InputDecoration(
                          prefixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.attachment_rounded),
                          ),
                          hintText: "Введите запрос",
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.keyboard_return_rounded),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
