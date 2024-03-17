import 'package:flutter_svg/flutter_svg.dart';
import 'package:shayplanner/components/salon_sheet/salon_sheet_controller.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/theme/theme_text.dart';
import 'package:shayplanner/tools/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SalonSheetRating extends StatelessWidget {
  const SalonSheetRating({super.key});

  @override
  Widget build(BuildContext context) {
    final SalonSheetController salonSheetController =
        Get.put(SalonSheetController());
    return Container(
      width: 100.0.wp,
      height: 100.0.hp,
      padding: EdgeInsets.symmetric(horizontal: 3.0.wp),
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: 3.0.hp),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 80.0.wp,
                  height: 16.0.hp,
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: Row(
                      children: [
                        Container(
                          width: 30.0.wp,
                          height: 16.0.hp,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xFFFFC897), Color(0xFFD79F6C)],
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15.0.sp),
                              bottomLeft: Radius.circular(15.0.sp),
                            ),
                          ),
                          child: ThemeText(
                            theText: "4.9",
                            thefontSize: 22.0.sp,
                            theColor: white,
                            theFontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          width: 50.0.wp,
                          height: 16.0.hp,
                          decoration: BoxDecoration(
                            color: white,
                            border: const Border(
                                right: BorderSide(
                                    color: Color(0xFFF38827), width: 2),
                                left: BorderSide.none,
                                top: BorderSide(
                                    color: Color(0xFFF38827), width: 2),
                                bottom: BorderSide(
                                    color: Color(0xFFF38827), width: 2)),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15.0.sp),
                              bottomRight: Radius.circular(15.0.sp),
                            ),
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 3.0.wp),
                            child: Column(
                              crossAxisAlignment:
                                  Get.locale!.languageCode != "ar"
                                      ? CrossAxisAlignment.start
                                      : CrossAxisAlignment.end,
                              children: [
                                SizedBox(height: 1.0.hp),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                          text: "Acceuil ",
                                          style: TextStyle(
                                              fontFamily: fontThin,
                                              fontSize: 8.0.sp,
                                              color: black)),
                                      TextSpan(
                                          text: "5,0 ",
                                          style: TextStyle(
                                              fontFamily: fontRegular,
                                              fontSize: 8.0.sp,
                                              fontWeight: FontWeight.bold,
                                              color: black)),
                                      WidgetSpan(
                                        child: SvgPicture.asset(
                                          "assets/icons/star.svg",
                                          width: 12.0.sp,
                                          height: 12.0.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 0.7.hp),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Propreté ",
                                        style: TextStyle(
                                            fontFamily: fontThin,
                                            fontSize: 8.0.sp,
                                            color: black),
                                      ),
                                      TextSpan(
                                          text: "4,9 ",
                                          style: TextStyle(
                                              fontFamily: fontRegular,
                                              fontSize: 8.0.sp,
                                              fontWeight: FontWeight.bold,
                                              color: black)),
                                      WidgetSpan(
                                        child: SvgPicture.asset(
                                          "assets/icons/star.svg",
                                          width: 12.0.sp,
                                          height: 12.0.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 0.7.hp),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Cadre & Ambiance ",
                                        style: TextStyle(
                                            fontFamily: fontThin,
                                            fontSize: 8.0.sp,
                                            color: black),
                                      ),
                                      TextSpan(
                                        text: "4,9 ",
                                        style: TextStyle(
                                            fontFamily: fontRegular,
                                            fontSize: 8.0.sp,
                                            fontWeight: FontWeight.bold,
                                            color: black),
                                      ),
                                      WidgetSpan(
                                        child: SvgPicture.asset(
                                          "assets/icons/star.svg",
                                          width: 12.0.sp,
                                          height: 12.0.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 0.7.hp),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Qualité de la prestation ",
                                        style: TextStyle(
                                            fontFamily: fontThin,
                                            fontSize: 8.0.sp,
                                            color: black),
                                      ),
                                      TextSpan(
                                        text: "4,9 ",
                                        style: TextStyle(
                                            fontFamily: fontRegular,
                                            fontSize: 8.0.sp,
                                            fontWeight: FontWeight.bold,
                                            color: black),
                                      ),
                                      WidgetSpan(
                                          child: SvgPicture.asset(
                                        "assets/icons/star.svg",
                                        width: 12.0.sp,
                                        height: 12.0.sp,
                                      )),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 0.5.hp),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                          text: "317 ",
                                          style: TextStyle(
                                              fontFamily: fontRegular,
                                              fontSize: 8.0.sp,
                                              fontWeight: FontWeight.bold,
                                              color: black)),
                                      TextSpan(
                                        text: "clients ont donné leur avis",
                                        style: TextStyle(
                                            fontFamily: fontThin,
                                            fontSize: 8.0.sp,
                                            color: black),
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
                  ))
            ],
          ),
          SizedBox(height: 1.0.hp),
          Container(
            margin: EdgeInsets.only(left: 3.0.wp, bottom: 1.0.hp, top: 2.0.hp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "4,5 ",
                        style: TextStyle(
                            fontFamily: fontRegular,
                            fontSize: 12.0.sp,
                            fontWeight: FontWeight.bold,
                            color: black),
                      ),
                      WidgetSpan(
                          child: SvgPicture.asset(
                        "assets/icons/salon_sheet/star_black.svg",
                        width: 15.0.sp,
                        height: 15.0.sp,
                        color: black,
                      )),
                    ],
                  ),
                ),
                ThemeText(
                    theText:
                        "Toujours ponctuel. vous met à l'aise et son travail est parfait.",
                    thefontSize: 10.0.sp,
                    theColor: black),
                ThemeText(
                    theText: "31/01/2024",
                    thefontSize: 10.0.sp,
                    theColor: black),
              ],
            ),
          ),
          Divider(),
          Container(
            margin: EdgeInsets.only(left: 3.0.wp, bottom: 1.0.hp, top: 2.0.hp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "5.0",
                        style: TextStyle(
                            fontFamily: fontRegular,
                            fontSize: 12.0.sp,
                            fontWeight: FontWeight.bold,
                            color: black),
                      ),
                      WidgetSpan(
                          child: SvgPicture.asset(
                        "assets/icons/salon_sheet/star_black.svg",
                        width: 15.0.sp,
                        height: 15.0.sp,
                        color: black,
                      )),
                    ],
                  ),
                ),
                ThemeText(theText: "", thefontSize: 10.0.sp, theColor: black),
                ThemeText(
                    theText: "31/01/2024",
                    thefontSize: 10.0.sp,
                    theColor: black),
              ],
            ),
          ),
          Divider(),
          Container(
            margin: EdgeInsets.only(left: 3.0.wp, bottom: 1.0.hp, top: 2.0.hp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "5.0",
                        style: TextStyle(
                            fontFamily: fontRegular,
                            fontSize: 12.0.sp,
                            fontWeight: FontWeight.bold,
                            color: black),
                      ),
                      WidgetSpan(
                          child: SvgPicture.asset(
                        "assets/icons/salon_sheet/star_black.svg",
                        width: 15.0.sp,
                        height: 15.0.sp,
                        color: black,
                      )),
                    ],
                  ),
                ),
                ThemeText(
                    theText:
                        "Très bon accueil à chaque fois travail soigné.Je suis satisfaite depuis 3 ans.",
                    thefontSize: 10.0.sp,
                    theColor: black),
                ThemeText(
                    theText: "31/01/2024",
                    thefontSize: 10.0.sp,
                    theColor: black),
              ],
            ),
          ),
          Divider(),
        ]),
      ),
    );
  }
}
