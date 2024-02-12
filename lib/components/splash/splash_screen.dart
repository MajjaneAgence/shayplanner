import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shayplanner/components/splash/splash_controller.dart';

class SplashScreen extends StatelessWidget{
   SplashScreen({super.key});
  SplashController splashController = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  Center(
        child:Text("splash screen place you logo her")
       )
    );
  }

  
}