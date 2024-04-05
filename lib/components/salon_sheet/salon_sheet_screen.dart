import 'package:carousel_slider/carousel_slider.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:shayplanner/components/salon_sheet/salon_sheet_controller.dart';
import 'package:shayplanner/components/salon_sheet/salon_sheet_tab_bar_screens/salon_sheet_about.dart';
import 'package:shayplanner/components/salon_sheet/salon_sheet_tab_bar_screens/salon_sheet_rating.dart';
import 'package:shayplanner/components/salon_sheet/salon_sheet_tab_bar_screens/salon_sheet_services.dart';
import 'package:shayplanner/components/take_appointement/take_appointment_loading/gallery_loading.dart';
import 'package:shayplanner/theme/theme_app_bar.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/theme/theme_navigation_bottom_bar.dart';
import 'package:shayplanner/theme/theme_text.dart';
import 'package:shayplanner/tools/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SalonSheetScreen extends StatelessWidget {
  const SalonSheetScreen({super.key});
  static const routename = '/salon-sheet';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SalonSheetController>(
      init: SalonSheetController(Get.arguments),
      builder: (controller) => Scaffold(
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
                  theText: "tr_salon_sheet".tr,
                  thefontSize: 18.0.sp,
                  theColor: grey,
                  theFontFamily: fontBold,
                ),
              ),
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
                              items: controller.salonImages.isNotEmpty
                                  ? controller.salonImages
                                      .map(
                                        (item) => Image.network(
                                          width: 100.0.wp,
                                          item,
                                          fit: BoxFit.fill,
                                        ),
                                      )
                                      .toList()
                                  : controller.secourImages
                                      .map(
                                        (item) => Image.asset(
                                          width: 100.0.wp,
                                          item,
                                          fit: BoxFit.fill,
                                        ),
                                      )
                                      .toList(),
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
                  top: 23.0.hp,
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
                            theText:  controller.salon.name ?? "",
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
                                  theText: "${controller.salon.countAverage} (${controller.salon.countRating} avis) ",
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
                            padding: EdgeInsets.all(2.0.wp),
                            width: 100.0.wp,
                            child: ContainedTabBarView(
                              tabs: [
                                Text('tr_pictures'.tr),
                                Text('tr_services'.tr),
                                Text('tr_about'.tr),
                                Text('tr_rating'.tr),
                              ],
                              tabBarProperties: TabBarProperties(
                                width: 100.0.wp,
                                height: 5.0.hp,
                                background: Container(
                                  color: white,
                                ),
                                indicatorColor: grey,
                                labelColor: grey,
                                unselectedLabelColor: lightGrey,
                              ),
                              views: [
                                Container(color: biege),
                                SalonSheetServices(controller: controller),
                                SalonSheetAbout(controller: controller),
                                SalonSheetRating(controller: controller)
                              ],
                              onChange: (index) => print(index),
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