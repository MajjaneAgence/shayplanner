import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  loginWithGoogle()async{
    //  SharedPreferences preferences = await SharedPreferences.getInstance();
    // //Trigger the authentication flow
    // final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // if (googleUser == null) {
    //   await GoogleSignIn().signOut();
    // } else {
    //   // Obtain the auth details from the request
    //   final GoogleSignInAuthentication googleAuth =
    //       await googleUser.authentication;

    //       print(googleAuth.accessToken);
    // }
      // Create a new credential
      // final credential = GoogleAuthProvider.credential(
      //   accessToken: googleAuth.accessToken,
      //   idToken: googleAuth.idToken,
      // );

      // // Once signed in, return the UserCredential
      // return await FirebaseAuth.instance
      //     .signInWithCredential(credential)
      //     .then((value) {
      //   userProvider
      //       .loginSocial(value.additionalUserInfo!.profile!['email'])
      //       .then((result) async {
      //     var responseDecode = jsonDecode(result.body);
      //     if (responseDecode['success'] == 1) {
      //       await flutterSecureStorage.write(
      //           key: "token", value: responseDecode['data']['customer_token']);
      //       preferences.setString("id", responseDecode['data']['customer_id']);
      //       preferences.setBool("isSocial", true);
      //       Get.offAllNamed(MainApp.routename);
      //     } else {
      //       preferences.setBool("isSocial", true);
      //       Get.toNamed(Inscription.routename, arguments: [
      //         value.additionalUserInfo!.profile!['email'],
      //         value.additionalUserInfo!.profile!['given_name'],
      //         value.additionalUserInfo!.profile!['family_name']
      //       ]);
      //     }
      //   });
      // });

      //   return value;
      // });
    }




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
