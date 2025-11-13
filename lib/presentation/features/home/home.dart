import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

@RoutePage()
class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listColors = [
      Colors.green,
      Colors.blue,
      Colors.orange,
      Colors.purple,
      Colors.cyan,
      Colors.pink,
      Colors.teal,
    ];

    final now = DateTime.now();
    final items = List.generate(
      20,
      (i) => now.subtract(Duration(hours: i * 3)),
    ); // имитация разных дат

    final dateFormatter = DateFormat('d MMMM yyyy', 'ru');

    String formatDate(DateTime dt) =>
        dateFormatter.format(DateTime(dt.year, dt.month, dt.day));

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          SizedBox(
            height: kToolbarHeight * 2 + MediaQuery.of(context).viewPadding.top,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ваши блокноты",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.add)),
              ],
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
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
                        padding: const EdgeInsets.symmetric(horizontal: 8),
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
              return Divider(thickness: 1, color: Colors.white10);
            },
            itemBuilder: (context, i) {
              final color = listColors[i % listColors.length];
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

                // tileColor: Colors.white,
                // tileColor: color.withAlpha(10),
                // selectedTileColor: color.withAlpha(20),
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(16),
                // ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert),
                ),
                onTap: () {},
              );
            },
          ),
        ],
      ),
    );
  }
}
