import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shayplanner/components/splash/splash_controller.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/theme/theme_text.dart';
import 'package:shayplanner/tools/extension.dart';

class SplashScreen extends GetView {
  SplashScreen({super.key});
  SplashController splashController = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   backgroundColor: black,
    //   body: Center(
    //     child: SizedBox(
    //       width: 60.0.wp,
    //       height: 60.0.wp,
    //       child: Image.asset('assets/icons/splash/planner.gif',
    //           width: 60.0.wp, height: 60.0.wp),
    //     ),
    //   ),
    // );
    return Scaffold(
      backgroundColor: white,
      body: Column(
        children: [ 
          ThemeText(theText: "theme text", thefontSize: 12.0.sp, theColor: black),
          Text("text"),
          SizedBox(
          width: 60.0.wp,
          height: 60.0.wp,
          child: Image.asset('assets/icons/splash/planner.gif',
              width: 60.0.wp, height: 60.0.wp),
        ),
        Container(height:100,width:50,color:Colors.red)
        ]
      ),
    );
  }
}
