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
        height: 90.0.hp,
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
                theContent: Container(
                  alignment: Alignment.center,
                  width: 80.0.wp,
                  height: 7.0.hp,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0.sp),
                    color: darkBiege
                  ),
                  child: ThemeText(
                      theText: "tr_book_appointment".tr,
                      thefontSize: 14.0.sp,
                      theColor: black),
                ),
                theLoadingStatus: false,
                theAction: introductionController.bookAppointement,
              ),
              SizedBox(height:5.0.hp),
               ThemeButton(
                theContent: Container(
                  alignment: Alignment.center,
                  width: 80.0.wp,
                  height: 7.0.hp,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0.sp),
                    color: darkBiege
                  ),
                  child: ThemeText(
                      theText: "tr_professional_space".tr,
                      thefontSize: 14.0.sp,
                      theColor: black),
                ),
                theLoadingStatus: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
