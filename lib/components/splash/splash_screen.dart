import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shayplanner/components/splash/splash_controller.dart';

class SplashScreen extends StatelessWidget{
   SplashScreen({super.key});
  SplashController splashController = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFFFFF),
              Color(0xFFC39800),
            ],
          ),
        ),
        child: Center(
          child: Image.asset(
            'assets/images/logo.png',
            // width: 200,
            // height: 200,
          ),
        ),
      ),
    );
  }

  
}