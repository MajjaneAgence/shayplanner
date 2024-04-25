import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
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
import 'package:shayplanner/components/salons/salons_screen.dart';
import 'package:shayplanner/components/take_appointement/take_appointement_controller.dart';
import 'package:shayplanner/components/take_appointement/take_appointement_screen.dart';
import 'package:shayplanner/theme/theme_snackbar.dart';
import 'package:http/http.dart' as http;

class MapController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();

  TextEditingController usernameEditingController = TextEditingController();
  TextEditingController keywordEditingController = TextEditingController();
  bool isLoading = false;
  LoginService loginService = LoginService();
  bool isChecked = false;
  bool isObscure = true;
   int currentLoginPage=0;
  String previousRoute = "";
  @override
  void onInit() async {
    super.onInit();
    previousRoute = Get.previousRoute;
    print(previousRoute);
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




  goToRestPassword() {
    Get.toNamed(ForgotPasswordScreen.routename);
  }

  goToRegister() {
    Get.toNamed(RegisterScreen.routename);
  }

  loginWithGoogle() async {
     SharedPreferences preferences = await SharedPreferences.getInstance();
    //Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      await GoogleSignIn().signOut();
    } else {
      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

          print(googleAuth.accessToken);
    }
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

  // loginWithFacebook() async{

  //       // Trigger the sign-in flow
  //   final LoginResult loginResult = await FacebookAuth.instance.login();
  //   // Create a credential from the access token
  //   final OAuthCredential facebookAuthCredential =
  //       FacebookAuthProvider.credential(loginResult.accessToken!.token);

  //   // Once signed in, return the UserCredential
  //   //check if firebase user is already created with different provider
  //   // UserCredential userCredential =
  //   await FirebaseAuth.instance
  //       .signInWithCredential(facebookAuthCredential)
  //       .then((value) async {
  //     var graphResponse = await http.get(Uri.parse(
  //         'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${loginResult.accessToken!.token}'));
  // });
  // }

  goToPasswordScreen() {
    currentLoginPage=1;
    update();
  }

  changeCheckbox(value) {
    isChecked = !value;
    update();
  }

  togglePasswordVisibilty(bool visibilty) {
    isObscure = !visibilty;
    update();
  }

  gotohome() {
    Get.toNamed(HomeScreen.routename);
  }

  continueLoggedOut() {
    Get.offAndToNamed(HomeScreen.routename);
  }
}
