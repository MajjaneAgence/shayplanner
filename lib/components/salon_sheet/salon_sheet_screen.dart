import 'package:shayplanner/components/introduction/introduction_controller.dart';
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
    final IntroductionController introductionController =
        Get.put(IntroductionController());

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
            Container(
              height: 82.0.hp,
              padding: EdgeInsets.only(top: 20.0.hp),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/salon_sheet.png"),
                  fit: BoxFit.fitWidth,
                  repeat: ImageRepeat.repeat
                ),
              ),
          child: Container(
  width: 100.0.wp,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(16.0), // Adjust the radius as needed
      topRight: Radius.circular(20.0), // Adjust the radius as needed
    ),
    color: Colors.blue, // Example background color
  ),
  child: Center(
    child: Text(
      'Hello, World!',
      style: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
      ),
    ),
  ),
),
            ),
          ]),
        ),
      ),
    );
  }
}
