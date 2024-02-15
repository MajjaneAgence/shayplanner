import 'package:get/get.dart';
import 'package:shayplanner/components/home_page/home_page_screen.dart';
import 'package:shayplanner/components/login/login_screen.dart';
import 'package:shayplanner/components/shops/shops_screen.dart';

class IntroductionController extends GetxController {
  // Data properties (if any)
  RxBool isLoading = false.obs;
  RxString? errorMessage;

  // Functions for interaction (e.g., button presses, fetching data)
  void bookAppointement() async {
    Get.toNamed(ShopsScreen.routename);
  }

  void onButton2Pressed() async {
    Get.toNamed(HomePageScreen.routename);
  }

  // Additional functions and logic as needed
}
