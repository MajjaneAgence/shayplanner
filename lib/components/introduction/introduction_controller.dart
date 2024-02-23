import 'package:get/get.dart';
import 'package:shayplanner/components/home/home_screen.dart';
import 'package:shayplanner/components/login/login_screen.dart';
import 'package:shayplanner/components/rating_app/rating_app_screen.dart';
import 'package:shayplanner/components/rating_salon/rating_salon_screen.dart';
import 'package:shayplanner/components/setting/setting_screen.dart';

class IntroductionController extends GetxController {
  // Data properties (if any)
  RxBool isLoading = false.obs;
  RxString? errorMessage;

  // Functions for interaction (e.g., button presses, fetching data)
  void bookAppointement() async {
    Get.toNamed(LoginScreenForEmailAndSocial.routename);
  }

  void onButton2Pressed() async {
    Get.toNamed(SettingScreen.routename);
  }

  // Additional functions and logic as needed
}
