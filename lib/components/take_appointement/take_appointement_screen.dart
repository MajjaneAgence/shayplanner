import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:shayplanner/components/take_appointement/take_appointement_controller.dart';
import 'package:shayplanner/theme/theme_app_bar.dart';
import 'package:shayplanner/theme/theme_button.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/theme/theme_navigation_bottom_bar.dart';
import 'package:shayplanner/theme/theme_text.dart';
import 'package:shayplanner/tools/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TakeAppointementScreen extends StatelessWidget {
     TakeAppointmentController takeAppointmentController =
        Get.put(TakeAppointmentController(Get.arguments));
  static const routename = '/take-appointment';
  @override
  Widget build(BuildContext context) {
    //return Scaffold(body: SizedBox(),);
    return Scaffold(
      appBar: ThemeAppBar(),
      extendBody: true,
      body: Container(
        width: 100.0.wp,
        height: 90.0.hp,
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Stack(children: [
              Column(children: [
                CarouselSlider(
                  carouselController:
                      takeAppointmentController.carouselController,
                  options: CarouselOptions(
                      height: 30.0.hp,
                      viewportFraction: 1.5,
                      initialPage: 0,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index, reason) {
                        takeAppointmentController.currentIndex.value = index;
                        takeAppointmentController.currentIndex.refresh();
                      }),
                  items: takeAppointmentController.salonImages
                      .map(
                        (item) => takeAppointmentController.salonImages.isEmpty
                            ? Image.asset(
                                width: MediaQuery.of(context).size.width,
                                'assets/images/no_image_available.png')
                            : Image.asset(
                                width: MediaQuery.of(context).size.width,
                                item,
                                fit: BoxFit.fill,
                              ),
                      )
                      .toList(),
                ),
                Container(
                  height: 48.0.hp,
                  // color: Colors.red
                )
              ]),
              Obx(
                () => Positioned(
                  top: 22.0.hp,
                  left: 40.0.wp,
                  child: DotsIndicator(
                    onTap: (position) {
                      takeAppointmentController.currentIndex.value = position;
                      takeAppointmentController.currentIndex.refresh();
                      takeAppointmentController.carouselController
                          .animateToPage(position);
                    },
                    dotsCount: takeAppointmentController.salonImages.length,
                    position: takeAppointmentController.currentIndex.value,
                    decorator: DotsDecorator(
                        color: transparent,
                        activeColor: white,
                        activeSize: Size.square(10),
                        shape: CircleBorder(
                          side: BorderSide(color: white, width: 1.0),
                        ),
                        spacing: EdgeInsets.all(2.0.sp)),
                  ),
                ),
              ),
              Positioned(
                top: 25.0.hp,
                child: Container(
                  width: 100.0.wp,
                  height: 52.0.hp,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.5.wp),
                      topRight: Radius.circular(8.5.wp),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            top: 1.0.hp,
                            bottom: 0.3.hp,
                            left: 7.0.wp,
                            right: 7.0.wp),
                        child: ThemeText(
                          theText: "Lorem ipsum ",
                          thefontSize: 20.0.sp,
                          theColor: black,
                          theFontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        // color: Colors.red,
                        width: 87.0.wp,
                        padding: EdgeInsets.symmetric(
                            vertical: 0.2.hp, horizontal: 7.0.wp),
                        child: ThemeText(
                          theText: "Lorem ipsum dolor sit amet,",
                          thefontSize: 10.0.sp,
                          theColor: black,
                          theTextDecoration: TextDecoration.underline,
                        ),
                      ),
                      Container(
                        //color: Colors.yellow,
                        width: 87.0.wp,
                        padding: EdgeInsets.symmetric(
                            vertical: 0.2.hp, horizontal: 7.0.wp),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 5.0.wp,
                              height: 5.0.wp,
                              margin: EdgeInsets.only(right: 2.0.sp),
                              child: SvgPicture.asset('assets/icons/star.svg',
                                  color: grey),
                            ),
                            Container(
                              width: 50.0.wp,
                              margin: EdgeInsets.only(right: 6.0.sp),
                              child: ThemeText(
                                theText: "4,9 (317 avis)  MAD",
                                thefontSize: 10.0.sp,
                                theColor: grey,
                                theMaxOfLines: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 1.0.hp),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 2.0.wp, horizontal: 5.0.wp),
                          width: 100.0.wp,
                          child: Container(
                            width: 100.0.wp,
                            height: 100.0.hp,
                            padding: EdgeInsets.symmetric(horizontal: 3.0.wp),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 1.0.hp),
                                  ThemeText(
                                    theText: "tr_service_choice".tr,
                                    thefontSize: 12.0.sp,
                                    theColor: black,
                                    theMaxOfLines: 1,
                                    theFontWeight: FontWeight.bold,
                                  ),
                                  SizedBox(height: 1.0.hp),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: white,
                                      border: Border.all(
                                        color: white,
                                        //width: 2,
                                      ),
                                    ),
                                    child:
                                        GetBuilder<TakeAppointmentController>(
                                      init: TakeAppointmentController(Get.arguments),
                                      builder: (controller) => controller
                                                  .isLoadingSpecialites ==
                                              true
                                          ? CircularProgressIndicator() :
                                          MultiSelectBottomSheetField(
                                              isDismissible: false,
                                              listType:
                                                  MultiSelectListType.CHIP,
                                              searchable: true,
                                              buttonIcon: Icon(
                                                  Icons.keyboard_arrow_down),
                                              buttonText:
                                                  Text("tr_choose_specialite".tr),
                                              title: Text("tr_spectialite".tr),
                                              items: controller.items,
                                              onConfirm: (values) {
                                                takeAppointmentController
                                                    .selectedAnimals2 = values;
                                                Scrollable.ensureVisible(
                                                    takeAppointmentController
                                                        .keySelectDateHour
                                                        .currentContext!,
                                                    duration:
                                                        Duration(seconds: 3));
                                              },
                                              chipDisplay:
                                                  MultiSelectChipDisplay(
                                                scroll: true,
                                                onTap: (value) {
                                                  controller.selectedAnimals2
                                                      .remove(value);
                                                  controller.update();
                                                },
                                              ),
                                              confirmText: Text("tr_ok".tr),
                                              cancelText: Text("tr_cancel".tr),
                                              searchHint: "tr_search".tr,
                                              selectedColor: crem,
                                              checkColor: lightGrey,
                                              selectedItemsTextStyle: TextStyle(
                                                  color: Colors.white),
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    themeBoxShadowInput
                                                  ],
                                                  color: verylightGrey,
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(8.0.sp)),
                                                  border: Border.all(
                                                      color: white, width: 0)),
                                              validator: (value) =>
                                                  takeAppointmentController
                                                      .validateServices(value))
                                          ,
                                    ),
                                  ),
                                  SizedBox(height: 3.0.hp),
                                  ThemeText(
                                    key: takeAppointmentController
                                        .keySelectDateHour,
                                    theText: "tr_choose_date_and_hour".tr,
                                    thefontSize: 12.0.sp,
                                    theColor: black,
                                    theMaxOfLines: 1,
                                    theFontWeight: FontWeight.bold,
                                  ),
                                  SizedBox(height: 1.0.hp),
                                  ThemeButton(
                                    theWidth: 100.0.wp,
                                    theHeight: 5.5.hp,
                                    theBorderRadius: 8.0.sp,
                                    theHorizontalPadding: 0,
                                    theElevation: 4,
                                    theContent: Row(children: [
                                      SizedBox(width: 4.0.wp),
                                      GetBuilder<TakeAppointmentController>(
                                        init: TakeAppointmentController(Get.arguments),
                                        builder: (controller) => Expanded(
                                          child: ThemeText(
                                            theText: DateFormat('dd/MM/yyyy')
                                                .format(controller.selectedDay)
                                                .toString(),
                                            thefontSize: 10.0.sp,
                                            theColor: black,
                                            theMaxOfLines: 1,
                                            theFontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 3.0.sp),
                                          child: VerticalDivider()),
                                      Expanded(
                                        child: ThemeText(
                                          theText: "00h:00min".tr,
                                          thefontSize: 10.0.sp,
                                          theColor: black,
                                          theMaxOfLines: 1,
                                          theFontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 5.5.hp,
                                          decoration: BoxDecoration(
                                              color: crem,
                                              borderRadius: Get.locale!.languageCode=="ar" ? BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(8.0.sp),
                                                  bottomLeft:
                                                      Radius.circular(8.0.sp)): BorderRadius.only(
                                                  topRight:
                                                      Radius.circular(8.0.sp),
                                                  bottomRight:
                                                      Radius.circular(8.0.sp))),
                                          child: SvgPicture.asset(
                                              "assets/icons/take_appointement/calendar.svg",
                                              width: 18.0.sp,
                                              height: 18.0.sp),
                                        ),
                                      ),
                                    ]),
                                    theColor: verylightGrey,
                                    theLoadingStatus: false,
                                    theAction: takeAppointmentController
                                        .selectDateAndHour,
                                  ),
                                  SizedBox(height: 3.0.hp),
                                  ThemeText(
                                    theText: "tr_ur_infos".tr,
                                    thefontSize: 12.0.sp,
                                    theColor: black,
                                    theMaxOfLines: 1,
                                    theFontWeight: FontWeight.bold,
                                  ),
                                  SizedBox(height: 1.0.hp),
                                  Obx(
                                    () => (takeAppointmentController
                                                    .user.value!.email ==
                                                null &&
                                            takeAppointmentController
                                                    .user.value!.firstname ==
                                                null &&
                                            takeAppointmentController
                                                    .user.value!.lastname ==
                                                null &&
                                            takeAppointmentController
                                                    .user.value!.mobile ==
                                                null)
                                        ? Center(
                                            child: ThemeButton(
                                              theWidth: 60.0.wp,
                                              theHeight: 5.0.hp,
                                              theElevation: 5,
                                              theContent: ThemeText(
                                                theText: "tr_connect_me".tr,
                                                thefontSize: 12.0.sp,
                                                theColor: black,
                                                theFontWeight: FontWeight.bold,
                                                theTextDecoration:
                                                    TextDecoration.underline,
                                              ),
                                              theColor: biege,
                                              theLoadingStatus: false,
                                              theAction:
                                                  takeAppointmentController
                                                      .goToLogin,
                                            ),
                                          )
                                        : Column(children: [
                                            Row(children: [
                                              Expanded(
                                                flex: 2,
                                                child: ThemeText(
                                                  theText:
                                                      "${takeAppointmentController.user.value!.firstname ?? ""} ${takeAppointmentController.user.value!.lastname ?? ""}",
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
                                                      takeAppointmentController
                                                              .user
                                                              .value!
                                                              .email ??
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
                                                      takeAppointmentController
                                                              .user
                                                              .value!
                                                              .mobile ??
                                                          "",
                                                  thefontSize: 10.0.sp,
                                                  theColor: black,
                                                  theMaxOfLines: 1,
                                                ),
                                              ),
                                            ]),
                                          ]),
                                  ),
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
                                      decoration: InputDecoration(
                                          filled: true,
                                          fillColor: verylightGrey,
                                          hintText: "tr_write_msg".tr,
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 1,
                                                color: Colors.transparent),
                                            borderRadius:
                                                BorderRadius.circular(10.0.sp),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 1,
                                                color: Colors.transparent),
                                            borderRadius:
                                                BorderRadius.circular(10.0.sp),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 1,
                                                color: Colors.transparent),
                                            borderRadius:
                                                BorderRadius.circular(10.0.sp),
                                          )),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3.0.hp,
                                  ),
                                  Center(
                                    child: ThemeButton(
                                        theColor: grey,
                                        theWidth: 65.0.wp,
                                        theHeight: 6.5.hp,
                                        theBorderRadius: 2.0.wp,
                                        theContent: ThemeText(
                                            theText: "tr_book".tr,
                                            thefontSize: 12.0.sp,
                                            theFontWeight: FontWeight.bold,
                                            theColor: white),
                                        theAction: takeAppointmentController
                                            .bookAppointement,
                                        theLoadingStatus:
                                            takeAppointmentController
                                                .isLoadingBookingAppoitement
                                                .value),
                                  ),
                                  SizedBox(height: 20.0.hp),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ])
          ]),
        ),
      ),
      bottomNavigationBar: ThemeNavigationBottomBar(),
    );
  }
}

//https://stackoverflow.com/questions/63407435/flutter-subitems-in-menu-slider
//https://pub.dev/packages/flutter_slidable