import 'package:flutter_svg/svg.dart';
import 'package:shayplanner/components/booking_history/booking_history_controller.dart';
import 'package:shayplanner/theme/theme_app_bar.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/theme/theme_navigation_bottom_bar.dart';
import 'package:shayplanner/theme/theme_text.dart';
import 'package:shayplanner/tools/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutScreen extends StatelessWidget {
  AboutScreen({
    Key? key,
  }) : super(key: key);
  final BookingHistoryController bookingHistoryController =
      Get.put(BookingHistoryController());
  static const routename = '/boking-history';
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
                SvgPicture.asset("assets/icons/booking_history/card.svg",
                    width: 8.0.wp, height: 8.0.wp),
                SizedBox(width: 4.0.wp),
                Expanded(
                    child: ThemeText(
                  theText: "tr_booking_history".tr,
                  thefontSize: 17.0.sp,
                  theColor: black,
                  theFontFamily: fontBold,
                  theMaxOfLines: 2,
                )),
              ],
            ),
            SizedBox(height: 4.0.hp),
            Expanded(
              child: Container(
                width: 100.0.wp,
                padding:
                    EdgeInsets.symmetric(horizontal: 6.0.wp, vertical: 12.0.wp),
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
                    children: [],
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
