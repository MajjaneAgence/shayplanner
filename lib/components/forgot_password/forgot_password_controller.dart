import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shayplanner/components/forgot_password/set_new_password_screen.dart';
import 'package:shayplanner/components/login/login_screen.dart';

class ForgotPasswordController extends GetxController {
  final formKeyForgetPassword = GlobalKey<FormState>();
  final formKeySetNewPassword = GlobalKey<FormState>();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController phoneEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  TextEditingController confirmPasswordEditingController =
  TextEditingController();
  RxString forgotPasswordMethod = "email".obs;
  RxBool isLoadingSendVerificationCode = false.obs;
  RxBool isLoadingChnagePassword = false.obs;
  RxBool isObscurePassword = true.obs;
  RxBool isObscureConfirmation = true.obs;

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
    isLoadingSendVerificationCode.value = true;
    isLoadingSendVerificationCode.refresh();
    await Future.delayed(const Duration(seconds: 3));
    isLoadingSendVerificationCode.value = false;
    isLoadingSendVerificationCode.refresh();
    Get.toNamed(SetNewPasswordScreen.routename);
  }

  validatePassword(String password) {
    if (password.isNotEmpty) {
      return null;
    } else {
      return "tr_enter_password".tr;
    }
  }

  validatePasswordConfirmation(String passwordConfirmation) {
    if (passwordConfirmation.isEmpty) {
      return "tr_enter_password".tr;
    } else if (passwordConfirmation != passwordEditingController.text) {
      return "tr_incorrect_password_confirmation".tr;
    }
  }

  togglePasswordVisibilty(bool visibilty) {
    print(isObscurePassword.value);
    isObscurePassword.value = !visibilty;
    isObscurePassword.refresh();
    print(isObscurePassword.value);
  }

   togglePasswordConfirmationVisibilty(bool visibilty) {
    print(isObscureConfirmation.value);
    isObscureConfirmation.value = !visibilty;
    isObscureConfirmation.refresh();
    print(isObscureConfirmation.value);
  }

  changePassword()async{
   isLoadingChnagePassword.value = true;
    isLoadingChnagePassword.refresh();
    await Future.delayed(const Duration(seconds: 3));
    isLoadingChnagePassword.value = false;
    isLoadingChnagePassword.refresh();
    Get.offAllNamed(LoginScreenForEmailAndSocial.routename);
  }
}
