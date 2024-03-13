import 'package:flutter_svg/svg.dart';
import 'package:shayplanner/components/notifications/notifications_controller.dart';
import 'package:shayplanner/components/profile/profile_controller.dart';
import 'package:shayplanner/components/profile/profile_loading/user_info_loading.dart';
import 'package:shayplanner/theme/theme_app_bar.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/theme/theme_input.dart';
import 'package:shayplanner/theme/theme_navigation_bottom_bar.dart';
import 'package:shayplanner/theme/theme_text.dart';
import 'package:shayplanner/tools/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/theme_circle_painter.dart';

class NotificationsScreen extends StatelessWidget {
  NotificationsScreen({
    Key? key,
  }) : super(key: key);
  final NotificationsController notificationsController =
      Get.put(NotificationsController());
  static const routename = '/notifications';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: white,
      appBar: ThemeAppBar(),
      body: Container(
        width: Get.width,
        height: 90.0.hp,
        color: biege,
        child: Column(
          children: [
            SizedBox(height: 4.0.hp),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 12.0.wp),
                SvgPicture.asset("assets/icons/profile/bell.svg",
                    width: 8.0.wp, height: 8.0.wp),
                SizedBox(width: 4.0.wp),
                ThemeText(
                  theText: "tr_notification".tr,
                  thefontSize: 17.0.sp,
                  theColor: black,
                  theFontFamily: fontBold,
                )
              ],
            ),
            SizedBox(height: 4.0.hp),
            Expanded(
              child: Container(
                width: 100.0.wp,
                padding: EdgeInsets.only(top: 6.0.hp, left: 12.0.wp),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.5.wp),
                    topRight: Radius.circular(8.5.wp),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        //color: Colors.red,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ThemeText(
                                  theText: "Lorem ipsum dolor sit amet",
                                  thefontSize: 12.0.sp,
                                  theColor: black),
                              ThemeText(
                                  theText: "Body message",
                                  thefontSize: 12.0.sp,
                                  theColor: grey)
                            ]),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ThemeNavigationBottomBar(),
    );
  }
}
