import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:shayplanner/components/home/home_screen.dart';
import 'package:shayplanner/components/login/login_screen.dart';
import 'package:shayplanner/components/rating_app/rating_app_screen.dart';
import 'package:shayplanner/components/rating_salon/rating_salon_screen.dart';

class SalonSheetController extends GetxController {
  // Data properties (if any)
  RxBool isLoading = false.obs;
  RxString? errorMessage;
 List<String> salonImages = [
    'assets/images/salon_sheet.png',
    'assets/images/salon_sheet.png',
    'assets/images/model_on_mirror.png',
    'assets/images/salon_sheet.png',
    'assets/images/salon_sheet.png',
  ];
CarouselController carouselController = CarouselController();
RxInt currentIndex = 0.obs;
var isExpanded = false.obs;
  void toggleExpanded() {
    isExpanded.value = !isExpanded.value;
  }
  String salonDesc = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. \nUt enim ad minim veniam, quis nostrud adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat";
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
    Get.toNamed(RatingAppScreen.routename);
  }

  doSomething(){
    
  }

}
