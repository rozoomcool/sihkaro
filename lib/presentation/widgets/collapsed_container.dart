import 'package:flutter/material.dart';

class CollapsedContainer extends StatefulWidget {
  const CollapsedContainer({
    super.key,
    required this.collapsedSize,
    required this.axis,
    required this.builder,
    required this.alignment,
    required this.size,
    this.shape,
    this.color,
    this.padding,
  });

  final double size;
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

class _CollapsedContainerState extends State<CollapsedContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;
  bool isExtended = false;
  bool isShowExpanded = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );

    _initAnimation();
  }

  void _initAnimation() {
    final double begin = widget.collapsedSize;
    final double end = widget.size;

    _sizeAnimation =
        Tween<double>(begin: begin, end: end).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeIn),
        )..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            setState(() => isShowExpanded = true);
          } else if (status == AnimationStatus.reverse) {
            setState(() => isShowExpanded = false);
          }
        });

    // toggle();
  }

  void toggle() {
    setState(() {
      isExtended = !isExtended;
      if (isExtended) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  void didUpdateWidget(CollapsedContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
    _initAnimation(); // переинициализируем tween при изменениях
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _sizeAnimation,
      builder: (context, child) {
        return Align(
          alignment: widget.alignment,
          child: Container(
            decoration: ShapeDecoration(
              color:
                  widget.color ??
                  Theme.of(context).colorScheme.surfaceContainerLow,
              shape:
                  widget.shape ??
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
            ),
            width: widget.axis == Axis.horizontal ? _sizeAnimation.value : null,
            height: widget.axis == Axis.vertical ? _sizeAnimation.value : null,
            padding: widget.padding,
            child: widget.builder(context, isShowExpanded, toggle),
          ),
        );
      },
    );
  }
}
