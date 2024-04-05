import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:shayplanner/components/home/home_screen.dart';
import 'package:shayplanner/components/take_appointement/take_appointement_controller.dart';
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
  static const routename = '/appointement-recap';
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TakeAppointmentController>(
        init: TakeAppointmentController(Get.arguments),
        builder: (controller) => Scaffold(
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 3.0.wp, vertical: 12.0.wp),
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8.5.wp),
                            topRight: Radius.circular(8.5.wp),
                          ),
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
                          child: SingleChildScrollView(
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
                                      child: ThemeButton(
                                        theHeight: 4.0.hp,
                                        theBorderRadius: 4.0.sp,
                                        theColor: crem,
                                        theVerticalPadding: 0,
                                        theHorizontalPadding: 3.0.sp,
                                        theElevation: 0,
                                        theContent: SvgPicture.asset(
                                            "assets/icons/profile/pen.svg",
                                            width: 4.0.hp,
                                            height: 4.0.hp),
                                        theAction: controller.editAppointement,
                                        theLoadingStatus: false,
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
                                      theTextDecoration:
                                          TextDecoration.underline,
                                    ),
                                  ),
                                ]),
                                SizedBox(height: 4.0.hp),
                                Row(children: [
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
                                SizedBox(height: 1.0.hp),
                                ...controller.selectedSpecialities.map(
                                  (specialite) => Row(children: [
                                    SvgPicture.asset(
                                      "assets/icons/take_appointement/bullet_list.svg",
                                      width: 3.5.sp,
                                      height: 3.0.sp,
                                      color: black,
                                    ),
                                    SizedBox(width: 6.0.sp),
                                    SizedBox(
                                      width: 80.0.wp,
                                      child: Row(children: [
                                        Expanded(
                                          flex: 10,
                                          child: ThemeText(
                                            theText: "${specialite!.name}",
                                            thefontSize: 11.0.sp,
                                            theColor: black,
                                            theMaxOfLines: 1,
                                            theFontFamily: fontBold,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: ThemeText(
                                            theText: "${specialite.price}",
                                            thefontSize: 11.0.sp,
                                            theColor: black,
                                            theMaxOfLines: 1,
                                            theFontFamily: fontBold,
                                          ),
                                        ),
                                      ]),
                                    ),
                                  ]),
                                ),
                                SizedBox(height: 1.0.hp),
                                Divider(),
                                SizedBox(height: 1.0.hp),
                                Row(children: [
                                  Expanded(
                                    child: ThemeText(
                                      theText: "tr_date_and_hour".tr,
                                      thefontSize: 13.0.sp,
                                      theColor: black,
                                      theMaxOfLines: 1,
                                      theFontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ]),
                                SizedBox(height: 1.0.hp),
                                Row(children: [
                                  SvgPicture.asset(
                                    "assets/icons/take_appointement/bullet_list.svg",
                                    width: 3.5.sp,
                                    height: 3.0.sp,
                                    color: black,
                                  ),
                                  SizedBox(width: 6.0.sp),
                                  SizedBox(
                                    width: 80.0.wp,
                                    child: Row(children: [
                                      Expanded(
                                        flex: 7,
                                        child: ThemeText(
                                          theText: DateFormat('E.d.MMM', Get.locale!.languageCode).format(controller.selectedDay),
                                          thefontSize: 11.0.sp,
                                          theColor: black,
                                          theMaxOfLines: 1,
                                          theFontFamily: fontBold,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: ThemeText(
                                          theText: controller.availability
                                              .firstWhere(
                                                  (element) =>
                                                      element['isChecked'] ==
                                                      true,
                                                  orElse: () => {
                                                        'hour': '00h:00min'
                                                      })['hour'],
                                          thefontSize: 11.0.sp,
                                          theColor: black,
                                          theMaxOfLines: 1,
                                          theFontFamily: fontBold,
                                        ),
                                      ),
                                    ]),
                                  ),
                                ]),
                                Divider(),
                                SizedBox(height: 1.0.hp),
                                ThemeText(
                                  theText: "tr_ur_infos".tr,
                                  thefontSize: 12.0.sp,
                                  theColor: black,
                                  theMaxOfLines: 1,
                                  theFontWeight: FontWeight.bold,
                                ),
                                SizedBox(height: 1.0.hp),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(children: [
                                        Expanded(
                                          flex: 2,
                                          child: ThemeText(
                                            theText:
                                                "${controller.user!.firstname ?? ""} ${controller.user!.lastname ?? ""}",
                                            thefontSize: 10.0.sp,
                                            theColor: black,
                                            theMaxOfLines: 1,
                                          ),
                                        ),
                                        SizedBox(width: 5.0.wp),
                                        Expanded(
                                          flex: 3,
                                          child: ThemeText(
                                            theText:
                                                controller.user!.email ??
                                                    "",
                                            thefontSize: 10.0.sp,
                                            theColor: black,
                                            theMaxOfLines: 1,
                                          ),
                                        ),
                                      ]),
                                      SizedBox(
                                        height: 1.0.hp,
                                      ),
                                      Row(children: [
                                        Expanded(
                                          child: ThemeText(
                                            theText:
                                                controller.user!.mobile ??
                                                    "",
                                            thefontSize: 10.0.sp,
                                            theColor: black,
                                            theMaxOfLines: 1,
                                          ),
                                        ),
                                      ]),
                                      Divider(),
                                      SizedBox(height: 3.0.hp),
                                      ThemeText(
                                        theText: "tr_msg_for_salon".tr,
                                        thefontSize: 12.0.sp,
                                        theColor: black,
                                        theMaxOfLines: 1,
                                        theFontWeight: FontWeight.bold,
                                      ),
                                      SizedBox(
                                        height: 1.0.hp,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10.0.sp),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: const Color.fromARGB(
                                                    255, 186, 186, 186),
                                                blurRadius: 4,
                                                spreadRadius: 0,
                                                offset: Offset(0, 4),
                                              )
                                            ]),
                                        child: TextField(
                                          keyboardType: TextInputType.multiline,
                                          maxLines: 2,
                                          readOnly: true,
                                          controller: controller
                                              .msgForSalonEditingController,
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: verylightGrey,
                                            hintText: "tr_write_msg".tr,
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.transparent),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      10.0.sp),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.transparent),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      10.0.sp),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1,
                                                  color: Colors.transparent),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      10.0.sp),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2.0.hp,
                                      ),
                                      Row(
                                        children: [
                                                                                  Expanded(
                                            flex: 8,
                                            child: ThemeButton(
                                                theColor: crem,
                                                //  theWidth: 65.0.wp,
                                                theHeight: 5.0.hp,
                                                theBorderRadius: 2.0.wp,
                                                theContent: ThemeText(
                                                    theText: "tr_cancel".tr,
                                                    thefontSize: 12.0.sp,
                                                    theFontWeight:
                                                        FontWeight.bold,
                                                    theColor: white),
                                                theAction:
                                                    (){
                                                      Get.offAllNamed(HomeScreen.routename);
                                                    },
                                                theLoadingStatus:false),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: SizedBox(width: 7.0.wp),
                                          ),
                                            Expanded(
                                            flex: 8,
                                            child: ThemeButton(
                                                theColor: white,
                                                theBorderColor: grey,
                                                //  theWidth: 65.0.wp,
                                                theHeight: 5.0.hp,
                                                theBorderRadius: 2.0.wp,
                                                theContent: ThemeText(
                                                    theText: "tr_confirm".tr,
                                                    thefontSize: 12.0.sp,
                                                    theFontWeight:
                                                        FontWeight.bold,
                                                    theColor: grey),
                                                theAction:
                                                    controller
                                                        .bookAppointemnt,
                                                theLoadingStatus:
                                                    controller
                                                        .isLoadingBookingAppoitement
                                                      ),
                                          ),
                                        ],
                                      ),
                                                                                SizedBox(height: 8.0.hp)

                                    ]),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              bottomNavigationBar: ThemeNavigationBottomBar(),
            ));
  }
}
