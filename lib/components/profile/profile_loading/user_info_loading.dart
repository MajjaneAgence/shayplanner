import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/theme/theme_text.dart';
import 'package:shayplanner/tools/extension.dart';
import 'package:shimmer/shimmer.dart';

import '../../../theme/theme_circle_painter.dart';

class UserInfoLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child:
    Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: 10.0.wp),
        Stack(
          children: [
            Container(
              width: 25.0.wp,
              //color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 2.0.hp),
                  CustomPaint(
                      size: Size(4.0.hp * 2, 4.0 * 2),
                      painter: CirclePainter(
                        percentage: 0.8,
                        // backgroundColor: Colors.red,
                        progressColor: yellow,
                      ),
                      child: CircleAvatar(
                          radius: 4.0.hp,
                          backgroundImage: AssetImage(
                            "assets/icons/profile/user-with-no-picture.png",
                          ))),
                  SizedBox(height: 3.0.hp),
                ],
              ),
            ),
            Positioned(
              left: 15.0.wp,
              top: 8.0.hp,
              child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 1.5.wp, horizontal: 1.5.wp),
                  width: 7.0.wp,
                  height: 7.0.wp,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: darkOrange),
                  child: Image.asset(
                    "assets/icons/profile/camera.png",
                  )),
            )
          ],
        ),
        SizedBox(width: 3.0.wp),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 0.5.hp,
              width: 20.0.wp,
              color: black,
            ),
            SizedBox(height: 1.0.wp),
            Container(
              height: 0.5.hp,
              width: 20.0.wp,
              color: black,
            ),
          ],
        )
      ],
    )
   );
  }
}
