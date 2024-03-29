import 'dart:math';

import 'package:shayplanner/components/home/home_screen.dart';
import 'package:shayplanner/components/shops/shops_controller.dart';
import 'package:shayplanner/components/shops/shops_loading/shop_loading.dart';
import 'package:shayplanner/theme/theme_button.dart';
import 'package:shayplanner/theme/theme_button.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/theme/theme_grad_container.dart';
import 'package:shayplanner/theme/theme_input.dart';
import 'package:shayplanner/theme/theme_text.dart';
import 'package:shayplanner/tools/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ShopsScreen extends StatelessWidget {
  ShopsController shopsController = Get.put(ShopsController());
  static const routename = '/shops';
  @override
 Widget build(BuildContext context) {
    return Scaffold(
      // for the appBar we're going to give it 10% of the height
      backgroundColor: white,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that
        // was created by the App.build method, and use it to set
        // our appbar title.
        ///tresse
        backgroundColor: Colors.white,
        leading: InkWell(
            onTap: () {
              Get.toNamed(HomeScreen.routename);
            },
            child: Container(
              padding: EdgeInsets.only(left: 2.0.sp),
              margin:
                  EdgeInsets.symmetric(horizontal: 6.0.sp, vertical: 8.0.sp),
              child: SvgPicture.asset(
                "assets/icons/arrow_left.svg",
              ),
            )),
        leadingWidth: 10.0.wp,
        title: (Image.asset(
          "assets/images/logo103.png",
          width: 9.0.hp,
          height: 9.0.hp,
        )),
        centerTitle: true,
        actions: [],
        toolbarHeight: 10.0.hp,
      ),
      // first we're going to add a container that will occupy the whole width and 90% of the height
      body: SizedBox(
        //we're going to add some padding horizontally for the container in order
        //that the content will not stick to the edge of the screen
        width: Get.width,
        height:
            90.0.hp, // 10 percent of the height is a lready taken by the appbar
        // inside the container we're going to use SingleScrollView so that if the screen is not
        // long enought he content will scroll
        child: SingleChildScrollView(
          // we're going to use the Column widget inside the SingleChildScrollView in order
          //to place multiple widget whithin the SingleChildScrollView Widget
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 3.0.hp, bottom: 3.0.hp),
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
                        shopsController.keywordEditingController,
                    theValidation: shopsController.dontValidate,
                    theContentPadding: 5.0.sp,
                    theIconWidget: ThemeGradContainer(
                      theHeight: 3.0.wp,
                      theWith: 3.0.wp,
                      theMargin: 5.0.sp,
                      theLinearGradient: yellowFadeGradient,
                      theContent: Icon(Icons.search, color: Colors.white),
                    ),
                    theFloatingLabelBehaviour: FloatingLabelBehavior.never,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 6.0.wp, bottom: 1.0.hp),
                child: ThemeText(
                    theText: "tr_select_salon".tr,
                    theColor: black,
                    thefontSize: 14.0.sp,
                    theFontWeight: FontWeight.bold),
              ),
              Container(
                margin: EdgeInsets.only(left: 6.0.wp, bottom: 1.0.hp),
                child: ThemeText(
                  theText:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit,",
                  theColor: black,
                  thefontSize: 11.0.sp,
                ),
              ),
              Obx(() => 
              shopsController.isLoadingShops.value==true ?
              ShopsLoading() :
              Container(
                height: 62.0.hp,
                child: ListView(children: [
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 1.0.wp),
                        decoration: BoxDecoration(
                            boxShadow: themeBoxShadowCard,
                            borderRadius: BorderRadius.circular(10.0.sp)),
                        child: Column(children: [
                          Container(
                            height: 20.0.hp,
                            width: 92.0.wp,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0.sp),
                                topRight: Radius.circular(10.0.sp),
                              ),
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/model_on_mirror.png",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            height: 11.0.hp,
                            width: 92.0.wp,
                            child: Row(
                              children: [
                                Container(
                                  width: 60.0.wp,
                                  padding: EdgeInsets.only(left: 3.0.wp),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 55.0.wp,
                                        height: 5.0.hp,
                                        padding: EdgeInsets.only(top: 0.5.hp),
                                        child: ThemeText(
                                            theText: "Lorem ipsum",
                                            thefontSize: 14.0.sp,
                                            theColor: black,
                                            theFontFamily: "Montserrat-Bold"),
                                      ),
                                      Container(
                                        width: 55.0.wp,
                                        height: 2.0.hp,
                                        child: Row(children: [
                                          Container(
                                            width: 5.0.wp,
                                            height: 5.0.wp,
                                            child: SvgPicture.asset(
                                                'assets/icons/localization.svg',
                                                color: grey),
                                          ),
                                          Center(
                                            child: Container(
                                              width: 50.0.wp,
                                              child: ThemeText(
                                                theText:
                                                    "Lorem ipsum dolor sit amet",
                                                thefontSize: 10.0.sp,
                                                theColor: grey,
                                                theMaxOfLines: 1,
                                                theTextDecoration:
                                                    TextDecoration.underline,
                                              ),
                                            ),
                                          ),
                                        ]),
                                      ),
                                      Container(
                                          width: 55.0.wp,
                                          height: 4.0.hp,
                                          child: Row(children: [
                                            Container(
                                              width: 5.0.wp,
                                              height: 5.0.wp,
                                              child: SvgPicture.asset(
                                                  'assets/icons/star.svg',
                                                  color: grey),
                                            ),
                                            Center(
                                              child: Container(
                                                width: 50.0.wp,
                                                child: ThemeText(
                                                  theText:
                                                      "4,9 (317 avis)  MAD",
                                                  thefontSize: 10.0.sp,
                                                  theColor: grey,
                                                  theMaxOfLines: 1,
                                                ),
                                              ),
                                            ),
                                          ])),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 32.0.wp,
                                  height: 11.0.hp,
                                  child: InkWell(
                                    onTap: () => shopsController.goToSalonSheet,
                                    child: Container(
                                        margin: EdgeInsets.only(
                                            bottom: 4.0.hp,
                                            top: 2.0.hp,
                                            right: 3.0.wp),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          color: grey,
                                        ),
                                        child: Center(
                                          child: ThemeText(
                                            theText: "Fiche du salon",
                                            thefontSize: 9.0.sp,
                                            theColor: white,
                                            theFontWeight: FontWeight.bold,
                                            theFontFamily: "Montserrat-Bold",
                                          ),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.0.sp,
                          ),
                          Container(
                            width: 92.0.wp,
                            padding: EdgeInsets.symmetric(horizontal: 3.0.wp),
                            child: Column(
                              children: [
                                Container(
                                  width: 92.0.wp,
                                  height: 4.0.hp,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: ThemeText(
                                          theText: "Matin",
                                          thefontSize: 10.0.sp,
                                          theColor: grey,
                                          theFontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: ListView(
                                            scrollDirection: Axis.horizontal,
                                            children: shopsController
                                                .buildDaysList()),
                                      ),
                                    ],
                                  ),
                                ),
                              shopsController
                                        .isShowingWorkHours.value
                                    ? Container(
                                        width: 92.0.wp,
                                        height: 5.0.hp,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: ThemeText(
                                                theText: "Matin",
                                                thefontSize: 10.0.sp,
                                                theColor: grey,
                                                theFontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: ListView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  children: shopsController
                                                      .buildDaysList()),
                                            ),
                                          ],
                                        ),
                                      )
                                    : SizedBox(),
                                Container(
                                  width: 92.0.wp,
                                  height: 4.0.hp,
                                  margin: EdgeInsets.only(top: 0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: ThemeText(
                                          theText: "Après-midi",
                                          thefontSize: 10.0.sp,
                                          theColor: grey,
                                          theFontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: ListView(
                                            scrollDirection: Axis.horizontal,
                                            children: shopsController
                                                .buildDaysList()),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 4.0.sp)
                              ],
                            ),
                          ),
                        ]),
                      ),
                      SizedBox(height: 2.0.hp),
                      ThemeButton(
                          theContent: ThemeGradContainer(
                            theWith: 40.0.wp,
                            theHeight: 5.0.hp,
                            theLinearGradient: greyYellowLinearGradient,
                            theContent: ThemeText(
                                theText: "Prendre Rdv",
                                thefontSize: 12.0.sp,
                                theColor: white,
                                theFontFamily: fontBold),
                          ),
                          theAction: shopsController.book,
                          theLoadingStatus: shopsController.isLoadingBookAppointment.value),
                      SizedBox(height: 10.0.hp)
                    ],
                  ),
                ]),
              )),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: 92.0.wp,
        height: 8.0.hp,
        decoration: BoxDecoration(
          color: grey,
          borderRadius: BorderRadius.circular(6.5.wp),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          InkWell(
            onTap: () => {Get.offNamed(HomeScreen.routename)},
            child: SizedBox(
              width: 9.0.wp,
              height: 9.0.wp,
              child: Image.asset('assets/icons/floating_app_bar/home.png'),
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
              child: Image.asset('assets/icons/floating_app_bar/calendar.png'),
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
    );
  }
}

