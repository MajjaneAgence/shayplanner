import 'package:shayplanner/components/forgot_password/forgot_password_screen.dart';
import 'package:shayplanner/components/home/home_screen.dart';
import 'package:shayplanner/components/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shayplanner/components/shops/shops_screen.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController usernameEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  RxBool isLoading = false.obs;

  @override
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

  validatePassword(String password) {
    if (password.isNotEmpty) {
      return null;
    } else {
      return "tr_enter_password".tr;
    }
  }

  connect() async {
    isLoading.value = true;
    isLoading.refresh();
    await Future.delayed(const Duration(seconds: 3));
    isLoading.value = false;
    isLoading.refresh();
    //Get.toNamed(HomeScreen.routename);
    Get.toNamed(ShopsScreen.routename);

  }

  goToRestPassword() {
    Get.toNamed(ForgotPasswordScreen.routename);
  }

  goToRegister() {
    Get.toNamed(RegisterScreen.routename);
  }
}
