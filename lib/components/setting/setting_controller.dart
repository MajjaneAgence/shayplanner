import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SettingController extends GetxController {
  // Data properties (if any)
  final formKey = GlobalKey<FormState>();
  TextEditingController shopNameEditingController = TextEditingController();
  TextEditingController ratingtextEditingController = TextEditingController();
  RxBool isLoading = false.obs;
  RxString? errorMessage;
  RxString selectedLanguage = 'Fr'.obs;

  final List<String> lanuages = [
    'Français',
    'Anglais',
  ];

  void onInit() async {
    super.onInit();
    await Future.delayed(const Duration(seconds: 3));
    print("hello");
  }

  validateUsername(String email) {
    if (GetUtils.isEmail(email)) {
      return null;
    } else {
      return "tr_enter_valid_email_address".tr;
    }
  }

  gofavorite(String email) {
    return true;
  }

  // Additional functions and logic as needed
}
