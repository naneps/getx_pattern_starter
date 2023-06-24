import 'package:flutter/material.dart';

class XSlideTransition extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final SlideDirection direction;
  final Offset offset;
  final Duration delay;

  const XSlideTransition({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
    this.offset = const Offset(1, 0),
    this.delay = const Duration(milliseconds: 0),
    this.direction = SlideDirection.left,
  });

  @override
  _XSlideTransitionState createState() => _XSlideTransitionState();
}

class _XSlideTransitionState extends State<XSlideTransition>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: _slideFrom(widget.direction),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutBack,
        reverseCurve: Curves.easeInOutBack,
      ),
    );
    Future.delayed(widget.delay, () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the AnimationController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: widget.child,
    );
  }

  Offset _slideFrom(SlideDirection direction) {
    switch (direction) {
      case SlideDirection.left:
        return const Offset(-1, 0);
      case SlideDirection.right:
        return const Offset(1, 0);
      case SlideDirection.top:
        return const Offset(0, -1);
      case SlideDirection.bottom:
        return const Offset(0, 1);
    }
  }
}

enum SlideDirection { left, right, top, bottom }
