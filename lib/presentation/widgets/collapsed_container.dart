import 'package:flutter/material.dart';

class CollapsedContainer extends StatefulWidget {
  const CollapsedContainer({
    super.key,
    required this.collapsedSize,
    required this.axis,
    required this.builder,
    required this.alignment,
    this.size,
    this.shape,
    this.color,
    this.padding,
  });

  final double? size;
  final double collapsedSize;
  final Axis axis;
  final AlignmentGeometry alignment;
  final Widget Function(
    BuildContext context,
    bool isExtended,
    VoidCallback toggleCollapse,
  )
  builder;
  final ShapeBorder? shape;
  final Color? color;
  final EdgeInsets? padding;

  @override
  State<CollapsedContainer> createState() => _CollapsedContainerState();
}

class _CollapsedContainerState extends State<CollapsedContainer> {
  bool isExtended = true;
  bool isShowExpanded = true;

  void toggle() => setState(() {
    isExtended = !isExtended;
    if (!isExtended) {
      showExpanded(false);
    }
  });

  void showExpanded(bool value) {
    setState(() {
      isShowExpanded = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      onEnd: () {
        if (isExtended) {
          showExpanded(true);
        }
      },
      alignment: widget.alignment,
      curve: Curves.easeIn,
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
        color:
            widget.color ?? Theme.of(context).colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(12),
      ),
      width: widget.axis == Axis.horizontal
          ? isExtended
                ? widget.size
                : widget.collapsedSize
          : null,
      height: widget.axis == Axis.vertical
          ? isExtended
                ? widget.size
                : widget.collapsedSize
          : null,
      padding: widget.padding,
      child: widget.builder(context, isShowExpanded, toggle),
    );
  }
}
