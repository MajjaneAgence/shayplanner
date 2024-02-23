import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:shayplanner/components/home/home_screen.dart';
import 'package:shayplanner/components/login/login_screen.dart';

class IntroductionController extends GetxController {
  // Data properties (if any)
  RxBool isLoading = false.obs;
  RxString? errorMessage;

  // Functions for interaction (e.g., button presses, fetching data)
  void bookAppointement() async {
    FlutterSecureStorage storage = FlutterSecureStorage();

    // String? token = await storage.read(key: 'token');
    // if (token != null) {
      Get.toNamed(LoginScreenForEmailAndSocial.routename);
    // } else {
    //   Get.toNamed(HomeScreen.routename);
    // }
  }

  void onButton2Pressed() async {
    print('hello');
  }

  // Additional functions and logic as needed
}
