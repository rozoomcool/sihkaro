// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class CustomBottomNavigationBar extends StatefulWidget {
//   const CustomBottomNavigationBar(
//       {super.key,
//       this.selectedIndex = 0,
//       required this.items,
//       required this.onTap});

//   final int selectedIndex;
//   final List<CustomBottomNavigationBarItem> items;
//   final void Function(int, {bool notify}) onTap;

//   @override
//   State<CustomBottomNavigationBar> createState() =>
//       _CustomBottomNavigationBarState();
// }

// class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
//   List<_CustomBottomNavigationBarItem> _items = [];

//   @override
//   void initState() {
//     super.initState();
//     processItems();
//   }

//   void processItems() {
//     _items = List.empty(growable: true);
//     for (int i = 0; i < widget.items.length; i++) {
//       _items.add(_CustomBottomNavigationBarItem(
//           selectedIcon: widget.items[i].selectedIcon,
//           label: widget.items[i].label,
//           defaultIcon: widget.items[i].defaultIcon,
//           position: i));
//     }
//   }

//   @override
//   void didUpdateWidget(covariant CustomBottomNavigationBar oldWidget) {
//     processItems();
//     super.didUpdateWidget(oldWidget);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Color(0xFF111111),
//         borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(20), topRight: Radius.circular(20)),
//       ),
//       width: double.infinity,
//       height: kBottomNavigationBarHeight +
//           MediaQuery.of(context).viewPadding.bottom,
//       padding:
//           EdgeInsets.only(bottom: MediaQuery.of(context).viewPadding.bottom),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           ..._items.map((item) {
//             return GestureDetector(
//               onTap: () => widget.onTap(item.position),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 spacing: 4,
//                 children: [
//                   Icon(
//                     item.position == widget.selectedIndex
//                         ? item.selectedIcon
//                         : item.defaultIcon,
//                     size: 32,
//                     color: item.position == widget.selectedIndex ? Theme.of(context).primaryColor.withAlpha(200) : Colors.white30,
//                   ),
//                   // Text(item.label)
//                 ],
//               ),
//             );
//           })
//         ],
//       ),
//     );
//   }
// }

// class _CustomBottomNavigationBarItem {
//   final IconData selectedIcon;
//   final IconData defaultIcon;
//   final String label;
//   final int position;

//   _CustomBottomNavigationBarItem(
//       {required this.selectedIcon,
//       required this.label,
//       required this.defaultIcon,
//       required this.position});
// }

// class CustomBottomNavigationBarItem {
//   final IconData selectedIcon;
//   final IconData defaultIcon;
//   final String label;

//   CustomBottomNavigationBarItem(
//       {required this.selectedIcon,
//       required this.label,
//       required this.defaultIcon});
// }

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sihkaro/presentation/widgets/animated_scale_wrapper.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({
    super.key,
    this.selectedIndex = 0,
    required this.items,
    required this.onTap,
    this.border,
    this.color,
  });

  final int selectedIndex;
  final List<CustomBottomNavigationBarItem> items;
  final BoxBorder? border;
  final Color? color;
  final void Function(int, {bool notify}) onTap;

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  List<_CustomBottomNavigationBarItem> _items = [];

  @override
  void initState() {
    super.initState();
    processItems();
  }

  void processItems() {
    _items = List.empty(growable: true);
    for (int i = 0; i < widget.items.length; i++) {
      _items.add(
        _CustomBottomNavigationBarItem(
          selectedIcon: widget.items[i].selectedIcon,
          label: widget.items[i].label,
          defaultIcon: widget.items[i].defaultIcon,
          selectedWidget: widget.items[i].selectedWidget,
          defaultWidget: widget.items[i].defaultWidget,
          position: i,
        ),
      );
    }
  }

  @override
  void didUpdateWidget(covariant CustomBottomNavigationBar oldWidget) {
    processItems();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(0),
        topRight: Radius.circular(0),
      ),
      child: BackdropFilter(
        blendMode: BlendMode.src,
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            color: widget.color ?? Colors.black.withAlpha(70),
            border:
                widget.border ??
                BoxBorder.fromLTRB(
                  top: BorderSide(width: 0.5, color: Colors.white10),
                ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0),
              topRight: Radius.circular(0),
            ),
          ),
          width: double.infinity,
          height:
              kBottomNavigationBarHeight +
              MediaQuery.of(context).viewPadding.bottom,
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewPadding.bottom,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ..._items.map((item) {
                return Expanded(
                  child: AnimatedScaleWrapper(
                    onTap: () => widget.onTap(item.position),
                    child: Container(
                      color: Colors.transparent,
                      width: double.infinity,
                      height: double.infinity,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 4,
                        children: [
                          if (item.defaultWidget != null &&
                              item.selectedWidget != null)
                            item.position == widget.selectedIndex
                                ? item.selectedWidget!
                                : item.defaultWidget!
                          else
                            Icon(
                              item.position == widget.selectedIndex
                                  ? item.selectedIcon
                                  : item.defaultIcon,
                              size: 32,
                              color: item.position == widget.selectedIndex
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(
                                      context,
                                    ).colorScheme.onSurface.withAlpha(180),
                            ),
                          // Text(item.label)
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomBottomNavigationBarItem {
  final IconData selectedIcon;
  final IconData defaultIcon;
  final Widget? defaultWidget;
  final Widget? selectedWidget;
  final String label;
  final int position;

  _CustomBottomNavigationBarItem({
    required this.selectedIcon,
    required this.label,
    required this.defaultIcon,
    required this.position,
    this.selectedWidget,
    this.defaultWidget,
  });
}

class CustomBottomNavigationBarItem {
  final IconData selectedIcon;
  final IconData defaultIcon;
  final Widget? defaultWidget;
  final Widget? selectedWidget;
  final String label;

  CustomBottomNavigationBarItem({
    required this.selectedIcon,
    required this.label,
    required this.defaultIcon,
    this.defaultWidget,
    this.selectedWidget,
  });
}
