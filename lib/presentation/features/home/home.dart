import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sihkaro/domain/api/dto/notebook/notebook.dart';
import 'package:sihkaro/domain/api/notebook/notebook.dart';
import 'package:sihkaro/presentation/providers/notebook/notebook.dart';
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
    final notebooks = ref.watch(getUserNotebooksProvider);

    Future<void> createNotebook() async {
      await GetIt.I<NotebookRestClient>()
          .addNotebook(NotebookCreate(title: "Новый блокнот"))
          .then((v) {
            ref.invalidate(getUserNotebooksProvider);
            if (context.mounted) context.pushRoute(NoteRoute(id: v.id));
          })
          .onError((e, s) {});
    }

    return CustomScrollView(
      slivers: [
        CustomSliverAppBar(),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: Card(
              elevation: 0,
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
                  color: themeMode.value == ThemeMode.dark
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
                      onPressed: createNotebook,
                      icon: Icon(Icons.add),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        switch (notebooks) {
          AsyncData(:final value) => SliverList.separated(
            itemCount: value.length,
            separatorBuilder: (context, index) {
              final prevDate = formatDate(value[index].updatedAt);
              final nextDate = formatDate(value[index + 1].updatedAt);
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
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(
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
                key: ValueKey(value[i].id),
                // contentPadding: const EdgeInsets.all(8),
                title: Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(value[i].title),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(formatDateH(value[i].updatedAt)),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert),
                ),
                onTap: () {
                  context.router.push(NoteRoute(id: value[i].id));
                },
              );
            },
          ),
          AsyncError(:final error) => SliverToBoxAdapter(
            child: Text("Ошибка: $error"),
          ),
          _ => const SliverToBoxAdapter(child: Text("Loading")),
        },

        SliverToBoxAdapter(
          child: SizedBox(height: MediaQuery.paddingOf(context).bottom + 16),
        ),
      ],
    );
  }
}

final dateFormatter = DateFormat('d MMMM yyyy', 'ru');
final dateFormatterHours = DateFormat('d MMMM yyyy hh:mm', 'ru');
String formatDate(DateTime dt) =>
    dateFormatter.format(DateTime(dt.year, dt.month, dt.day));
String formatDateH(DateTime dt) => dateFormatterHours.format(
  DateTime(dt.year, dt.month, dt.day, dt.hour, dt.minute),
);
