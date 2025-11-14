import 'dart:ui';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sihkaro/presentation/router/router.gr.dart';
import 'package:sihkaro/presentation/state/theme/theme_mode_setting.dart';
import 'package:sihkaro/presentation/widgets/custom_divider.dart';
import 'package:sihkaro/presentation/widgets/custom_sliver_app_bar.dart';
import 'package:sihkaro/presentation/widgets/glossy_card.dart';
import 'package:sihkaro/presentation/widgets/sliver_app_bar_delegate.dart';

@RoutePage()
class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeSettingProvider);
    final now = DateTime.now();
    final items = List.generate(
      20,
      (i) => now.subtract(Duration(hours: i * 3)),
    );

    final dateFormatter = DateFormat('d MMMM yyyy', 'ru');

    String formatDate(DateTime dt) =>
        dateFormatter.format(DateTime(dt.year, dt.month, dt.day));

    return CustomScrollView(
      slivers: [
        CustomSliverAppBar(),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: Card(
              color: Theme.of(context).cardColor.withAlpha(255),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 16,
                  children: [
                    Text(
                      "Добро пожаловать в MindBookLM",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text("Исследуйте мир вместе с нами"),
                  ],
                ),
              ),
            ),
          ),
        ),
        SliverPersistentHeader(
          pinned: true,
          delegate: SliverAppBarDelegate(
            minHeight: 56,
            maxHeight: 56,
            child: GlossyCard(
              borderRadius: BorderRadius.circular(0),
              padding: EdgeInsets.all(0),
              border: BoxBorder.fromLTRB(
                bottom: BorderSide(
                  width: 1,
                  color: themeMode == ThemeMode.dark
                      ? Colors.white10
                      : Colors.black12,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 4,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Ваши блокноты",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    IconButton(
                      onPressed: () {
                        context.router.push(NoteRoute());
                      },
                      icon: Icon(Icons.add),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SliverList.separated(
          itemCount: items.length,
          separatorBuilder: (context, index) {
            final prevDate = formatDate(items[index]);
            final nextDate = formatDate(items[index + 1]);
            if (prevDate != nextDate) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  children: [
                    // Expanded(child: Divider(thickness: 1)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        nextDate,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                      ),
                    ),
                    // Expanded(child: Divider(thickness: 1)),
                  ],
                ),
              );
            }
            return CustomDivider();
          },
          itemBuilder: (context, i) {
            return ListTile(
              // contentPadding: const EdgeInsets.all(8),
              title: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text('Элемент ${i + 1}'),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(DateFormat.Hm().format(items[i])),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert),
              ),
              onTap: () {
                context.router.push(NoteRoute());
              },
            );
          },
        ),
      ],
    );
  }
}
