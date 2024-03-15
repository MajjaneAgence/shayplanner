import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shayplanner/components/forgot_password/forgot_password_screen.dart';
import 'package:shayplanner/components/home/home_screen.dart';
import 'package:shayplanner/components/login/login_screen.dart';
import 'package:shayplanner/components/login/login_service.dart';
import 'package:shayplanner/components/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shayplanner/theme/theme_snackbar.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();

  TextEditingController usernameEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  RxBool isLoading = false.obs;
  LoginService loginService = LoginService();
  RxBool isChecked = false.obs;
  RxBool isObscure = true.obs;

  @override
  void onInit() async {
    super.onInit();
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

  connect() {
    isLoading.value = true;
    isLoading.refresh();
    const FlutterSecureStorage secureStorage = FlutterSecureStorage();
    LoginService()
        .apiLogin(
            usernameEditingController.text, passwordEditingController.text)
        .then((value) async {
      var body = jsonDecode(value.body);
      isLoading.value = false;
      isLoading.refresh();
      print(body);
      if (body["success"]) {
        await secureStorage.write(
            key: "token", value: body["data"]['token']);
        print(await secureStorage.read(key: "token"));
        Get.toNamed(HomeScreen.routename);
      } else {
        themeSnackBar(body["message"]);
      }
    });
  }

  goToRestPassword() {
    Get.toNamed(ForgotPasswordScreen.routename);
  }

  goToRegister() {
    Get.toNamed(RegisterScreen.routename);
  }

  loginWithGoogle() {}

  loginWithApple() {}

  loginWithFacebook() {}

  goToPasswordScreen() {
    Get.toNamed(LoginScreenForPassword.routename);
  }

  changeCheckbox(value) {
    print(isChecked.value);
    isChecked.value = !value;
    isChecked.refresh();
        print(isChecked.value);

  }

  togglePasswordVisibilty(bool visibilty) {
    print(isObscure.value);
    isObscure.value = !visibilty;
    isObscure.refresh();
        print(isObscure.value);

  }
  gotohome(){
    Get.toNamed(HomeScreen.routename);
  }
}
