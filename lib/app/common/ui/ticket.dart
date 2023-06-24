import 'package:flutter/material.dart';

class TicketWidget extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  const TicketWidget({
    Key? key,
    this.width = 200,
    this.height = 100,
    this.color = Colors.orange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      painter: _TicketPainter(color),
    );
  }
}

class _TicketPainter extends CustomPainter {
  final Color color;

  _TicketPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..quadraticBezierTo(size.width, size.height * 0.8, 0, size.height * 0.9)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);

    final rectPath = Path();

    canvas.drawPath(rectPath, paint);
  }

  @override
  bool shouldRepaint(_TicketPainter oldDelegate) {
    return color != oldDelegate.color;
  }
}
