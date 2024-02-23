import 'dart:ui';

import 'package:shayplanner/components/home/home_loading/categories_loading.dart';
import 'package:shayplanner/components/setting/setting_controller.dart';
import 'package:shayplanner/theme/theme_app_bar.dart';
import 'package:shayplanner/theme/theme_button.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/theme/theme_grad_container.dart';
import 'package:shayplanner/theme/theme_input.dart';
import 'package:shayplanner/theme/theme_text.dart';
import 'package:shayplanner/tools/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingScreen extends StatelessWidget {

  const SettingScreen({super.key});

  static const routename = '/setting';

  @override
  Widget build(BuildContext context) {
    final SettingController settingController = Get.put(SettingController());


    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar:ThemeAppBar(),
      body: Container(
        color: white,
        width: 100.0.wp,
        height: 90.0.hp,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                color: Color(0xFFE8DEC7),
                width: 100.0.wp,
                height:90.0.hp,
                padding: EdgeInsets.only(
                  top: 5.0.hp,
                  bottom: 5.0.hp,
                  right: 2.0.wp,
                  left: 4.0.wp,
                ),
                // height: 14.0.hp,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomPaint(
                      // size: Size(4.0.hp * 2, 4.0 * 2),
                      painter: CirclePainter(
                        percentage: 0.85,
                        // backgroundColor: Colors.red,
                        progressColor: Color(0xFFFFDBBA),
                      ),
                      child: Container(
                        width: 8.0.hp,
                        height: 8.0.hp,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/images/user_none.png",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 3.5.wp,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ThemeText(
                          theText: "Nom",
                          thefontSize: 13.0.sp,
                          theColor: black,
                          theFontWeight: FontWeight.w700,
                        ),
                        SizedBox(height: 1.0.hp,),
                        ThemeText(
                          theText: "Prénom",
                          thefontSize: 13.0.sp,
                          theColor: black,
                          theFontWeight: FontWeight.w700,
                        ),
                      ],
                    ),
                    SizedBox(width: 2.0.wp,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ThemeText(
                          theText: "+212-600-000000",
                          thefontSize: 11.0.sp,
                          theColor: black,
                          theFontWeight: FontWeight.w700,
                        ),
                        SizedBox(height: 1.7.hp,),
                        ThemeText(
                          theText: "E-mail@gmail.com",
                          thefontSize: 11.0.sp,
                          theColor: black,
                          theFontWeight: FontWeight.w700,
                        ),
                      ],
                    ),
                    SizedBox(width: 3.0.wp,),
                    ThemeGradContainer(
                      theWith: 6.0.hp,
                      theHeight: 4.0.hp,
                      thePadding: 4.0.sp,
                      theLinearGradient: yellowFadeGradient,
                      theContent: SvgPicture.asset(
                        "assets/icons/edit.svg",
                        width: 4.0.hp,
                        height: 4.0.hp,
                      )
                    ),
                  ],
                ),
              ),

              Positioned(
                top: 20.0.hp,
                child:   Container(
                  width: 100.0.wp,
                  height: 70.0.hp,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                    color: white,
                  ),
                  padding: EdgeInsets.only(
                    top: 5.0.hp,
                    bottom: 5.0.hp,
                    right: 7.0.wp,
                    left: 6.0.wp,
                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () => settingController.gofavorite,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset("assets/images/heart.png",width: 4.0.hp,height: 4.0.hp,),
                                SizedBox(width: 3.0.wp,),
                                ThemeText(
                                  theText: "Vos favoris",
                                  thefontSize: 13.0.sp,
                                  theColor: black,
                                  theFontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                            Container(
                              child: SvgPicture.asset("assets/icons/right-arrow.svg",width: 3.0.hp,height: 3.0.hp,),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.0.hp,),
                      GestureDetector(
                        onTap: () => settingController.gofavorite,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset("assets/images/credit-card.png",width: 4.0.hp,height: 4.0.hp,),
                                SizedBox(width: 3.0.wp,),
                                ThemeText(
                                  theText: "Historiques des réservations",
                                  thefontSize: 13.0.sp,
                                  theColor: black,
                                  theFontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                            Container(
                              child: SvgPicture.asset("assets/icons/right-arrow.svg",width: 3.0.hp,height: 3.0.hp,),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.0.hp,),
                      GestureDetector(
                        onTap: () => settingController.gofavorite,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset("assets/images/home 1.png",width: 4.0.hp,height: 4.0.hp,),
                                SizedBox(width: 3.0.wp,),
                                ThemeText(
                                  theText: "Gérer l'adresse",
                                  thefontSize: 13.0.sp,
                                  theColor: black,
                                  theFontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                            Container(
                              child: SvgPicture.asset("assets/icons/right-arrow.svg",width: 3.0.hp,height: 3.0.hp,),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.0.hp,),
                      GestureDetector(
                        onTap: () => settingController.gofavorite,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset("assets/icons/notification.svg",width: 4.0.hp,height: 4.0.hp,),
                                SizedBox(width: 3.0.wp,),
                                ThemeText(
                                  theText: "Notifications",
                                  thefontSize: 13.0.sp,
                                  theColor: black,
                                  theFontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                            Container(
                              child: SvgPicture.asset("assets/icons/right-arrow.svg",width: 3.0.hp,height: 3.0.hp,),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.0.hp,),
                      GestureDetector(
                        onTap: () => settingController.gofavorite,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset("assets/images/save.png",width: 4.0.hp,height: 4.0.hp,),
                                SizedBox(width: 3.0.wp,),
                                ThemeText(
                                  theText: "Mes salons enregistrés",
                                  thefontSize: 13.0.sp,
                                  theColor: black,
                                  theFontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                            Container(
                              child: SvgPicture.asset("assets/icons/right-arrow.svg",width: 3.0.hp,height: 3.0.hp,),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.0.hp,),
                      GestureDetector(
                        onTap: () => settingController.gofavorite,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset("assets/images/exlamation.png",width: 4.0.hp,height: 4.0.hp,),
                                SizedBox(width: 3.0.wp,),
                                ThemeText(
                                  theText: "à propos de Planner",
                                  thefontSize: 13.0.sp,
                                  theColor: black,
                                  theFontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                            Container(
                              child: SvgPicture.asset("assets/icons/right-arrow.svg",width: 3.0.hp,height: 3.0.hp,),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}