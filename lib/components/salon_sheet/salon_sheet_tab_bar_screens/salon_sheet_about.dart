import 'package:shayplanner/components/salon_sheet/salon_sheet_controller.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/theme/theme_text.dart';
import 'package:shayplanner/tools/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/theme_circle_painter.dart';

class SalonSheetAbout extends StatelessWidget {
  const SalonSheetAbout({super.key});

  @override
  Widget build(BuildContext context) {
    final SalonSheetController salonSheetController =
        Get.put(SalonSheetController());
    return Container(
      width: 100.0.wp,
      height: 100.0.hp,
      padding: EdgeInsets.symmetric(horizontal: 3.0.wp),
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Obx(() => salonSheetController.isExpanded.value
              ? Text(
                  salonSheetController.salonDesc,
                  style: TextStyle(fontSize: 12.0.sp, color: black),
                )
              : Text(
                  salonSheetController.salonDesc,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 7,
                  style: TextStyle(fontSize: 12.0.sp, color: black),
                )),
          Obx(() => salonSheetController.salonDesc.length > 50
              ? InkWell(
                  onTap: salonSheetController.toggleExpanded,
                  child: Text(
                    salonSheetController.isExpanded.value
                        ? 'tr_show_less'.tr
                        : 'tr_show_more'.tr,
                    style: TextStyle(
                        color: lightGrey, decoration: TextDecoration.underline),
                  ),
                )
              : Container()),
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
                          SizedBox(
                            width: 25.0.wp,
                            child: ThemeText(
                              theText: "category.name",
                              thefontSize: 8.0.sp,
                              theColor: black,
                              theMaxOfLines: 1,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
