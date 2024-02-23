import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/tools/extension.dart';
import 'package:shimmer/shimmer.dart';


class CategoriesLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return  Container(
                alignment: Alignment.center,
                height: 14.0.hp,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: ListView.builder(
                      itemCount: 5, // Adjust the count based on your needs
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            SizedBox(width: 3.0.wp),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomPaint(
                                    size: Size(4.0.hp * 2, 4.0 * 2),
                                    painter: CirclePainter(
                                      percentage: 0.85,
                                      // backgroundColor: Colors.red,
                                      progressColor: yellow,
                                    ),
                                    child: CircleAvatar(
                                      radius: 4.0.hp,
                                      backgroundImage: AssetImage(
                                          "assets/images/template_circle.png"),
                                    )),
                                SizedBox(height: 8.0.sp),
                                Container(
                                    color: Colors.black,
                                    width: 15.0.wp,
                                    height: 5.0.sp)
                              ],
                            ),
                            SizedBox(width: 3.0.wp),
                          ],
                        );
                      }),
                ),
              );
  }
  
}
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
          Color(0xFFCFB83F),
          Color(0xFFF4E282),
          Color(0xFFC7AB48),
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

