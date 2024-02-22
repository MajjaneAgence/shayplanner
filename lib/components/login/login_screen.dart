import 'dart:ffi';

import 'package:flutter_svg/svg.dart';
import 'package:shayplanner/components/introduction/introduction_screen.dart';
import 'package:shayplanner/theme/theme_app_bar.dart';
import 'package:shayplanner/theme/theme_button.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/theme/theme_input.dart';
import 'package:shayplanner/theme/theme_text.dart';
import 'package:shayplanner/tools/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shayplanner/components/login/login_controller.dart';

class LoginScreenForEmailAndSocial extends StatelessWidget {
  LoginScreenForEmailAndSocial({
    Key? key,
  }) : super(key: key);
  final LoginController loginController = Get.put(LoginController());
  static const routename = '/login-email-and-social';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: ThemeAppBar(),
      body: Container(
        width: Get.width,
        height: 90.0.hp,
        color: biege,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 4.0.hp),
              Container(
                alignment: Alignment.center,
                width: 100.0.wp,
                height: 4.0.hp,
                child: ThemeText(
                    theText: "tr_already_have_an_account".tr,
                    theFontFamily: "Montserrat-regular",
                    theFontWeight: FontWeight.bold,
                    thefontSize: 17.0.sp,
                    theColor: black),
              ),
              SizedBox(height: 5.0.hp),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0.wp),
                child: ThemeButton(
                    theContent: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 5.0.wp, vertical: 1.0.hp),
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(2.0.wp),
                        border: Border.all(
                          color: brown,
                          width: 1,
                        ),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                                "assets/icons/social_media/google.svg",
                                width: 8.0.wp,
                                height: 8.0.wp),
                            SizedBox(width: 5.0.wp),
                            ThemeText(
                                theText: "tr_continue_with_google".tr,
                                thefontSize: 12.0.sp,
                                theFontWeight: FontWeight.bold,
                                theColor: black)
                          ]),
                    ),
                    theAction: loginController.loginWithGoogle,
                    theLoadingStatus: loginController.isLoading.value),
              ),
              SizedBox(height: 2.0.hp),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0.wp),
                child: ThemeButton(
                    theContent: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 5.0.wp, vertical: 1.0.hp),
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(2.0.wp),
                        border: Border.all(
                          color: brown,
                          width: 1,
                        ),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                                "assets/icons/social_media/apple.svg",
                                width: 8.0.wp,
                                height: 8.0.wp),
                            SizedBox(width: 5.0.wp),
                            ThemeText(
                                theText: "tr_continue_with_apple".tr,
                                thefontSize: 12.0.sp,
                                theFontWeight: FontWeight.bold,
                                theColor: black)
                          ]),
                    ),
                    theAction: loginController.loginWithApple,
                    theLoadingStatus: loginController.isLoading.value),
              ),
              SizedBox(height: 2.0.hp),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0.wp),
                child: ThemeButton(
                    theContent: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 5.0.wp, vertical: 1.0.hp),
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(2.0.wp),
                        border: Border.all(
                          color: brown,
                          width: 1,
                        ),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                                "assets/icons/social_media/facebook.svg",
                                width: 8.0.wp,
                                height: 8.0.wp),
                            SizedBox(width: 5.0.wp),
                            ThemeText(
                                theText: "tr_continue_with_facebook".tr,
                                thefontSize: 12.0.sp,
                                theFontWeight: FontWeight.bold,
                                theColor: black)
                          ]),
                    ),
                    theAction: loginController.loginWithFacebook,
                    theLoadingStatus: loginController.isLoading.value),
              ),
              SizedBox(height: 3.0.hp),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 4.0.wp),
                margin:
                    EdgeInsets.symmetric(horizontal: 4.0.wp, vertical: 1.0.hp),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Divider(
                          color:
                              grey, // You can customize the color of the line here
                          thickness:
                              1, // You can adjust the thickness of the line here
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  5.0.wp), // Adjust the padding as needed
                          child: ThemeText(
                            theText: "tr_or".tr,
                            thefontSize: 12.0.sp,
                            theColor: grey,
                            theFontWeight: FontWeight.bold,
                          )),
                      Expanded(
                        child: Divider(
                          color:
                              grey, // You can customize the color of the line here
                          thickness:
                              1, // You can adjust the thickness of the line here
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Form(
                key: loginController.formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(horizontal: 6.0.wp),
                          margin: EdgeInsets.only(bottom: 1.0.hp),
                          child: ThemeText(
                              theText: "tr_email".tr,
                              thefontSize: 12.0.sp,
                              theColor: black)),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 6.0.wp),
                        margin: EdgeInsets.only(bottom: 3.0.hp),
                        child: ThemeInput(
                            theLabelText: "tr_email".tr,
                            theHintText: "tr_email".tr,
                            theTextEditingController:
                                loginController.usernameEditingController,
                            theValidation: loginController.validateUsername,
                            theContentPadding: 5.0.sp,
                            theFloatingLabelBehaviour:
                                FloatingLabelBehavior.never),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.0.wp),
                        child: ThemeButton(
                            theContent: Container(
                              alignment: Alignment.center,
                              width: 60.0.wp,
                              height: 5.0.hp,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5.0.wp, vertical: 1.0.hp),
                              decoration: BoxDecoration(
                                color: grey,
                                borderRadius: BorderRadius.circular(2.0.wp),
                              ),
                              child: ThemeText(
                                  theText: "tr_continue".tr,
                                  thefontSize: 12.0.sp,
                                  theFontWeight: FontWeight.bold,
                                  theColor: white),
                            ),
                            theFormKey: loginController.formKey,
                            theAction: loginController.goToPasswordScreen,
                            theLoadingStatus: loginController.isLoading.value),
                      ),
                      SizedBox(height: 2.0.hp),
                      Container(
                        alignment: Alignment.center,
                        width: 100.0.wp,
                        height: 4.0.hp,
                        child: ThemeText(
                            theText: "tr_new_on_planner".tr,
                            theFontFamily: "Montserrat-regular",
                            theFontWeight: FontWeight.bold,
                            thefontSize: 12.0.sp,
                            theColor: black),
                      ),
                      Container(
                        width: 30.0.wp,
                        child: TextButton(
                          onPressed: () {
                          },
                          child: ThemeText(theText: "tr_register".tr, thefontSize: 11.0.sp, theColor: Colors.orange,theTextDecoration: TextDecoration.underline,)
                        ),
                      ),
                      SizedBox(height: 2.0.hp),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.0.wp),
                        child: ThemeButton(
                            theContent: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5.0.wp, vertical: 1.0.hp),
                                decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(2.0.wp),
                                  border: Border.all(
                                    color: brown,
                                    width: 1,
                                  ),
                                ),
                                child: ThemeText(
                                    theText:
                                        "tr_continue_without_registration".tr,
                                    thefontSize: 12.0.sp,
                                    theFontWeight: FontWeight.bold,
                                    theColor: black)),
                            theAction: loginController.loginWithFacebook,
                            theLoadingStatus: loginController.isLoading.value),
                      ),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LoginScreenForPassword extends StatelessWidget {
  LoginScreenForPassword({
    Key? key,
  }) : super(key: key);
  final LoginController loginController = Get.put(LoginController());
  static const routename = '/login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         backgroundColor: white,
      appBar:ThemeAppBar(),
      body: Container(
        color: biege,
        padding: EdgeInsets.symmetric(horizontal: 8.0.wp),
        width: Get.width,
        height: 90.0.hp,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10.0.hp),
              Form(
                key: loginController.formKey2,
                child: Column(children: [
                  SizedBox(height: 2.0.hp),
                  ThemeInput(
                      theLabelText: "tr_password".tr,
                      theHintText: "tr_password".tr,
                      theTextEditingController:
                          loginController.passwordEditingController,
                      theValidation: loginController.validatePassword,
                      theContentPadding: 5.0.sp,
                      theTextVisibilty: true,),
                  SizedBox(height: 2.0.hp),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        loginController.goToRestPassword();
                      },
                      child: Text(
                        "tr_forgot_password".tr,
                      ),
                    ),
                  ),
                  SizedBox(height: 2.0.hp),
                  Obx(
                    () => ThemeButton(
                      theContent: Text("tr_connect".tr),
                      theAction: loginController.connect,
                      theFormKey: loginController.formKey2,
                      theLoadingStatus: loginController.isLoading.value,
                    ),
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
