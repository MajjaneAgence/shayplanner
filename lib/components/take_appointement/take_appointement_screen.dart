import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:shayplanner/components/salons/salons_controller.dart';
import 'package:shayplanner/components/take_appointement/take_appointement_controller.dart';
import 'package:shayplanner/components/take_appointement/take_appointment_loading/gallery_loading.dart';
import 'package:shayplanner/components/take_appointement/take_appointment_loading/specialite_loading.dart';
import 'package:shayplanner/models/specialite_model.dart';
import 'package:shayplanner/theme/theme_app_bar.dart';
import 'package:shayplanner/theme/theme_button.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/theme/theme_navigation_bottom_bar.dart';
import 'package:shayplanner/theme/theme_text.dart';
import 'package:shayplanner/tools/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

class TakeAppointementScreen extends StatelessWidget {
  static const routename = '/take-appointment';
  @override
  Widget build(BuildContext context) {
    //return Scaffold(body: SizedBox(),);
    return GetBuilder<TakeAppointmentController>(
      init: TakeAppointmentController(Get.arguments),
      builder: (controller) => Scaffold(
        appBar: ThemeAppBar(),
        extendBody: true,
        body: Container(
          width: 100.0.wp,
          height: 90.0.hp,
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Stack(children: [
                Stack(
                  children: [
                  controller.isLoadingSalonGallery
                      ? Column(children: [
                          GalleryLoading(),
                          Container(
                            height: 48.0.hp,
                            // color: Colors.red
                          ),
                        ])
                      : Column(children: [
                          CarouselSlider(
                            carouselController: controller.carouselController,
                            options: CarouselOptions(
                                height: 30.0.hp,
                                viewportFraction: 1.5,
                                initialPage: 0,
                                scrollDirection: Axis.horizontal,
                                onPageChanged: (index, reason) {
                                  controller.currentIndex = index;
                                  controller.update();
                                }),
                            items:controller.salonImages.isNotEmpty ? controller.salonImages 
                                .map(
                                  (item) => Image.network(
                                          width: 100.0.wp,
                                          item,
                                          fit: BoxFit.fill,
                                        ),
                                )
                                .toList():
                                controller.secourImages 
                                .map(
                                  (item) => 
                                    Image.asset(
                                          width: 100.0.wp,
                                          item,
                                          fit: BoxFit.fill,
                                        ),
                                )
                                .toList()
                                ,
                          ),
                          Container(
                            height: 48.0.hp,
                            // color: Colors.red
                          ),
                        ]),
                  controller.salonImages.isNotEmpty
                      ? Container(
                          padding: EdgeInsets.symmetric(vertical: 8.0.hp),
                          alignment: Alignment.bottomCenter,
                          width: 100.0.wp,
                          height: 30.0.hp,
                          child: DotsIndicator(
                            onTap: (position) {
                              controller.currentIndex = position;
                              controller.carouselController
                                  .animateToPage(position);
                            },
                            dotsCount: controller.salonImages.length,
                            position: controller.currentIndex,
                            decorator: DotsDecorator(
                                color: transparent,
                                activeColor: white,
                                activeSize: Size.square(10),
                                shape: CircleBorder(
                                  side: BorderSide(color: white, width: 1.0),
                                ),
                                spacing: EdgeInsets.all(2.0.sp)),
                          ),
                        )
                      : SizedBox()
                ],
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
                            theText: controller.salon.name ?? "",
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
                            theText: controller.salon.address ?? "",
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
                                  theText:
                                      "${controller.salon.countAverage} (${controller.salon.countRating} avis) ",
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
                                    controller.isLoadingSpecialites == true
                                        ? const SpecialiteLoading()
                                        : (controller.items.isEmpty &&
                                                !controller
                                                    .isLoadingSpecialites)
                                            ? ThemeText(
                                                theText:
                                                    "tr_salon_with_no_specialities"
                                                        .tr,
                                                thefontSize: 12.0.sp,
                                                theColor: darkOrange,
                                                theTextAlign: TextAlign.center,
                                                theFontWeight: FontWeight.bold,
                                              )
                                            : Container(
                                                decoration: BoxDecoration(
                                                  color: white,
                                                  border: Border.all(
                                                    color: white,
                                                    //width: 2,
                                                  ),
                                                ),
                                                child: MultiSelectBottomSheetField<
                                                        SpecialiteModel?>(
                                                    isDismissible: false,
                                                    listType: MultiSelectListType
                                                        .CHIP,
                                                    searchable: true,
                                                    buttonIcon: Icon(Icons
                                                        .keyboard_arrow_down),
                                                    buttonText: Text(
                                                        "tr_choose_specialite"
                                                            .tr),
                                                    title: Text(
                                                        "tr_spectialite".tr),
                                                    items: controller.items,
                                                    onConfirm:
                                                        (List<SpecialiteModel?>
                                                            values) {
                                                      controller
                                                              .selectedSpecialities =
                                                          values;
                                                      Scrollable.ensureVisible(
                                                          controller
                                                              .keySelectDateHour
                                                              .currentContext!,
                                                          duration: Duration(
                                                              seconds: 3));
                                                    },
                                                    chipDisplay:
                                                        MultiSelectChipDisplay(
                                                      scroll: true,
                                                      onTap: (value) {
                                                        controller
                                                            .selectedSpecialities
                                                            .remove(value);
                                                        controller.update();
                                                      },
                                                    ),
                                                    confirmText:
                                                        Text("tr_ok".tr),
                                                    cancelText:
                                                        Text("tr_cancel".tr),
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
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(8.0.sp)),
                                                        border: Border.all(color: white, width: 0)),
                                                    validator: (value) => controller.validateServices(value),
                                                    autovalidateMode: AutovalidateMode.onUserInteraction),
                                              ),
                                    SizedBox(height: 3.0.hp),
                                    ThemeText(
                                      key: controller.keySelectDateHour,
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
                                        Expanded(
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
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 3.0.sp),
                                            child: VerticalDivider()),
                                        Expanded(
                                          child: ThemeText(
                                            theText: controller.availability
                                                .firstWhere(
                                                    (element) =>
                                                        element['isChecked'] ==
                                                        true,
                                                    orElse: () => {
                                                          'hour': '00h:00min'
                                                        })['hour'],
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
                                                borderRadius: Get.locale!
                                                            .languageCode ==
                                                        "ar"
                                                    ? BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                                8.0.sp),
                                                        bottomLeft:
                                                            Radius.circular(
                                                                8.0.sp))
                                                    : BorderRadius.only(
                                                        topRight:
                                                            Radius.circular(
                                                                8.0.sp),
                                                        bottomRight:
                                                            Radius.circular(
                                                                8.0.sp))),
                                            child: SvgPicture.asset(
                                                "assets/icons/take_appointement/calendar.svg",
                                                width: 18.0.sp,
                                                height: 18.0.sp),
                                          ),
                                        ),
                                      ]),
                                      theColor: verylightGrey,
                                      theLoadingStatus: false,
                                      theAction: controller.selectDateAndHour,
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
                                    (controller.user!.email == null &&
                                            controller.user!.firstname ==
                                                null &&
                                            controller.user!.lastname == null &&
                                            controller.user!.mobile == null)
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
                                              theAction: controller.goToLogin,
                                            ),
                                          )
                                        : Column(children: [
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
                                          ]),
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
                                          theAction: controller.goToRecap,
                                          theLoadingStatus: false),
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
      ),
    );
  }
}

//https://stackoverflow.com/questions/63407435/flutter-subitems-in-menu-slider
//https://pub.dev/packages/flutter_slidable