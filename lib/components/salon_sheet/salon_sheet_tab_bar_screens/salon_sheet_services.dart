import 'package:flutter_svg/flutter_svg.dart';
import 'package:shayplanner/components/salon_sheet/salon_sheet_controller.dart';
import 'package:shayplanner/theme/theme_app_bar.dart';
import 'package:shayplanner/theme/theme_button.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/theme/theme_grad_container.dart';
import 'package:shayplanner/theme/theme_text.dart';
import 'package:shayplanner/tools/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SalonSheetServices extends StatelessWidget {
  const SalonSheetServices({super.key});

  @override
  Widget build(BuildContext context) {
    final SalonSheetController salonSheetController =
        Get.put(SalonSheetController());
    return Container(
      width: 100.0.wp,
      height: 100.0.hp,
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: 8.0.hp,
            width: 100.0.wp,
            padding: EdgeInsets.only(left: 3.0.wp, top: 2.0.hp),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ThemeButton(
                    theAction: salonSheetController.doSomething,
                    theContent: Container(
                      alignment: Alignment.center,
                      width: 30.0.wp,
                      height: 7.0.hp,
                      margin: EdgeInsets.only(bottom: 1.0.hp),
                      decoration: BoxDecoration(
                          color: lightOrange,
                          borderRadius: BorderRadius.circular(8.0.sp),
                          boxShadow: [themeBoxShadowInput],
                          border: Border.all(color: darkOrange)),
                      child: ThemeText(
                          theText: "Lorem ipsum",
                          thefontSize: 10.0.sp,
                          theColor: darkOrange),
                    ),
                    theLoadingStatus: salonSheetController.isLoading.value),
                SizedBox(width: 3.0.wp),
                ThemeButton(
                    theAction: salonSheetController.doSomething,
                    theContent: Container(
                      alignment: Alignment.center,
                      width: 30.0.wp,
                      height: 7.0.hp,
                      margin: EdgeInsets.only(bottom: 1.0.hp),
                      decoration: BoxDecoration(
                          color: lightOrange,
                          borderRadius: BorderRadius.circular(8.0.sp),
                          boxShadow: [themeBoxShadowInput],
                          border: Border.all(color: darkOrange)),
                      child: ThemeText(
                          theText: "Lorem ipsum",
                          thefontSize: 10.0.sp,
                          theColor: darkOrange),
                    ),
                    theLoadingStatus: salonSheetController.isLoading.value),
                SizedBox(width: 3.0.wp),
                ThemeButton(
                    theAction: salonSheetController.doSomething,
                    theContent: Container(
                      alignment: Alignment.center,
                      width: 30.0.wp,
                      height: 7.0.hp,
                      margin: EdgeInsets.only(bottom: 1.0.hp),
                      decoration: BoxDecoration(
                        color: verylightGrey,
                        borderRadius: BorderRadius.circular(8.0.sp),
                        boxShadow: [themeBoxShadowInput],
                      ),
                      child: ThemeText(
                          theText: "Lorem ipsum",
                          thefontSize: 10.0.sp,
                          theColor: lightGrey),
                    ),
                    theLoadingStatus: salonSheetController.isLoading.value),
              ],
            ),
          ),
          SizedBox(height: 1.5.hp),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 3.0.wp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ThemeText(
                    theText: "Lorem ipsum (7)",
                    thefontSize: 14.0.sp,
                    theColor: black,
                    theFontWeight: FontWeight.bold,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 1.0.hp),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ThemeText(
                                theText: "Lorem ipsum dolor",
                                thefontSize: 10.0.sp,
                                theColor: black,
                              ),
                              ThemeButton(
                                  theAction: salonSheetController.doSomething,
                                  theContent: Container(
                                    alignment: Alignment.center,
                                    width: 26.0.wp,
                                    height: 3.5.hp,
                                    margin: EdgeInsets.only(bottom: 1.0.hp),
                                    decoration: BoxDecoration(
                                        color: white,
                                        borderRadius:
                                            BorderRadius.circular(5.0.sp),
                                        boxShadow: [themeBoxShadowInput],
                                        border: Border.all(color: darkOrange)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ThemeText(
                                            theText: "Ajouter",
                                            thefontSize: 10.0.sp,
                                            theColor: darkOrange),
                                        SvgPicture.asset(
                                          "assets/icons/plus.svg",
                                          color: darkOrange,
                                          width: 14.0.sp,
                                        )
                                      ],
                                    ),
                                  ),
                                  theLoadingStatus:
                                      salonSheetController.isLoading.value),
                            ],
                          ),
                          ThemeText(
                            theText: "40 MAD",
                            thefontSize: 10.0.sp,
                            theColor: lightGrey,
                            theFontFamily: fontThin,
                          ),
                          SizedBox(height: 0.7.hp),
                          SizedBox(
                            width: 20.0.wp,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/clock.svg",
                                  color: lightGrey,
                                  width: 10.0.sp,
                                ),
                                SizedBox(width: 1.0.wp),
                                ThemeText(
                                    theText: "min",
                                    thefontSize: 10.0.sp,
                                    theColor: lightGrey),
                              ],
                            ),
                          ),
                          Divider()
                        ]),
                  ),
                    Container(
                    margin: EdgeInsets.only(bottom: 1.0.hp),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ThemeText(
                                theText: "Lorem ipsum dolor",
                                thefontSize: 10.0.sp,
                                theColor: black,
                              ),
                              ThemeButton(
                                  theAction: salonSheetController.doSomething,
                                  theContent: Container(
                                    alignment: Alignment.center,
                                    width: 26.0.wp,
                                    height: 3.5.hp,
                                    margin: EdgeInsets.only(bottom: 1.0.hp),
                                    decoration: BoxDecoration(
                                        color: white,
                                        borderRadius:
                                            BorderRadius.circular(5.0.sp),
                                        boxShadow: [themeBoxShadowInput],
                                        border: Border.all(color: darkOrange)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ThemeText(
                                            theText: "Ajouter",
                                            thefontSize: 10.0.sp,
                                            theColor: darkOrange),
                                        SvgPicture.asset(
                                          "assets/icons/plus.svg",
                                          color: darkOrange,
                                          width: 14.0.sp,
                                        )
                                      ],
                                    ),
                                  ),
                                  theLoadingStatus:
                                      salonSheetController.isLoading.value),
                            ],
                          ),
                          ThemeText(
                            theText: "40 MAD",
                            thefontSize: 10.0.sp,
                            theColor: lightGrey,
                            theFontFamily: fontThin,
                          ),
                          SizedBox(height: 0.7.hp),
                          SizedBox(
                            width: 20.0.wp,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/clock.svg",
                                  color: lightGrey,
                                  width: 10.0.sp,
                                ),
                                SizedBox(width: 1.0.wp),
                                ThemeText(
                                    theText: "min",
                                    thefontSize: 10.0.sp,
                                    theColor: lightGrey),
                              ],
                            ),
                          ),
                          Divider()
                        ]),
                  ),
                  // SizedBox(
                  //   height: 40.0.hp,
                  //   child: ListView.builder(
                  //     itemCount: 6,
                  //     itemBuilder: (context, index) {
                  //       return Container(
                  //         child: Column(children: [
                  //           Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //             children: [
                  //               ThemeText(
                  //                 theText: "Lorem ipsum (7)",
                  //                 thefontSize: 14.0.sp,
                  //                 theColor: black,
                  //                 theFontWeight: FontWeight.bold,
                  //               ),
                  //               ThemeButton(
                  //                   theAction: salonSheetController.doSomething,
                  //                   theContent: Container(
                  //                     alignment: Alignment.center,
                  //                     width: 30.0.wp,
                  //                     height: 7.0.hp,
                  //                     margin: EdgeInsets.only(bottom: 1.0.hp),
                  //                     decoration: BoxDecoration(
                  //                       color: verylightGrey,
                  //                       borderRadius:
                  //                           BorderRadius.circular(8.0.sp),
                  //                       boxShadow: [themeBoxShadowInput],
                  //                     ),
                  //                     child: ThemeText(
                  //                         theText: "Lorem ipsum",
                  //                         thefontSize: 10.0.sp,
                  //                         theColor: lightGrey),
                  //                   ),
                  //                   theLoadingStatus:
                  //                       salonSheetController.isLoading.value),
                  //             ],
                  //           )
                  //         ]),
                  //       );
                  //     },
                  //   ),
                  // ),
                ],
              )),
        ]),
      ),
    );
  }
}

//https://stackoverflow.com/questions/63407435/flutter-subitems-in-menu-slider
//https://pub.dev/packages/flutter_slidable