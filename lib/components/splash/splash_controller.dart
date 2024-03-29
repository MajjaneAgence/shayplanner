import 'package:shayplanner/components/home/home_screen.dart';
import 'package:shayplanner/components/introduction/introduction_screen.dart';
import 'package:shayplanner/components/login/login_screen.dart';
import 'package:get/get.dart';
import 'package:shayplanner/components/register/register_screen.dart';

class SplashController extends GetxController{

  @override
  void onInit()async{
    super.onInit();
    await Future.delayed(const Duration(seconds: 3));
    //Get.to(LoginScreen());
    Get.offAllNamed(IntroductionScreen.routename);
  }

}