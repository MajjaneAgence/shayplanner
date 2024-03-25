import 'dart:math';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:shayplanner/components/home/home_controller.dart';
import 'package:shayplanner/components/home/home_loading/categories_loading.dart';
import 'package:shayplanner/components/home/home_loading/latest_salons_loading.dart';
import 'package:shayplanner/components/home/home_search/home_search_screen.dart';
import 'package:shayplanner/components/shops/salons_screen.dart';
import 'package:shayplanner/theme/theme_circle_painter.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/theme/theme_grad_container.dart';
import 'package:shayplanner/theme/theme_input.dart';
import 'package:shayplanner/theme/theme_navigation_bottom_bar.dart';
import 'package:shayplanner/theme/theme_text.dart';
import 'package:shayplanner/tools/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());
  static const routename = '/home';
  HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        extendBody: true,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Padding(
            padding: EdgeInsets.only(left: 4.0.wp),
            child: Row(
              children: [
                Obx(
                  () => PopupMenuButton<String>(
                    position: PopupMenuPosition.under,
                    offset: Get.locale!.languageCode == "ar"
                        ? Offset(0, -30)
                        : Offset.zero,
                    color: Colors.transparent,
                    elevation: 0,
                    itemBuilder: (context) {
                      return homeController.lanuages.map((str) {
                        return PopupMenuItem(
                          value: str,
                          height: 8.0.wp,
                          child: InkWell(
                            onTap: () => {homeController.changeLanguage(str)},
                            child: Container(
                              decoration: BoxDecoration(
                                  color: biege,
                                  borderRadius: BorderRadius.circular(5.0)),
                              padding: EdgeInsets.all(4.0.sp),
                              margin: EdgeInsets.all(2.0.sp),
                              width: 25.0.wp,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ThemeText(
                                      theText: str,
                                      thefontSize: 10.0.sp,
                                      theColor: black),
                                  SizedBox(width: 5.0.sp),
                                  Get.locale!.languageCode != "ar"
                                      ? SvgPicture.asset(
                                          "assets/icons/home/arrow_left.svg")
                                      : SvgPicture.asset(
                                          "assets/icons/home/arrow_right.svg")
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList();
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Get.locale!.languageCode == "ar"
                            ? Container(width: 4.0.wp)
                            : SizedBox(),
                        homeController.selectedLanguage.value == "fr"
                            ? ThemeText(
                                theText: "Fr",
                                thefontSize: 12.0.sp,
                                theColor: black,
                                theFontWeight: FontWeight.bold)
                            : homeController.selectedLanguage.value == "en"
                                ? ThemeText(
                                    theText: "En",
                                    thefontSize: 12.0.sp,
                                    theColor: black,
                                    theFontWeight: FontWeight.bold)
                                : ThemeText(
                                    theText: "ع",
                                    thefontSize: 12.0.sp,
                                    theColor: black,
                                    theFontWeight: FontWeight.bold),
                        SizedBox(width: 4.0.sp),
                        SvgPicture.asset("assets/icons/drop_down.svg"),
                      ],
                    ),
                    onSelected: (v) {
                      print(v);
                      if (v == "Français") {
                        homeController.selectedLanguage.value = "Fr";
                        homeController.selectedLanguage.refresh();
                      } else {
                        homeController.selectedLanguage.value = "An";
                        homeController.selectedLanguage.refresh();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          //leadingWidth: 10.0.wp,
          title: Container(
            //color:Colors.red,
            child: SvgPicture.asset("assets/icons/app_logos/logo_app_bar.svg",
                width: 40.0.wp, height: 40.0.wp),
          ),
          centerTitle: true,
          actions: [
            GestureDetector(
                onTap: () {
                  homeController.gotoNotifcation();
                },
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/bell.svg",
                      width: 5.0.wp,
                      height: 5.0.wp,
                    ),
                    SizedBox(width: 8.0.wp),
                  ],
                ))
          ],
          toolbarHeight: 10.0.hp,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(children: [
                Container(
                  color: white,
                  width: 100.0.wp,
                  child: CarouselSlider(
                    options: CarouselOptions(
                        height: 75.0.hp,
                        viewportFraction: 1.5,
                        initialPage: 0,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (index, reason) {
                          homeController.currentIndex.value = index;
                          homeController.currentIndex.refresh();
                        }),
                    items: homeController.modelsImages
                        .map(
                          (item) => Container(
                            width: Get.width,
                            height: 75.0.hp,
                            decoration: BoxDecoration(
                              boxShadow: themeBoxShadowCard,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40.0.sp),
                                  topRight: Radius.circular(40.0.sp)),
                              image: DecorationImage(
                                image:
                                    AssetImage('assets/images/home/models.jpg'),
                                fit: BoxFit.cover,
                                alignment: Alignment.topCenter,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                Positioned(
                  top: 40.0.hp,
                  left: 7.0.wp,
                  right: 7.0.wp,
                  bottom: 7.0.hp,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.25),
                            borderRadius: BorderRadius.circular(25)),
                        child: Container(
                          padding: EdgeInsets.only(
                            left: 5.0.wp,
                            right: 5.0.wp,
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ThemeText(
                                  theText: "tr_book_ur_beauty_appointment".tr,
                                  thefontSize: 18.0.sp,
                                  theColor: white,
                                  theFontWeight: FontWeight.bold,
                                  theTextAlign: TextAlign.center,
                                ),
                                SizedBox(height: 1.0.hp),
                                ThemeInput(
                                  theInputHeight: 5.0.hp,
                                  theLabelText: "tr_salon_service".tr,
                                  theHintText: "tr_salon_service".tr,
                                  theTextEditingController:
                                      homeController.shopNameEditingController,
                                  theValidation:
                                      homeController.validateFirstName,
                                  theContentPadding: 5.0.sp,
                                  theIconWidget: ThemeGradContainer(
                                    theHeight: 3.0.wp,
                                    theWith: 3.0.wp,
                                    theColor: crem,
                                    theMargin: 5.0.sp,
                                    theContent: InkWell(
                                      onTap: () {
                                        Get.toNamed(SalonsScreen.routename,
                                            arguments: "nom");
                                      },
                                      child: SvgPicture.asset(
                                          "assets/icons/home/salon.svg",
                                          width: 5.0.wp,
                                          height: 5.0.wp),
                                    ),
                                  ),
                                  theFloatingLabelBehaviour:
                                      FloatingLabelBehavior.never,
                                ),
                                SizedBox(height: 1.0.hp),
                                ThemeInput(
                                  theInputHeight: 5.0.hp,
                                  theLabelText: "tr_address_city".tr,
                                  theHintText: "tr_address_city".tr,
                                  theTextEditingController: homeController
                                      .shopAddressEditingController,
                                  theValidation:
                                      homeController.validateFirstName,
                                  theContentPadding: 5.0.sp,
                                  theIconWidget: ThemeGradContainer(
                                    theHeight: 3.0.wp,
                                    theWith: 3.0.wp,
                                    theColor: crem,
                                    theMargin: 5.0.sp,
                                    theContent: InkWell(
                                      onTap: () {
                                        Get.toNamed(SalonsScreen.routename,
                                            arguments: "adreess");
                                      },
                                      child: SvgPicture.asset(
                                          "assets/icons/home/position.svg",
                                          width: 5.0.wp,
                                          height: 5.0.wp),
                                    ),
                                  ),
                                  theFloatingLabelBehaviour:
                                      FloatingLabelBehavior.never,
                                ),
                                SizedBox(height: 1.0.hp),
                              ]),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
              // ),
              Container(
                color: biege,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 2.0.hp),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 4.0.wp),
                      child: ThemeText(
                        theText: "tr_categories".tr,
                        theColor: black,
                        thefontSize: 14.0.sp,
                        theFontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 1.0.hp),
                    Obx(
                      () => homeController.isLoadingCategories.value == true
                          ? CategoriesLoading()
                          : Container(
                              alignment: Alignment.center,
                              height: 16.0.hp,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  SizedBox(width: 3.0.wp),
                                  ...homeController.categories.map(
                                    (category) => InkWell(
                                      onTap: () {
                                        Get.toNamed(SalonsScreen.routename,
                                            arguments: 'address');
                                      },
                                      child: Container(
                                        // color:Colors.red,
                                        width: 12.5.hp,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  CustomPaint(
                                                    size: Size(
                                                        4.5.hp * 2, 4.5 * 2),
                                                    painter: CirclePainter(
                                                      percentage: 0.8,
                                                      // backgroundColor: Colors.red,
                                                      progressColor: crem,
                                                    ),
                                                    child: CircleAvatar(
                                                      radius: 4.5.hp,
                                                      backgroundImage:
                                                          NetworkImage(category
                                                              .pictureUrl),
                                                    ),
                                                  ),
                                                ]),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: ThemeText(
                                                    theText: category.name,
                                                    thefontSize: 8.0.sp,
                                                    theColor: black,
                                                    theMaxOfLines: 1,
                                                    theTextAlign:
                                                        TextAlign.center,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                    ),
                    SizedBox(height: 1.0.hp),
                    Container(
                      margin: EdgeInsets.only(left: 4.0.wp),
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(fontSize: 14.0.sp, color: black),
                          children: [
                            TextSpan(
                              text: 'tr_new_on'.tr,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: 'PLANNER',
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 1.0.hp),
                    Obx(
                      () => homeController.isLoadingLatestSalons.value == true
                          ? LatestSalonsLoading()
                          : Container(
                              height: 40.0.hp,
                              margin: EdgeInsets.symmetric(horizontal: 8.0.sp),
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  ...homeController.latestsSalons.map((salon) =>  InkWell(
                                    onTap: () {
                                      Get.toNamed(SalonsScreen.routename,
                                          arguments: salon.id);
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          right: 4.0.wp, bottom: 1.0.hp),
                                      decoration: BoxDecoration(
                                          boxShadow: themeBoxShadowCard,
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      child: Column(children: [
                                        Container(
                                          height: 25.0.hp,
                                          width: 87.0.wp,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft:
                                                    Radius.circular(18.0.sp),
                                                topRight:
                                                    Radius.circular(18.0.sp)),
                                            image: DecorationImage(
                                              image: NetworkImage(salon.picture??''),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 2.0.hp),
                                        Container(
                                          height: 5.0.hp,
                                          width: 87.0.wp,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.0.wp),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              ThemeText(
                                                  theText:salon.name ?? '',
                                                  thefontSize: 14.0.sp,
                                                  theColor: black,
                                                  theFontFamily:
                                                      "Montserrat-Bold"),
                                              // ThemeGradContainer(
                                              //   theWith: 6.0.hp,
                                              //   theHeight: 4.0.hp,
                                              //   thePadding: 4.0.sp,
                                              //   theColor: crem,
                                              //   theContent: SvgPicture.asset(
                                              //     "assets/icons/arrow_right.svg",
                                              //   ),
                                              // ),
                                              Container(
                                                width: 6.0.hp,
                                                height: 4.0.hp,
                                                padding: EdgeInsets.all(5.0.sp),
                                                decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6.0.sp),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Color.fromARGB(
                                                    255, 185, 126, 70)),
                                            BoxShadow(
                                                color: crem,
                                                spreadRadius: -0.5,
                                                offset: Offset(-2, -3),
                                                blurRadius: 0),
                                          ],
                                        ),
                                                child: SvgPicture.asset(
                                                  "assets/icons/arrow_right.svg",
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 87.0.wp,
                                          height: 3.0.hp,
                                          padding: EdgeInsets.only(
                                              left: 5.0.wp,
                                              right: 5.0.wp,
                                              bottom: 0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 5.0.wp,
                                                height: 5.0.wp,
                                                margin: EdgeInsets.only(
                                                    right: 2.0.sp),
                                                child: SvgPicture.asset(
                                                    'assets/icons/localization.svg',
                                                    color: grey),
                                              ),
                                              Center(
                                                child: Container(
                                                  width: 50.0.wp,
                                                  margin: EdgeInsets.only(
                                                      right: 6.0.sp),
                                                  child: ThemeText(
                                                    theText:
                                                        salon.address ?? '',
                                                    thefontSize: 10.0.sp,
                                                    theColor: grey,
                                                    theMaxOfLines: 1,
                                                    theTextDecoration:
                                                        TextDecoration
                                                            .underline,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 87.0.wp,
                                          height: 3.0.hp,
                                          padding: EdgeInsets.only(
                                              left: 5.0.wp,
                                              right: 5.0.wp,
                                              top: 0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 5.0.wp,
                                                height: 5.0.wp,
                                                margin: EdgeInsets.only(
                                                    right: 2.0.sp),
                                                child: SvgPicture.asset(
                                                    'assets/icons/star.svg',
                                                    color: grey),
                                              ),
                                              Center(
                                                child: Container(
                                                  width: 50.0.wp,
                                                  margin: EdgeInsets.only(
                                                      right: 6.0.sp),
                                                  child: ThemeText(
                                                    theText:
                                                        "4,9 (317 avis)  MAD",
                                                    thefontSize: 10.0.sp,
                                                    theColor: grey,
                                                    theMaxOfLines: 1,
                                                    theTextDecoration:
                                                        TextDecoration
                                                            .underline,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 1.0.hp),
                                      ]),
                                    ),
                                  ),)
                                 
                                ],
                              ),
                            ),
                    ),
                    SizedBox(height: 15.0.hp)
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: ThemeNavigationBottomBar());
  }
}
