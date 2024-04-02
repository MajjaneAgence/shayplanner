import 'package:flutter_svg/svg.dart';
import 'package:shayplanner/components/booking_history/booking_history_controller.dart';
import 'package:shayplanner/components/favoris/favoris_controller.dart';
import 'package:shayplanner/components/take_appointement/take_appointement_controller.dart';
import 'package:shayplanner/theme/theme_app_bar.dart';
import 'package:shayplanner/theme/theme_button.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/theme/theme_navigation_bottom_bar.dart';
import 'package:shayplanner/theme/theme_text.dart';
import 'package:shayplanner/tools/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentRecapScreen extends StatelessWidget {
  AppointmentRecapScreen({
    Key? key,
  }) : super(key: key);
  final TakeAppointmentController takeAppointmentController =
      Get.find<TakeAppointmentController>();
  static const routename = '/appointement-recap';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: white,
      body: Container(
        width: Get.width,
        height: 100.0.hp,
        color: biege,
        child: Column(
          children: [
            SizedBox(height: 5.0.hp),
            Container(
              alignment: Get.locale!.languageCode != "ar"
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              color: biege,
              height: 8.0.hp,
              width: 100.0.wp,
              padding: EdgeInsets.symmetric(horizontal: 10.0.wp),
              child: ThemeText(
                theText: "tr_take_beauty_appointment".tr,
                thefontSize: 18.0.sp,
                theColor: grey,
                theFontFamily: fontBold,
              ),
            ),
            SizedBox(height: 2.0.hp),
            Expanded(
              child: Container(
                width: 100.0.wp,
                padding:
                    EdgeInsets.symmetric(horizontal: 3.0.wp, vertical: 12.0.wp),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.5.wp),
                    topRight: Radius.circular(8.5.wp),
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 9,
                            child: ThemeText(
                              theText: "tr_reservation".tr,
                              thefontSize: 14.0.sp,
                              theColor: black,
                              theMaxOfLines: 1,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.all(1.0.wp),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0.sp),
                                  color: crem),
                              child: SvgPicture.asset(
                                  "assets/icons/profile/pen.svg"),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2.0.hp),
                      Row(children: [
                        Expanded(
                          child: ThemeText(
                            theText: "Lorem ipsum",
                            thefontSize: 22.0.sp,
                            theColor: black,
                            theMaxOfLines: 1,
                            theFontWeight: FontWeight.bold,
                          ),
                        ),
                      ]),
                      Row(children: [
                        Expanded(
                          child: ThemeText(
                            theText: "Lorem ipsum dolor sit amet,",
                            thefontSize: 11.0.sp,
                            theColor: black,
                            theMaxOfLines: 1,
                            theTextDecoration: TextDecoration.underline,
                          ),
                        ),
                      ]),
                      SizedBox(height: 4.0.hp),
                      Row(
                        children: [
                        Expanded(
                          child: ThemeText(
                            theText: "tr_service_choice".tr,
                            thefontSize: 13.0.sp,
                            theColor: black,
                            theMaxOfLines: 1,
                            theFontWeight: FontWeight.bold,
                          ),
                        ),
                      ]),
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
