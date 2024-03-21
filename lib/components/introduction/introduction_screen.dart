import 'package:shayplanner/components/introduction/introduction_controller.dart';
import 'package:shayplanner/theme/theme_button.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/theme/theme_text.dart';
import 'package:shayplanner/tools/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  static const routename = '/introduction';

  @override
  Widget build(BuildContext context) {
    final IntroductionController introductionController =
        Get.put(IntroductionController());

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: Get.width,
        height: 100.0.hp,
        color: black,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20.0.hp,
              ),
              SvgPicture.asset(
                "assets/icons/app_logos/logo_introduction.svg",
                height: 80.0.wp,
                width: 80.0.wp,
              ),
              // SizedBox(
              //   height: 20.0.hp,
              // ),
              ThemeButton(
                theHeight: 8.0.hp,
                theWidth: 80.0.wp,
                theColor: darkBiege,
                theBorderRadius: 3.0.wp,
                theContent: ThemeText(
                  theText: "tr_book_appointment".tr,
                  thefontSize: 14.0.sp,
                  theColor: black,
                  theFontWeight: FontWeight.bold,
                ),
                theLoadingStatus: false,
                theAction: introductionController.bookAppointement,
              ),
              SizedBox(height: 5.0.hp),
              ThemeButton(
                theHeight: 8.0.hp,
                theWidth: 80.0.wp,
                theColor: darkBiege,
                theBorderRadius: 3.0.wp,
                theContent: ThemeText(
                  theText: "tr_professional_space".tr,
                  thefontSize: 14.0.sp,
                  theColor: black,
                  theFontWeight: FontWeight.bold,
                ),
                theLoadingStatus: false,
              ),
              SizedBox(height: 7.0.hp),
              ThemeText(
                  theText: "tr_follow_us".tr,
                  thefontSize: 13.0.sp,
                  theColor: white,
                  theFontWeight: FontWeight.bold,),
              SizedBox(height: 1.0.hp),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icons/introduction/facebook.svg",
                    height: 5.0.wp,
                    width: 5.0.wp,
                  ),
                  SizedBox(
                    width: 2.0.wp,
                  ),
                  SvgPicture.asset(
                    "assets/icons/introduction/instagram.svg",
                    height: 5.0.wp,
                    width: 5.0.wp,
                  ),
                  SizedBox(
                    width: 2.0.wp,
                  ),
                  SvgPicture.asset(
                    "assets/icons/introduction/tiktok.svg",
                    height: 5.0.wp,
                    width: 5.0.wp,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
