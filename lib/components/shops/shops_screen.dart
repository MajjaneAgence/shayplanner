import 'dart:math';

import 'package:shayplanner/components/home/home_screen.dart';
import 'package:shayplanner/components/shops/shops_controller.dart';
import 'package:shayplanner/components/shops/shops_loading/shop_loading.dart';
import 'package:shayplanner/theme/theme_app_bar.dart';
import 'package:shayplanner/theme/theme_button.dart';
import 'package:shayplanner/theme/theme_button.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/theme/theme_grad_container.dart';
import 'package:shayplanner/theme/theme_input.dart';
import 'package:shayplanner/theme/theme_navigation_bottom_bar.dart';
import 'package:shayplanner/theme/theme_text.dart';
import 'package:shayplanner/tools/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ShopsScreen extends StatelessWidget {
  ShopsController shopsController = Get.put(ShopsController());
  static const routename = '/shops';
  var test =  Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        appBar: ThemeAppBar(),
        body: Container(
          width: Get.width,
          height: 90.0.hp,
          color: biege,
          child: SingleChildScrollView(
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
                        theColor: crem,
                        theContent: Icon(Icons.search, color: Colors.white),
                      ),
                      theFloatingLabelBehaviour: FloatingLabelBehavior.never,
                    ),
    //                SizedBox(
    //   height:  5.0.hp,
    //   child:TextFormField(
    //   controller: shopsController.keywordEditingController,
    //   keyboardType: theKeyboardType?? TextInputType.text,
    //   style: TextStyle(fontSize: 10.0.sp),
    //   decoration: InputDecoration(
    //     labelText: "Nom du salon",
    //     hintText: "Nom du salon",
    //     counterText:  "",
    //     fillColor: verylightGrey,
    //     errorStyle: TextStyle(height: 0.1,
    //     fontSize: 8.0.sp),
    //     hintStyle: TextStyle(
    //       fontSize: 10.0.sp
    //     ),
    //     labelStyle: TextStyle(fontSize: 10.0.sp),
    //    floatingLabelBehavior: FloatingLabelBehavior.never ,
    //     contentPadding: EdgeInsets.all(5.0.sp),
    //     border: OutlineInputBorder(
    //       borderRadius: BorderRadius.circular(10.0),
    //     ),
    //     filled: true,
    //     suffixIcon: Icon(Icons.search, color: Colors.white),
    //     enabledBorder: OutlineInputBorder(
    //       borderRadius: BorderRadius.circular(10),
    //       borderSide: const BorderSide(
    //         color: Colors.white,
    //       ),
    //     ),
    //     focusedBorder: OutlineInputBorder(
    //       borderRadius: BorderRadius.circular(10),
    //       borderSide: const BorderSide(
    //         color: Colors.white,
    //       ),
    //     ),
    //   ),
    // ),)
                  ),
                ),
                SizedBox(height:1.0.hp),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 6.0.wp),
                  child: ThemeText(
                      theText: "tr_select_salon".tr,
                      theColor: black,
                      thefontSize: 14.0.sp,
                      theFontWeight: FontWeight.bold),
                ),
                SizedBox(height:1.0.hp),
                // Container(
                //   margin: EdgeInsets.symmetric(horizontal: 6.0.wp),
                //   child: ThemeText(
                //     theText:
                //         "Lorem ipsum dolor sit amet, consectetur adipiscing elit,",
                //     theColor: black,
                //     thefontSize: 11.0.sp,
                //   ),
                // ),
                Obx(() => shopsController.isLoadingShops.value == true
                    ? ShopsLoading()
                    : 
                    Container(
                        height: 62.0.hp,
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(25.0.sp)),
                        child: ListView(children: [
                          SizedBox(height: 3.0.hp),
                          test=="nom" ?
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 1.0.wp),
                                decoration: BoxDecoration(
                                    boxShadow: themeBoxShadowCard,
                                    borderRadius:
                                        BorderRadius.circular(25.0.sp)),
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
                                          padding: Get.locale!.languageCode!="ar" ?
                                              EdgeInsets.only(left: 3.0.wp,right:1.0.wp)
                                               :EdgeInsets.only(left: 1.0.wp,right:3.0.wp),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 55.0.wp,
                                                height: 5.0.hp,
                                                padding: EdgeInsets.only(
                                                    top: 0.5.hp),
                                                child: ThemeText(
                                                    theText: "Lorem ipsum",
                                                    thefontSize: 14.0.sp,
                                                    theColor: black,
                                                    theFontFamily:
                                                        "Montserrat-Bold"),
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
                                                            TextDecoration
                                                                .underline,
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
                                          alignment: Alignment.center,
                                          child: InkWell(
                                            onTap: () => shopsController
                                                .goToSalonSheet(),
                                            child: Container(
                                  width: 28.0.wp,
                                              height: 5.0.hp,
                                             alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                color: grey,
                                              ),
                                              child: ThemeText(
                                                theText: "tr_salon_sheet_".tr,
                                                thefontSize: 9.0.sp,
                                                theColor: white,
                                                theFontWeight: FontWeight.bold,
                                                theFontFamily:
                                                    "Montserrat-Bold",
                                              ),
                                            ),
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
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 3.0.wp),
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
                                                  theText: "tr_morning".tr,
                                                  thefontSize: 10.0.sp,
                                                  theColor: grey,
                                                  theFontWeight:
                                                      FontWeight.bold,
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
                                        ),
                                        shopsController.isShowingWorkHours.value
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
                                                        theFontWeight:
                                                            FontWeight.bold,
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
                                                  theText: "tr_afternoon".tr,
                                                  thefontSize: 10.0.sp,
                                                  theColor: grey,
                                                  theFontWeight:
                                                      FontWeight.bold,
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
                                        ),
                                        SizedBox(height: 4.0.sp)
                                      ],
                                    ),
                                  ),
                                ]),
                              ),
                              SizedBox(height: 2.0.hp),
                              ThemeButton(
                                  theContent: Container(
                                    alignment: Alignment.center,
                                    width: 40.0.wp,
                                    height: 5.0.hp,
                                    child: ThemeText(
                                        theText: "Prendre Rdv",
                                        thefontSize: 12.0.sp,
                                        theColor: white,
                                        theFontFamily: fontBold),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(6.0.sp),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color.fromARGB(
                                                255, 185, 126, 70)),
                                        BoxShadow(
                                            color: crem,
                                            spreadRadius: -1.5,
                                            offset: Offset(-3, -3),
                                            blurRadius: 0.5),
                                      ],
                                    ),
                                  ),
                                  theAction: shopsController.book,
                                  theLoadingStatus: shopsController
                                      .isLoadingBookAppointment.value),
                              SizedBox(height: 5.0.hp)
                            ],
                          ):
                          Column(
                            children: [
Column(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 1.0.wp),
                                decoration: BoxDecoration(
                                    boxShadow: themeBoxShadowCard,
                                    borderRadius:
                                        BorderRadius.circular(25.0.sp)),
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
                                          padding: Get.locale!.languageCode!="ar" ?
                                              EdgeInsets.only(left: 3.0.wp,right:1.0.wp)
                                               :EdgeInsets.only(left: 1.0.wp,right:3.0.wp),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 55.0.wp,
                                                height: 5.0.hp,
                                                padding: EdgeInsets.only(
                                                    top: 0.5.hp),
                                                child: ThemeText(
                                                    theText: "Lorem ipsum",
                                                    thefontSize: 14.0.sp,
                                                    theColor: black,
                                                    theFontFamily:
                                                        "Montserrat-Bold"),
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
                                                            TextDecoration
                                                                .underline,
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
                                          alignment: Alignment.center,
                                          child: InkWell(
                                            onTap: () => shopsController
                                                .goToSalonSheet(),
                                            child: Container(
                                  width: 28.0.wp,
                                              height: 5.0.hp,
                                             alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                color: grey,
                                              ),
                                              child: ThemeText(
                                                theText: "tr_salon_sheet_".tr,
                                                thefontSize: 9.0.sp,
                                                theColor: white,
                                                theFontWeight: FontWeight.bold,
                                                theFontFamily:
                                                    "Montserrat-Bold",
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.0.sp,
                                  ),
                                  Container(
                                    width: 92.0.wp,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 3.0.wp),
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
                                                  theText: "tr_morning".tr,
                                                  thefontSize: 10.0.sp,
                                                  theColor: grey,
                                                  theFontWeight:
                                                      FontWeight.bold,
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
                                        ),
                                        shopsController.isShowingWorkHours.value
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
                                                        theFontWeight:
                                                            FontWeight.bold,
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
                                                  theText: "tr_afternoon".tr,
                                                  thefontSize: 10.0.sp,
                                                  theColor: grey,
                                                  theFontWeight:
                                                      FontWeight.bold,
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
                                        ),
                                        SizedBox(height: 4.0.sp)
                                      ],
                                    ),
                                  ),
                                ]),
                              ),
                              SizedBox(height: 2.0.hp),
                              ThemeButton(
                                  theContent: Container(
                                    alignment: Alignment.center,
                                    width: 40.0.wp,
                                    height: 5.0.hp,
                                    child: ThemeText(
                                        theText: "Prendre Rdv",
                                        thefontSize: 12.0.sp,
                                        theColor: white,
                                        theFontFamily: fontBold),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(6.0.sp),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color.fromARGB(
                                                255, 185, 126, 70)),
                                        BoxShadow(
                                            color: crem,
                                            spreadRadius: -1.5,
                                            offset: Offset(-3, -3),
                                            blurRadius: 0.5),
                                      ],
                                    ),
                                  ),
                                  theAction: shopsController.book,
                                  theLoadingStatus: shopsController
                                      .isLoadingBookAppointment.value),
                              SizedBox(height: 5.0.hp)
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 1.0.wp),
                                decoration: BoxDecoration(
                                    boxShadow: themeBoxShadowCard,
                                    borderRadius:
                                        BorderRadius.circular(25.0.sp)),
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
                                          padding: Get.locale!.languageCode!="ar" ?
                                              EdgeInsets.only(left: 3.0.wp,right:1.0.wp)
                                               :EdgeInsets.only(left: 1.0.wp,right:3.0.wp),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 55.0.wp,
                                                height: 5.0.hp,
                                                padding: EdgeInsets.only(
                                                    top: 0.5.hp),
                                                child: ThemeText(
                                                    theText: "Lorem ipsum",
                                                    thefontSize: 14.0.sp,
                                                    theColor: black,
                                                    theFontFamily:
                                                        "Montserrat-Bold"),
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
                                                            TextDecoration
                                                                .underline,
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
                                          alignment: Alignment.center,
                                          child: InkWell(
                                            onTap: () => shopsController
                                                .goToSalonSheet(),
                                            child: Container(
                                  width: 28.0.wp,
                                              height: 5.0.hp,
                                             alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                color: grey,
                                              ),
                                              child: ThemeText(
                                                theText: "tr_salon_sheet_".tr,
                                                thefontSize: 9.0.sp,
                                                theColor: white,
                                                theFontWeight: FontWeight.bold,
                                                theFontFamily:
                                                    "Montserrat-Bold",
                                              ),
                                            ),
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
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 3.0.wp),
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
                                                  theText: "tr_morning".tr,
                                                  thefontSize: 10.0.sp,
                                                  theColor: grey,
                                                  theFontWeight:
                                                      FontWeight.bold,
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
                                        ),
                                        shopsController.isShowingWorkHours.value
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
                                                        theFontWeight:
                                                            FontWeight.bold,
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
                                                  theText: "tr_afternoon".tr,
                                                  thefontSize: 10.0.sp,
                                                  theColor: grey,
                                                  theFontWeight:
                                                      FontWeight.bold,
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
                                        ),
                                        SizedBox(height: 4.0.sp)
                                      ],
                                    ),
                                  ),
                                ]),
                              ),
                              SizedBox(height: 2.0.hp),
                              ThemeButton(
                                  theContent: Container(
                                    alignment: Alignment.center,
                                    width: 40.0.wp,
                                    height: 5.0.hp,
                                    child: ThemeText(
                                        theText: "Prendre Rdv",
                                        thefontSize: 12.0.sp,
                                        theColor: white,
                                        theFontFamily: fontBold),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(6.0.sp),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color.fromARGB(
                                                255, 185, 126, 70)),
                                        BoxShadow(
                                            color: crem,
                                            spreadRadius: -1.5,
                                            offset: Offset(-3, -3),
                                            blurRadius: 0.5),
                                      ],
                                    ),
                                  ),
                                  theAction: shopsController.book,
                                  theLoadingStatus: shopsController
                                      .isLoadingBookAppointment.value),
                              SizedBox(height: 5.0.hp)
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 1.0.wp),
                                decoration: BoxDecoration(
                                    boxShadow: themeBoxShadowCard,
                                    borderRadius:
                                        BorderRadius.circular(25.0.sp)),
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
                                          padding: Get.locale!.languageCode!="ar" ?
                                              EdgeInsets.only(left: 3.0.wp,right:1.0.wp)
                                               :EdgeInsets.only(left: 1.0.wp,right:3.0.wp),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 55.0.wp,
                                                height: 5.0.hp,
                                                padding: EdgeInsets.only(
                                                    top: 0.5.hp),
                                                child: ThemeText(
                                                    theText: "Lorem ipsum",
                                                    thefontSize: 14.0.sp,
                                                    theColor: black,
                                                    theFontFamily:
                                                        "Montserrat-Bold"),
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
                                                            TextDecoration
                                                                .underline,
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
                                          alignment: Alignment.center,
                                          child: InkWell(
                                            onTap: () => shopsController
                                                .goToSalonSheet(),
                                            child: Container(
                                  width: 28.0.wp,
                                              height: 5.0.hp,
                                             alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                color: grey,
                                              ),
                                              child: ThemeText(
                                                theText: "tr_salon_sheet_".tr,
                                                thefontSize: 9.0.sp,
                                                theColor: white,
                                                theFontWeight: FontWeight.bold,
                                                theFontFamily:
                                                    "Montserrat-Bold",
                                              ),
                                            ),
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
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 3.0.wp),
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
                                                  theText: "tr_morning".tr,
                                                  thefontSize: 10.0.sp,
                                                  theColor: grey,
                                                  theFontWeight:
                                                      FontWeight.bold,
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
                                        ),
                                        shopsController.isShowingWorkHours.value
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
                                                        theFontWeight:
                                                            FontWeight.bold,
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
                                                  theText: "tr_afternoon".tr,
                                                  thefontSize: 10.0.sp,
                                                  theColor: grey,
                                                  theFontWeight:
                                                      FontWeight.bold,
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
                                        ),
                                        SizedBox(height: 4.0.sp)
                                      ],
                                    ),
                                  ),
                                ]),
                              ),
                              SizedBox(height: 2.0.hp),
                              ThemeButton(
                                  theContent: Container(
                                    alignment: Alignment.center,
                                    width: 40.0.wp,
                                    height: 5.0.hp,
                                    child: ThemeText(
                                        theText: "Prendre Rdv",
                                        thefontSize: 12.0.sp,
                                        theColor: white,
                                        theFontFamily: fontBold),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(6.0.sp),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color.fromARGB(
                                                255, 185, 126, 70)),
                                        BoxShadow(
                                            color: crem,
                                            spreadRadius: -1.5,
                                            offset: Offset(-3, -3),
                                            blurRadius: 0.5),
                                      ],
                                    ),
                                  ),
                                  theAction: shopsController.book,
                                  theLoadingStatus: shopsController
                                      .isLoadingBookAppointment.value),
                              SizedBox(height: 10.0.hp)
                            ],
                          )
                            ],
                          )
                          ,
                        ]),
                      )),
              ],
            ),
          ),
        ),
        bottomNavigationBar: ThemeNavigationBottomBar());
  }
}
