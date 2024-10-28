import 'dart:math';
import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_color.dart';

class CircleIndicatorPainter extends CustomPainter {
  final double progress;

  CircleIndicatorPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 2;

    final paint = Paint()
      ..color = AppColors.orangeColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5;

    double startAngle = -pi / 2;
    double sweepAngle = 2 * pi * progress;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
