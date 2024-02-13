import 'package:get/get.dart';
import 'package:shayplanner/components/login/login_screen.dart';

class IntroductionController extends GetxController {
  // Data properties (if any)
  RxBool isLoading = false.obs;
  RxString? errorMessage;

  // Functions for interaction (e.g., button presses, fetching data)
  void onButton1Pressed() async {
    Get.toNamed(LoginScreen.routename);
  }

  void onButton2Pressed() async {
    print('hello');
  }

  // Additional functions and logic as needed
}
