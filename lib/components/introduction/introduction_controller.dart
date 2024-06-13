import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:shayplanner/components/home/home_screen.dart';
import 'package:shayplanner/components/login/login_screen.dart';
import 'package:shayplanner/components/rating_app/rating_app_screen.dart';
import 'package:shayplanner/components/register/register_screen.dart';
import 'package:shayplanner/components/register/salon_infos_screen.dart';

class IntroductionController extends GetxController {
  // Data properties (if any)
  RxBool isLoading = false.obs;
  RxString? errorMessage;

  // Functions for interaction (e.g., button presses, fetching data)
  void bookAppointement() async {
    FlutterSecureStorage storage = FlutterSecureStorage();
    String? token = await storage.read(key: 'token');
    print(token);
    if (token == null) {
      Get.toNamed(LoginScreen.routename);
    } else {
      Get.toNamed(HomeScreen.routename);
    }
  }

  void proSpace() async {
    // Get.toNamed(RatingAppScreen.routename);
    Get.toNamed(RegisterScreen.routename,arguments: "pro");
  }

  // Additional functions and logic as needed
}
