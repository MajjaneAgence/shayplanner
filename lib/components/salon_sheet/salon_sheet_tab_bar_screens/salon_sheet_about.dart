import 'package:flutter_svg/flutter_svg.dart';
import 'package:shayplanner/components/salon_sheet/salon_sheet_controller.dart';
import 'package:shayplanner/theme/theme_app_bar.dart';
import 'package:shayplanner/theme/theme_button.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/theme/theme_grad_container.dart';
import 'package:shayplanner/theme/theme_text.dart';
import 'package:shayplanner/tools/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SalonSheetAbout extends StatelessWidget {
  const SalonSheetAbout({super.key});

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
          RichText(
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            text: TextSpan(
              children: [
                TextSpan(text: salonSheetController.salonDesc, style: TextStyle(fontSize: 12.0.sp, color:black)),
                WidgetSpan(child: Text("hhhh"))
              ],
            ),
          ),
          Obx(() {
            return salonSheetController.salonDesc.length > 50
                ? TextButton(
                    onPressed: salonSheetController.toggleExpanded,
                    child: Text(
                      salonSheetController.isExpanded.value
                          ? 'Show Less'
                          : 'Show More',
                    ),
                  )
                : Container();
          }),
        ]),
      ),
    );
  }
}
