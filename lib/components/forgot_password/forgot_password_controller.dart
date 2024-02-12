import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController phoneEditingController = TextEditingController();
  RxString forgotPasswordMethod = "email".obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await Future.delayed(const Duration(seconds: 3));
    print("hello");
  }

  validateEmail(String email) {
    if (GetUtils.isEmail(email)) {
      return null;
    } else {
      return "tr_enter_valid_email_address".tr;
    }
  }

  validatePhone(String password) {
    if (password.isNotEmpty) {
      return null;
    } else {
      return "tr_enter_password".tr;
    }
  }

  toggleResetPasswordMethod(String method) {
    forgotPasswordMethod.value = method;
    forgotPasswordMethod.refresh();
  }

  sendVerificationCode() async {
    isLoading.value = true;
    isLoading.refresh();
    await Future.delayed(const Duration(seconds: 3));
    isLoading.value = false;
    isLoading.refresh();
  }
}
