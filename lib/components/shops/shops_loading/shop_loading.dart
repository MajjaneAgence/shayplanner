import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shayplanner/components/home/home_screen.dart';
import 'package:shayplanner/components/shops/shops_controller.dart';
import 'package:shayplanner/components/shops/shops_screen.dart';
import 'package:shayplanner/theme/theme_button.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/theme/theme_grad_container.dart';
import 'package:shayplanner/theme/theme_text.dart';
import 'package:shayplanner/tools/extension.dart';
import 'package:shimmer/shimmer.dart';


class ShopsLoading extends StatelessWidget {
  ShopsController shopsController = Get.put(ShopsController());

  @override
  Widget build(BuildContext context) {
      return              Container(
                height: 62.0.hp,
                child: ListView.builder(
                    itemCount: 5, // Adjust the count based on your needs
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 1.0.wp),
                            decoration: BoxDecoration(
                                boxShadow: themeBoxShadowCard,
                                borderRadius: BorderRadius.circular(25)),
                            child: Column(children: [
                              Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  height: 20.0.hp,
                                  width: 92.0.wp,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10.0.sp),
                                        topRight: Radius.circular(10.0.sp)),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        "assets/images/model_on_mirror.png",
                                      ),
                                      fit: BoxFit.cover,
                                    ),
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
                                          Shimmer.fromColors(
                                            baseColor: Colors.grey[300]!,
                                            highlightColor: Colors.grey[100]!,
                                            child: Container(
                                              width: 55.0.wp,
                                              height: 5.0.hp,
                                              padding: EdgeInsets.only(
                                                  top: 1.5.hp,
                                                  bottom: 1.5.hp,
                                                  right: 10.0.wp),
                                              child: Container(
                                                width: 45.0.wp,
                                                height: 2.0.hp,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          Shimmer.fromColors(
                                            baseColor: Colors.grey[300]!,
                                            highlightColor: Colors.grey[100]!,
                                            child: Container(
                                                width: 50.0.wp,
                                                //color: Colors.white,
                                                height: 2.0.hp,
                                                padding: EdgeInsets.only(
                                                    top: 0.5.hp,
                                                    bottom: 0.5.hp,
                                                    right: 10.0.wp),
                                                child: Container(
                                                  width: 45.0.wp,
                                                  height: 1.0.hp,
                                                  color: Colors.white,
                                                )),
                                          ),
                                          Shimmer.fromColors(
                                            baseColor: Colors.grey[300]!,
                                            highlightColor: Colors.grey[100]!,
                                            child: Container(
                                                width: 50.0.wp,
                                                //  color: Colors.white,
                                                height: 4.0.hp,
                                                padding: EdgeInsets.only(
                                                    top: 1.5.hp,
                                                    bottom: 1.5.hp,
                                                    right: 10.0.wp),
                                                child: Container(
                                                  width: 45.0.wp,
                                                  height: 1.0.hp,
                                                  color: Colors.white,
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Shimmer.fromColors(
                                      baseColor: Colors.grey[300]!,
                                      highlightColor: Colors.grey[100]!,
                                      child: Container(
                                        width: 32.0.wp,
                                        height: 11.0.hp,
                                        child: InkWell(
                                          onTap: () =>
                                              shopsController.goToSalonSheet,
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
                                                  theFontWeight:
                                                      FontWeight.bold,
                                                  theFontFamily:
                                                      "Montserrat-Bold",
                                                ),
                                              )),
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
                                padding:
                                    EdgeInsets.symmetric(horizontal: 3.0.wp),
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
                                            child: Shimmer.fromColors(
                                                baseColor: Colors.grey[300]!,
                                                highlightColor:
                                                    Colors.grey[100]!,
                                                child: ListView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    children: shopsController
                                                        .buildDaysList())),
                                          ),
                                        ],
                                      ),
                                    ),
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
                                            child: Shimmer.fromColors(
                                                baseColor: Colors.grey[300]!,
                                                highlightColor:
                                                    Colors.grey[100]!,
                                                child: ListView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    children: shopsController
                                                        .buildDaysList())),
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
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: ThemeButton(
                                theContent: ThemeGradContainer(
                                  theWith: 40.0.wp,
                                  theHeight: 5.0.hp,
                                  theLinearGradient: greyYellowLinearGradient,
                                ),
                                theAction: shopsController.book,
                                theLoadingStatus:
                                    shopsController.isLoadingBookAppointment.value),
                          ),
                          SizedBox(height: 4.0.hp)
                        ],
                      );
                    }),
              );
  }
  
}