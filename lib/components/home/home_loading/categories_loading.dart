import 'package:flutter/material.dart';
import 'package:shayplanner/theme/theme_circle_painter.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/tools/extension.dart';
import 'package:shimmer/shimmer.dart';

class CategoriesLoading extends StatelessWidget {
  const CategoriesLoading({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
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
                  SizedBox(width: 4.0.wp),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomPaint(
                        size: Size(4.5.hp * 2, 4.5 * 2),
                        painter: CirclePainter(
                          percentage: 0.85,
                          // backgroundColor: Colors.red,
                          progressColor: yellow,
                        ),
                        child: CircleAvatar(
                          radius: 4.5.hp,
                          backgroundImage:
                             const  AssetImage("assets/images/template_circle.png"),
                        ),
                      ),
                      SizedBox(height: 8.0.sp),
                      Container(
                          color: Colors.black, width: 15.0.wp, height: 5.0.sp)
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
