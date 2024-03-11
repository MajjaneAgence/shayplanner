import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shayplanner/tools/extension.dart';

class CirclePainter extends CustomPainter {
  final double percentage;
  final Color progressColor;
  final double
      strokeWidth; // Added strokeWidth to control the thickness of the progress arc

  CirclePainter({
    required this.percentage,
    required this.progressColor,
    this.strokeWidth = 4.0, // Default stroke width
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint bgPaint = Paint()..style = PaintingStyle.fill;
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);

    Paint progressPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Color(0xFFD79F6C),
          Color(0xFFFFDBBA),
          Color(0xFFD79F6C),
        ], // Example gradient colors
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    // Calculate the inner radius by subtracting the strokeWidth from the outer radius
    double innerRadius = radius + strokeWidth / 2 + 2.0.sp;

    canvas.drawCircle(center, radius, bgPaint);

    double sweepAngle = 2 * pi * percentage;
    canvas.drawArc(
      Rect.fromCircle(
          center: center, radius: innerRadius), // Use the inner radius here
      -pi / 2,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
