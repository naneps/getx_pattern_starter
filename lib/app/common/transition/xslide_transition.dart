import 'package:flutter/material.dart';

class XSlideTransition extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final SlideDirection direction;
  final Offset offset;
  final Duration delay;

  XSlideTransition({
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
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this);
    Future.delayed(widget.delay, () {
      _controller!.forward();
    });
  }

  // when screen going closed reverse animation

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position:
          Tween<Offset>(begin: _slideFrom(widget.direction), end: Offset.zero)
              .animate(
        CurvedAnimation(
          parent: _controller!,
          curve: Curves.easeInOutBack,
          reverseCurve: Curves.easeInOutBack,
        ),
      ),
      child: widget.child,
    );
  }

  // @override
  // void deactivate() {
  //   super.deactivate();
  //   _controller!.reverseDuration = Duration(milliseconds: 500);
  //   _controller!
  //       .reverse(from: _controller!.value == 0.0 ? 1.0 : _controller!.value);
  // }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  // WHEN WIDGET IS REMOVED FROM THE WIDGET TREE
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
