import 'package:carousel_slider/carousel_slider.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:multi_select_flutter/bottom_sheet/multi_select_bottom_sheet_field.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:shayplanner/components/salon_sheet/salon_sheet_tab_bar_screens/salon_sheet_about.dart';
import 'package:shayplanner/components/salon_sheet/salon_sheet_tab_bar_screens/salon_sheet_rating.dart';
import 'package:shayplanner/components/salon_sheet/salon_sheet_tab_bar_screens/salon_sheet_services.dart';
import 'package:shayplanner/components/take_appointement.dart/take_appointement_controller.dart';
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
  const TakeAppointementScreen({super.key});

  static const routename = '/take-appointment';

  @override
  Widget build(BuildContext context) {
    final TakeAppointmentController takeAppointmentController =
        Get.put(TakeAppointmentController("hello"));

    return Scaffold(
      appBar: ThemeAppBar(),
      extendBody: true,
      body: Container(
        width: 100.0.wp,
        height: 90.0.hp,
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 2.0.wp, horizontal: 7.0.wp),
                          width: 100.0.wp,
                          child: Container(
                            width: 100.0.wp,
                            height: 100.0.hp,
                            padding: EdgeInsets.symmetric(horizontal: 3.0.wp),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 2.0.hp),
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
                                    child: MultiSelectBottomSheetField(
                                      isDismissible: false,
                                      listType: MultiSelectListType.CHIP,
                                      searchable: true,
                                      buttonIcon:
                                          Icon(Icons.keyboard_arrow_down),
                                      buttonText: Text("Favorite Animals"),
                                      title: Text("Animals"),
                                      items: takeAppointmentController.items,
                                      onConfirm: (values) {
                                        takeAppointmentController
                                            .selectedAnimals2.value = values;
                                      },
                                      chipDisplay:
                                          MultiSelectChipDisplay.none(),
                                      // chipDisplay:
                                      //  MultiSelectChipDisplay(
                                      //   scroll: true,
                                      //   onTap: (value) {
                                      //     //setState(() {
                                      //     takeAppointmentController
                                      //         .selectedAnimals2.value=[];
                                      //         takeAppointmentController
                                      //         .selectedAnimals2.
                                      //         refresh();
                                      //     // });
                                      //   },
                                      // ),
                                      confirmText: Text("tr_ok".tr),
                                      cancelText: Text("tr_cancel".tr),
                                      searchHint: "tr_search".tr,
                                      selectedColor: crem,
                                      checkColor: lightGrey,
                                      selectedItemsTextStyle:
                                          TextStyle(color: Colors.white),
                                      decoration: BoxDecoration(
                                          boxShadow: [themeBoxShadowInput],
                                          color: verylightGrey,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8.0.sp)),
                                          border: Border.all(
                                              color: white, width: 0)),
                                    ),
                                  ),
                                  SizedBox(height: 3.0.hp),
                                  ThemeText(
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
                                          theText: "JJ/MM/AAAA".tr,
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
                                              borderRadius: BorderRadius.only(
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
                                        .bookAppointement,
                                  )
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