import 'package:flutter_svg/svg.dart';
import 'package:shayplanner/components/booking_history/booking_history_controller.dart';
import 'package:shayplanner/components/future_appointement/future_appointement_controller.dart';
import 'package:shayplanner/theme/theme_app_bar.dart';
import 'package:shayplanner/theme/theme_button.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/theme/theme_grad_container.dart';
import 'package:shayplanner/theme/theme_input.dart';
import 'package:shayplanner/theme/theme_navigation_bottom_bar.dart';
import 'package:shayplanner/theme/theme_text.dart';
import 'package:shayplanner/tools/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FutureAppointementScreen extends StatelessWidget {
  FutureAppointementScreen({
    Key? key,
  }) : super(key: key);
  static const routename = '/future-appointement';
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FutureAppointementController>(
      init: FutureAppointementController(),
      builder: (controller) => Scaffold(
        extendBody: true,
        backgroundColor: white,
        appBar: ThemeAppBar(),
        body: Container(
          width: Get.width,
          height: 90.0.hp,
          color: biege,
          child: Column(
            children: [
              SizedBox(height: 2.0.hp),
              Center(
                child: Container(
                  height: 6.0.hp,
                  width: 87.0.wp,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0.sp),
                    boxShadow: [themeBoxShadowInput],
                  ),
                  child: ThemeInput(
                    theHintText: "Nom du salon",
                    theLabelText: "Nom du salon",
                    theTextEditingController:
                        controller.keywordEditingController,
                    theValidation: controller.dontValidate,
                    theContentPadding: 5.0.sp,
                    theIconWidget: ThemeGradContainer(
                      theHeight: 3.0.wp,
                      theWith: 3.0.wp,
                      theMargin: 5.0.sp,
                      theColor: crem,
                      theContent: Icon(Icons.search, color: Colors.white),
                    ),
                    theFloatingLabelBehaviour: FloatingLabelBehavior.never,
                  ),
                ),
              ),
              SizedBox(height: 2.0.hp),
              Expanded(
                child: Container(
                  width: 100.0.wp,
                  padding: EdgeInsets.symmetric(
                      horizontal: 6.0.wp, vertical: 12.0.wp),
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.5.wp),
                      topRight: Radius.circular(8.5.wp),
                    ),
                  ),
                  child: controller.isLoadingFutureAppointment
                      ? Center(child: CircularProgressIndicator())
                      : SingleChildScrollView(
                          child: 
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ...controller.appointments.map((appointment) =>   Container(
                                margin: EdgeInsets.only(bottom: 1.0.hp),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          flex: 10,
                                          child: ThemeText(
                                              theText:
                                                  "Lorem ipsum dolor sit amet",
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
                                              theBorderColor: darkOrange,
                                              theColor: white,
                                              theHeight: 5.0.hp,
                                              theAction: controller.doSomething,
                                              theContent: ThemeText(
                                                theText: "tr_future".tr,
                                                thefontSize: 10.0.sp,
                                                theColor: darkOrange,
                                                theTextAlign: TextAlign.center,
                                                theFontWeight: FontWeight.bold,
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                ThemeText(
                                                  theText: appointment.specialite,
                                                  thefontSize: 11.0.sp,
                                                  theColor: lightGrey,
                                                  theFontWeight:
                                                      FontWeight.bold,
                                                ),
                                                ThemeText(
                                                  theText: appointment.price,
                                                  thefontSize: 11.0.sp,
                                                  theColor: lightGrey,
                                                  theFontWeight:
                                                      FontWeight.bold,
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
                                                theText: appointment.date,
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
                                                      text:" ${appointment.duration}",
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
                                          flex: 3,
                                          child: SizedBox(),
                                        ),
                                        // Expanded(
                                        //   flex: 1,
                                        //   child: SizedBox(),
                                        // ),
                                        // Expanded(
                                        //   flex: 2,
                                        //   child: ThemeText(
                                        //     theText: "tr_done".tr,
                                        //     thefontSize: 10.0.sp,
                                        //     theColor: Color(0xFF10D530),
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                    SizedBox(height: 1.0.hp),
                                    Divider()
                                  ],
                                ),
                              ),)
                            
                            ],
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: ThemeNavigationBottomBar(),
      ),
    );
  }
}
