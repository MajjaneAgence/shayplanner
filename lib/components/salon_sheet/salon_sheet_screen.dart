import 'package:carousel_slider/carousel_slider.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:shayplanner/components/home/home_screen.dart';
import 'package:shayplanner/components/introduction/introduction_controller.dart';
import 'package:shayplanner/components/salon_sheet/salon_sheet_controller.dart';
import 'package:shayplanner/components/salon_sheet/salon_sheet_tab_bar_screens/salon_sheet_services.dart';
import 'package:shayplanner/components/shops/shops_screen.dart';
import 'package:shayplanner/theme/theme_app_bar.dart';
import 'package:shayplanner/theme/theme_colors.dart';
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
    final SalonSheetController salonSheetController =
        Get.put(SalonSheetController());

    return Scaffold(
      appBar: ThemeAppBar(),
      body: Container(
        width: 100.0.wp,
        height: 100.0.hp,
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              color: biege,
              height: 8.0.hp,
              width: 100.0.wp,
              padding: EdgeInsets.only(left: 10.0.wp, top: 2.0.hp),
              child: ThemeText(
                theText: "tr_salon_sheet".tr,
                thefontSize: 18.0.sp,
                theColor: grey,
                theFontWeight: FontWeight.bold,
              ),
            ),
            Stack(children: [
              CarouselSlider(
                carouselController: salonSheetController.carouselController,
                options: CarouselOptions(
                    height: 30.0.hp,
                    viewportFraction: 1.5,
                    initialPage: 0,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index, reason) {
                      salonSheetController.currentIndex.value = index;
                      salonSheetController.currentIndex.refresh();
                    }),
                items: salonSheetController.salonImages
                    .map(
                      (item) => salonSheetController.salonImages.isEmpty
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
              Obx(
                () => Positioned(
                  top:22.0.hp,
                  left: 37.0.wp,
                  child: DotsIndicator(
                  onTap: (position) {
                    salonSheetController.currentIndex.value = position;
                    salonSheetController.currentIndex.refresh();
                    salonSheetController.carouselController.animateToPage(position);
                  },
                  dotsCount: salonSheetController.salonImages.length,
                  position: salonSheetController.currentIndex.value,
                  decorator: DotsDecorator(
                      color: transparent,
                      activeColor: white,
                      activeSize: Size.square(10),
                      shape: CircleBorder(
                          side: BorderSide(color: white, width: 1.0))),
                )),
              )
            ])
          ]),
        ),
      ),
      bottomSheet: Container(
        width: 100.0.wp,
        height: 40.0.hp,
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
              //color: Colors.green,
              padding: EdgeInsets.only(
                  top: 1.0.hp, bottom: 0.3.hp, left: 7.0.wp, right: 7.0.wp),
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
              padding:
                  EdgeInsets.symmetric(vertical: 0.2.hp, horizontal: 7.0.wp),
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
              padding:
                  EdgeInsets.symmetric(vertical: 0.2.hp, horizontal: 7.0.wp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 5.0.wp,
                    height: 5.0.wp,
                    margin: EdgeInsets.only(right: 2.0.sp),
                    child:
                        SvgPicture.asset('assets/icons/star.svg', color: grey),
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
                    Container(color: Colors.red),
                    SalonSheetServices(),
                    Container(color: Colors.red),
                    Container(color: Colors.green)
                  ],
                  onChange: (index) => print(index),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        child: Container(
          width: 92.0.wp,
          height: 10.0.hp,
          decoration: BoxDecoration(
            color: grey,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.5.wp),
              topRight: Radius.circular(8.5.wp),
            ),
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            InkWell(
              onTap: () => {Get.toNamed(HomeScreen.routename)},
              child: SizedBox(
                width: 9.0.wp,
                height: 9.0.wp,
                child: Image.asset(
                    'assets/icons/floating_app_bar/home-active.png'),
              ),
            ),
            InkWell(
              onTap: () => {},
              child: SizedBox(
                width: 9.0.wp,
                height: 9.0.wp,
                child: Image.asset('assets/icons/floating_app_bar/map.png'),
              ),
            ),
            InkWell(
              onTap: () => {Get.toNamed(ShopsScreen.routename)},
              child: SizedBox(
                width: 9.0.wp,
                height: 9.0.wp,
                child:
                    Image.asset('assets/icons/floating_app_bar/calendar.png'),
              ),
            ),
            InkWell(
              onTap: () => {},
              child: SizedBox(
                width: 9.0.wp,
                height: 9.0.wp,
                child: Image.asset('assets/icons/floating_app_bar/profile.png'),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

//https://stackoverflow.com/questions/63407435/flutter-subitems-in-menu-slider
//https://pub.dev/packages/flutter_slidable