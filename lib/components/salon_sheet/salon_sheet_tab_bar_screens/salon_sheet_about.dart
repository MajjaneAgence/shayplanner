import 'package:shayplanner/components/salon_sheet/salon_sheet_controller.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/theme/theme_text.dart';
import 'package:shayplanner/tools/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/theme_circle_painter.dart';

class SalonSheetAbout extends StatelessWidget {
    SalonSheetController controller;
       SalonSheetAbout({super.key,required this.controller});

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 100.0.wp,
      height: 100.0.hp,
      padding: EdgeInsets.symmetric(horizontal: 3.0.wp),
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
           controller.isExpanded
              ? Text(
                  controller.salonDesc,
                  style: TextStyle(fontSize: 12.0.sp, color: black),
                )
              : Text(
                  controller.salonDesc,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 7,
                  style: TextStyle(fontSize: 12.0.sp, color: black),
                ),
          controller.salonDesc.length > 50
              ? InkWell(
                  onTap: controller.toggleExpanded,
                  child: Text(
                    controller.isExpanded
                        ? 'tr_show_less'.tr
                        : 'tr_show_more'.tr,
                    style: TextStyle(
                        color: lightGrey, decoration: TextDecoration.underline),
                  ),
                )
              : Container(),
          SizedBox(height: 1.0.hp),
          Container(
            height: 15.0.hp,
            margin: EdgeInsets.only(right: 8.0.sp),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                //SizedBox(width: 3.0.wp),
                Container(
                  width: 25.0.wp,
                  //color: Colors.red,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomPaint(
                              size: Size(4.0.hp * 2, 4.0 * 2),
                              painter: CirclePainter(
                                percentage: 0.8,
                                // backgroundColor: Colors.red,
                                progressColor: yellow,
                              ),
                              child: CircleAvatar(
                                radius: 4.0.hp,
                                backgroundImage: NetworkImage(
                                    "https://shayplanner.majjane.agency/assets/picture/picture23022024101126.png"),
                              ),
                            ),
                          ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ThemeText(
                              theText: "lorem ipsum",
                              thefontSize: 8.0.sp,
                              theColor: black,
                              theMaxOfLines: 1,
                              theTextAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.0.hp)
        ]),
      ),
    );
  }
}
