import 'package:flutter_svg/svg.dart';
import 'package:shayplanner/components/booking_history/booking_history_controller.dart';
import 'package:shayplanner/theme/theme_app_bar.dart';
import 'package:shayplanner/theme/theme_button.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/theme/theme_navigation_bottom_bar.dart';
import 'package:shayplanner/theme/theme_text.dart';
import 'package:shayplanner/tools/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingHistoryScreen extends StatelessWidget {
  BookingHistoryScreen({
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
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 1.0.hp),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: ThemeText(
                                      theText: "Lorem ipsum dolor sit amet",
                                      thefontSize: 11.0.sp,
                                      theColor: black,
                                      theFontFamily: fontBold),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: ThemeButton(
                                    theHeight: 4.0.hp,
                                    theHorizontalPadding: 1.0.wp,
                                      theColor: white,
                                      theAction:
                                          bookingHistoryController.doSomething,
                                      theContent: ThemeText(
                                          theText: "tr_book_again".tr,
                                          thefontSize: 10.0.sp,
                                          theColor: darkOrange,
                                          theTextAlign: TextAlign.center,
                                        ),
                                      theLoadingStatus: false),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ThemeText(
                                          theText: "Body message",
                                          thefontSize: 11.0.sp,
                                          theColor: lightGrey,
                                          theFontWeight: FontWeight.bold,
                                        ),
                                        ThemeText(
                                          theText: "40 MAD",
                                          thefontSize: 11.0.sp,
                                          theColor: lightGrey,
                                          theFontWeight: FontWeight.bold,
                                        ),
                                      ]),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: SizedBox(),
                                ),
                              ],
                            ),
                            SizedBox(height: 1.0.hp),
                            Row(
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ThemeText(
                                        theText: "02/02/2024",
                                        thefontSize: 10.0.sp,
                                        theColor: lightGrey,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            WidgetSpan(
                                              child: SvgPicture.asset(
                                                "assets/icons/booking_history/clock.svg",
                                                width: 10.0.sp,
                                                height: 10.0.sp,
                                              ),
                                            ),
                                            TextSpan(
                                              text: " 40 Min",
                                              style: TextStyle(
                                                  fontFamily: fontThin,
                                                  fontSize: 10.0.sp,
                                                  color: black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: ThemeText(
                                    theText: "Complétée",
                                    thefontSize: 10.0.sp,
                                    theColor: Color(0xFF10D530),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 1.0.hp),
                            Divider()
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 1.0.hp),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: ThemeText(
                                      theText: "Lorem ipsum dolor sit amet",
                                      thefontSize: 11.0.sp,
                                      theColor: black,
                                      theFontFamily: fontBold),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: ThemeButton(
                                      theColor: white,
                                      theAction:
                                          bookingHistoryController.doSomething,
                                      theContent: Container(
                                        margin: EdgeInsets.only(bottom: 1.0.hp),
                                        decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(5.0.sp),
                                            boxShadow: [themeBoxShadowInput],
                                            border:
                                                Border.all(color: darkOrange)),
                                        child: ThemeText(
                                          theText: "tr_book_again".tr,
                                          thefontSize: 10.0.sp,
                                          theColor: darkOrange,
                                          theTextAlign: TextAlign.center,
                                        ),
                                      ),
                                      theLoadingStatus: false),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ThemeText(
                                          theText: "Body message",
                                          thefontSize: 11.0.sp,
                                          theColor: lightGrey,
                                          theFontWeight: FontWeight.bold,
                                        ),
                                        ThemeText(
                                          theText: "40 MAD",
                                          thefontSize: 11.0.sp,
                                          theColor: lightGrey,
                                          theFontWeight: FontWeight.bold,
                                        ),
                                      ]),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: SizedBox(),
                                ),
                              ],
                            ),
                            SizedBox(height: 1.0.hp),
                            Row(
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ThemeText(
                                        theText: "02/02/2024",
                                        thefontSize: 10.0.sp,
                                        theColor: lightGrey,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            WidgetSpan(
                                              child: SvgPicture.asset(
                                                "assets/icons/booking_history/clock.svg",
                                                width: 10.0.sp,
                                                height: 10.0.sp,
                                              ),
                                            ),
                                            TextSpan(
                                              text: " 40 Min",
                                              style: TextStyle(
                                                  fontFamily: fontThin,
                                                  fontSize: 10.0.sp,
                                                  color: black),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: SizedBox(),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: ThemeText(
                                    theText: "Complétée",
                                    thefontSize: 10.0.sp,
                                    theColor: Color(0xFF10D530),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 1.0.hp),
                            Divider()
                          ],
                        ),
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
