import 'dart:ui';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sihkaro/presentation/widgets/glossy_card.dart';
import 'package:sihkaro/presentation/widgets/sliver_app_bar_delegate.dart';

@RoutePage()
class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final now = DateTime.now();
    final items = List.generate(
      20,
      (i) => now.subtract(Duration(hours: i * 3)),
    ); // имитация разных дат

    final dateFormatter = DateFormat('d MMMM yyyy', 'ru');

    String formatDate(DateTime dt) =>
        dateFormatter.format(DateTime(dt.year, dt.month, dt.day));

    return CustomScrollView(
      slivers: [
        //  AppBar(

        //       actions: [IconButton(onPressed: () {}, icon: Icon(Icons.logout))],

        //     )
        SliverAppBar(
          // pinned: true,
          floating: true,
          // snap: true,
          // stretch: true,
          backgroundColor: Colors.transparent,
          elevation: null,
          flexibleSpace: GlossyCard(
            border: BoxBorder.fromLTRB(
              bottom: BorderSide(color: Colors.white10, width: 1),
            ),
            borderRadius: BorderRadius.all(Radius.zero),
            child: Container(),
          ),
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(),
          ),
          title: SvgPicture.asset(
            "assets/white1.svg",
            colorFilter: ColorFilter.mode(Colors.white70, BlendMode.srcIn),
            width: 36,
          ),
        ),
        SliverPersistentHeader(
          floating: true,
          delegate: SliverAppBarDelegate(
            minHeight: 56,
            maxHeight: 56 + kToolbarHeight,
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
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                ],
              ),
            ),
          ),
        ),
        // SliverToBoxAdapter(
        //   child: Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Text(
        //           "Ваши блокноты",
        //           style: Theme.of(context).textTheme.titleLarge,
        //         ),
        //         IconButton(onPressed: () {}, icon: Icon(Icons.add)),
        //       ],
        //     ),
        //   ),
        // ),
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
            return Divider(thickness: 1, color: Colors.white10);
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
    );
  }
}
