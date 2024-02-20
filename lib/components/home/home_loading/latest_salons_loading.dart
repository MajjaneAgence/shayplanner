import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/theme/theme_grad_container.dart';
import 'package:shayplanner/tools/extension.dart';
import 'package:shimmer/shimmer.dart';

class LatestSalonsLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return   Container(
                height: 40.0.hp,
                margin: EdgeInsets.symmetric(horizontal: 8.0.sp),
                child: ListView.builder(
                    itemCount: 5, // Adjust the count based on your needs
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Container(
                            margin:
                                EdgeInsets.only(right: 4.0.wp, bottom: 1.0.hp),
                            decoration: BoxDecoration(
                                boxShadow: themeBoxShadowCard,
                                borderRadius: BorderRadius.circular(25)),
                            child: Column(children: [
                              Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  height: 25.0.hp,
                                  width: 87.0.wp,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(18.0.sp),
                                        topRight: Radius.circular(18.0.sp)),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        "assets/images/model_on_mirror.png",
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  height: 5.0.hp,
                                  width: 87.0.wp,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 9.0.sp),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          width: 30.0.wp,
                                          height: 8.0.sp,
                                          color: Colors.black),
                                      ThemeGradContainer(
                                          theWith: 6.0.hp,
                                          theHeight: 4.0.hp,
                                          thePadding: 4.0.sp,
                                          theLinearGradient: yellowFadeGradient,
                                          theContent: SvgPicture.asset(
                                            "assets/icons/arrow_right.svg",
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                              Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  width: 87.0.wp,
                                  height: 4.0.hp,
                                  padding: EdgeInsets.only(
                                      left: 9.0.sp,
                                      right: 15.0.wp,
                                      top: 1.2.hp,
                                      bottom: 1.2.hp),
                                  child: Container(
                                    width: 50.0.wp,
                                    height: 1.0.hp,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                    width: 87.0.wp,
                                    height: 4.0.hp,
                                    padding: EdgeInsets.only(
                                        left: 9.0.sp,
                                        right: 25.0.wp,
                                        top: 1.2.hp,
                                        bottom: 1.2.hp),
                                    child: Container(
                                      width: 50.0.wp,
                                      height: 1.0.hp,
                                      color: Colors.black,
                                    )),
                              ),
                              SizedBox(height: 1.0.hp),
                            ]),
                          ),
                        ],
                      );
                    }),
              );
  }
  
}