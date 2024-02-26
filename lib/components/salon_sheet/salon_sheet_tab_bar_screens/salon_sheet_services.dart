import 'package:shayplanner/components/salon_sheet/salon_sheet_controller.dart';
import 'package:shayplanner/theme/theme_app_bar.dart';
import 'package:shayplanner/theme/theme_button.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/theme/theme_grad_container.dart';
import 'package:shayplanner/theme/theme_text.dart';
import 'package:shayplanner/tools/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SalonSheetServices extends StatelessWidget {
  const SalonSheetServices({super.key});

  @override
  Widget build(BuildContext context) {
    final SalonSheetController salonSheetController =
        Get.put(SalonSheetController());
    return Container(
      width: 100.0.wp,
      height: 100.0.hp,
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: 8.0.hp,
            width: 100.0.wp,
            padding: EdgeInsets.only(left: 10.0.wp, top: 2.0.hp),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ThemeButton(
                    theContent: Container(
                      width: 20.0.wp,
                      color: Colors.red,
                      child: ThemeText(
                          theText: "theText",
                          thefontSize: 14.0.sp,
                          theColor: darkOrange),
                    ),
                    theLoadingStatus: salonSheetController.isLoading.value),
                     ThemeButton(
                    theContent: Container(
                      width: 20.0.wp,
                      color: Colors.green,
                      child: ThemeText(
                          theText: "theText",
                          thefontSize: 14.0.sp,
                          theColor: darkOrange),
                    ),
                    theLoadingStatus: salonSheetController.isLoading.value)
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

//https://stackoverflow.com/questions/63407435/flutter-subitems-in-menu-slider
//https://pub.dev/packages/flutter_slidable