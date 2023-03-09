import 'package:flutter/material.dart';

class XFadeTransition extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Duration delay;

  const XFadeTransition({
    super.key,
    required this.child,
    this.delay = const Duration(milliseconds: 0),
    this.duration = const Duration(milliseconds: 500),
  });

  @override
  _XFadeTransitionState createState() => _XFadeTransitionState();
}

class _XFadeTransitionState extends State<XFadeTransition>
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

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: _controller!,
            curve: Curves.easeIn,
            reverseCurve: Curves.easeOut),
      ),
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _controller!.reverse();
    _controller!.dispose();
    super.dispose();
  }
}
