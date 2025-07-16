import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SideBar extends HookWidget {
  const SideBar({super.key, required this.extended});

  final bool extended;

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      elevation: null,
      backgroundColor: Theme.of(context).colorScheme.surface,
      minWidth: 72,
      extended: extended,
      labelType: NavigationRailLabelType.none,
      // leading: Padding(
      //   padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
      //   child: FloatingActionButton(
      //     elevation: 0,
      //     onPressed: () {
      //       extended.value = !extended.value;
      //     },
      //     child: Icon(Icons.logo_dev),
      //   ),
      // ),
      // leading: SizedBox.square(dimension: 12),
      destinations: [
        NavigationRailDestination(
          padding: EdgeInsets.symmetric(vertical: 8),
          icon: Icon(Icons.code),
          label: Text("Projects"),
        ),
        NavigationRailDestination(
          padding: EdgeInsets.symmetric(vertical: 8),
          icon: Icon(Icons.chat_rounded),
          label: Text("Chats"),
        ),
        NavigationRailDestination(
          padding: EdgeInsets.symmetric(vertical: 8),
          icon: Icon(Icons.folder),
          label: Text("Folders"),
        ),
        NavigationRailDestination(
          padding: EdgeInsets.symmetric(vertical: 8),
          icon: Icon(Icons.search),
          label: Text("Search"),
        ),
      ],
      selectedIndex: 0,
    );
    // return CollapsedContainer(
    //   size: 240,
    //   collapsedSize: 48,
    //   axis: Axis.horizontal,
    //   padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
    //   alignment: Alignment.topLeft,
    //   builder: (context, isExtended, toggle) {
    //     return Column(
    //       spacing: 24,
    //       children: [
    //         Row(
    //           mainAxisSize: MainAxisSize.max,
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             isExtended
    //                 ? Padding(
    //                     padding: const EdgeInsets.only(left: 8.0),
    //                     child: Text(
    //                       "SihKaro",
    //                       style: Theme.of(context).textTheme.titleMedium,
    //                     ),
    //                   )
    //                 : IconButton(onPressed: toggle, icon: Icon(Icons.logo_dev)),
    //             if (isExtended)
    //               IconButton(onPressed: toggle, icon: Icon(Icons.logo_dev)),
    //           ],
    //         ),
    //         Column(
    //           spacing: 4,
    //           children: [
    //             InkWell(
    //               onTap: () {},
    //               borderRadius: BorderRadius.circular(10),
    //               child: Padding(
    //                 padding: const EdgeInsets.all(8.0),
    //                 child: Row(
    //                   mainAxisSize: MainAxisSize.max,
    //                   spacing: 8,
    //                   children: [
    //                     Icon(Icons.create_new_folder_rounded),
    //                     if (isExtended) Text("Create new chat"),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //             InkWell(
    //               onTap: () {},
    //               borderRadius: BorderRadius.circular(10),
    //               child: Padding(
    //                 padding: const EdgeInsets.all(8.0),
    //                 child: Row(
    //                   mainAxisSize: MainAxisSize.max,
    //                   spacing: 8,
    //                   children: [
    //                     Icon(Icons.create_new_folder_rounded),
    //                     if (isExtended) Text("Create new chat"),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //             InkWell(
    //               onTap: () {},
    //               borderRadius: BorderRadius.circular(10),
    //               child: Padding(
    //                 padding: const EdgeInsets.all(8.0),
    //                 child: Row(
    //                   mainAxisSize: MainAxisSize.max,
    //                   spacing: 8,
    //                   children: [
    //                     Icon(Icons.create_new_folder_rounded),
    //                     if (isExtended) Text("Create new chat"),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ],
    //     );
    //   },
    // );
  }
}
