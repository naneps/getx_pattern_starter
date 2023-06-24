import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BlinkIcon extends StatefulWidget {
  IconData? icon;
  Color? color;
  double? size;
  BlinkIcon({
    super.key,
    this.icon,
    this.color,
    this.size,
  });
  @override
  // ignore: library_private_types_in_public_api
  _BlinkIconState createState() => _BlinkIconState();
}

class _BlinkIconState extends State<BlinkIcon>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _controller!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller!.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller!.forward();
      }
    });

    _controller!.forward();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller!,
      child: Icon(
        widget.icon ?? Icons.error,
        color: widget.color ?? Colors.red,
        size: widget.size ?? 20,
      ),
    );
  }
}
