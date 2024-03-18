import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shayplanner/components/splash/splash_controller.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/theme/theme_text.dart';
import 'package:shayplanner/tools/extension.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  SplashController splashController = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Center(
        child: Image.asset('assets/icons/splash/planner.gif',
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.width * 0.8),
      ),
    );
  }
}
