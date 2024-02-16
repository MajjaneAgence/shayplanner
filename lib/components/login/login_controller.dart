import 'dart:convert';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shayplanner/components/api/api_helper.dart';
import 'package:shayplanner/components/forgot_password/forgot_password_screen.dart';
import 'package:shayplanner/components/home/home_screen.dart';
import 'package:shayplanner/components/login/login_service.dart';
import 'package:shayplanner/components/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shayplanner/components/shops/shops_screen.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController usernameEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  RxBool isLoading = false.obs;
  LoginService loginService = LoginService();

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

  connect() {
    const FlutterSecureStorage secureStorage = FlutterSecureStorage();
    LoginService()
        .apiLogin(
            usernameEditingController.text, passwordEditingController.text)
        .then((value) async {
      var body = jsonDecode(value.body);
      print(body);
      if (body["success"]) {
        await secureStorage.write(
            key: "token", value: body["data"]['api_token']);
        print(await secureStorage.read(key: "token"));
      } else {
        // final snackBar = SnackBar(
        //           /// need to set following properties for best effect of awesome_snackbar_content
        //           elevation: 0,
        //           behavior: SnackBarBehavior.floating,
        //           backgroundColor: Colors.transparent,
        //           content: AwesomeSnackbarContent(
        //             title: 'On Snap!',
        //             message:
        //                 'This is an example error message that will be shown in the body of snackbar!',

        //             /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
        //             contentType: ContentType.failure,
        //           ),
        //         );

        //         ScaffoldMessenger.of(context)
        //           ..hideCurrentSnackBar()
        //           ..showSnackBar(snackBar);
      }
    });
  }

  goToRestPassword() {
    Get.toNamed(ForgotPasswordScreen.routename);
  }

  goToRegister() {
    Get.toNamed(RegisterScreen.routename);
  }
}
