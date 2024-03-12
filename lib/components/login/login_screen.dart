import 'dart:ffi';

import 'package:flutter_svg/svg.dart';
import 'package:shayplanner/components/introduction/introduction_screen.dart';
import 'package:shayplanner/components/register/register_screen.dart';
import 'package:shayplanner/theme/theme_app_bar.dart';
import 'package:shayplanner/theme/theme_button.dart';
import 'package:shayplanner/theme/theme_checkbox.dart';
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
                child: ThemeText(
                    theText: "tr_already_have_an_account".tr,
                    theFontWeight: FontWeight.bold,
                    thefontSize: 17.0.sp,
                    theColor: black),
              ),
              SizedBox(height: 5.0.hp),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0.wp),
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
                            SizedBox(width: 8.0.wp),
                            ThemeText(
                                theText: "tr_continue_with_google".tr,
                                thefontSize: 10.0.sp,
                                theFontWeight: FontWeight.bold,
                                theColor: black)
                          ]),
                    ),
                    theAction: loginController.loginWithGoogle,
                    theLoadingStatus: loginController.isLoading.value),
              ),
              SizedBox(height: 2.0.hp),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0.wp),
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
                            SizedBox(width: 8.0.wp),
                            ThemeText(
                                theText: "tr_continue_with_apple".tr,
                                thefontSize: 10.0.sp,
                                theFontWeight: FontWeight.bold,
                                theColor: black)
                          ]),
                    ),
                    theAction: loginController.loginWithApple,
                    theLoadingStatus: loginController.isLoading.value),
              ),
              SizedBox(height: 2.0.hp),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0.wp),
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
                            SizedBox(width: 8.0.wp),
                            ThemeText(
                                theText: "tr_continue_with_facebook".tr,
                                thefontSize: 10.0.sp,
                                theFontWeight: FontWeight.bold,
                                theColor: black)
                          ]),
                    ),
                    theAction: loginController.loginWithFacebook,
                    theLoadingStatus: loginController.isLoading.value),
              ),
              SizedBox(height: 3.0.hp),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.0.wp),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Divider(
                          color: Color(
                              0xFFA0A0A0), // You can customize the color of the line here
                          thickness:
                              1, // You can adjust the thickness of the line here
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
                          child: ThemeText(
                            theText: "tr_or".tr,
                            thefontSize: 12.0.sp,
                            theColor: Color(0xFFA0A0A0),
                            theFontWeight: FontWeight.bold,
                          )),
                      Expanded(
                        child: Divider(
                          color: Color(0xFFA0A0A0),
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 2.0.hp),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0.wp),
                  child: Form(
                    key: loginController.formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ThemeText(
                              theText: "tr_email_star".tr,
                              thefontSize: 12.0.sp,
                              theColor: grey),
                          ThemeInput(
                            theLabelText: "tr_email_star".tr,
                            theHintText: "tr_email_star".tr,
                            theTextEditingController:
                                loginController.usernameEditingController,
                            theValidation: loginController.validateUsername,
                            theContentPadding: 5.0.sp,
                          ),
                          SizedBox(height: 2.0.hp),
                          Center(
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
                                theLoadingStatus:
                                    loginController.isLoading.value),
                          ),
                          SizedBox(height: 2.0.hp),
                          Center(
                            child: ThemeText(
                                theText: "tr_new_on_planner".tr,
                                theFontFamily: "Montserrat-regular",
                                theFontWeight: FontWeight.bold,
                                thefontSize: 12.0.sp,
                                theColor: black),
                          ),
                          Center(
                            child: TextButton(
                              onPressed: () {
                                Get.toNamed(RegisterScreen.routename);
                              },
                              child: ThemeText(
                                theText: "tr_register".tr,
                                thefontSize: 11.0.sp,
                                theColor: darkOrange,
                                theFontWeight: FontWeight.bold,
                                theTextDecoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                          SizedBox(height: 2.0.hp),
                          Center(
                            child: ThemeButton(
                                theContent: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5.0.wp, vertical: 1.0.hp),
                                    decoration: BoxDecoration(
                                      color: white,
                                      borderRadius:
                                          BorderRadius.circular(2.0.wp),
                                      border: Border.all(
                                        color: brown,
                                        width: 1,
                                      ),
                                    ),
                                    child: ThemeText(
                                        theText:
                                            "tr_continue_without_registration"
                                                .tr,
                                        thefontSize: 12.0.sp,
                                        theFontWeight: FontWeight.bold,
                                        theColor: black)),
                                theAction: loginController.loginWithFacebook,
                                theLoadingStatus:
                                    loginController.isLoading.value),
                          )
                        ]),
                  )),
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
      appBar: ThemeAppBar(),
      body: Container(
        color: biege,
        width: Get.width,
        height: 90.0.hp,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10.0.hp),
              Container(
                alignment: Alignment.center,
                width: 100.0.wp,
                height: 4.0.hp,
                child: ThemeText(
                    theText: "tr_type_your_password".tr,
                    theFontFamily: "Montserrat-regular",
                    theFontWeight: FontWeight.bold,
                    thefontSize: 17.0.sp,
                    theColor: black),
              ),
              SizedBox(height: 5.0.hp),
              Container(
                  width: 90.0.wp,
                  child: Form(
                    key: loginController.formKey2,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 2.0.hp),
                          ThemeText(
                              theText: "tr_password_star".tr,
                              thefontSize: 12.0.sp,
                              theColor: black),
                          SizedBox(height: 1.0.hp),
                          Obx(
                            () => Container(
                              child: ThemeInput(
                                theLabelText: "tr_password_star".tr,
                                theHintText: "tr_password_star".tr,
                                theTextEditingController:
                                    loginController.passwordEditingController,
                                theValidation: loginController.validatePassword,
                                theContentPadding: 5.0.sp,
                                theTextVisibilty:
                                    loginController.isObscure.value,
                                theFloatingLabelBehaviour:
                                    FloatingLabelBehavior.never,
                                theIconWidget: IconButton(
                                  icon: Icon(
                                    loginController.isObscure.value
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    loginController.togglePasswordVisibilty(
                                        loginController.isObscure.value);
                                  },
                                ),
                              ),
                            ),
                          ),
                          //SizedBox(height: 1.0.hp),
                          Container(
                              height: 8.0.hp,
                              width: double.infinity,
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Obx(
                                      () => Checkbox(
                                        activeColor: grey,
                                        value: loginController.isChecked.value,
                                        onChanged: (value) {
                                          loginController.changeCheckbox(
                                              loginController.isChecked.value);
                                        },
                                      ),
                                    ),
                                    ThemeText(
                                        theText: "tr_remember_me".tr,
                                        thefontSize: 9.0.sp,
                                        theColor: grey),
                                    SizedBox(width: 5.0.wp),
                                    TextButton(
                                      onPressed: () {
                                        loginController.goToRestPassword();
                                      },
                                      child: ThemeText(
                                        theText: "tr_forgot_password".tr,
                                        thefontSize: 9.0.sp,
                                        theColor: grey,
                                        theFontWeight: FontWeight.w800,
                                        theTextDecoration:
                                            TextDecoration.underline,
                                      ),
                                    ),
                                  ])),
                          SizedBox(height: 2.0.hp),
                          Obx(() => Center(
                                child: ThemeButton(
                                    theContent: Container(
                                      alignment: Alignment.center,
                                      width: 60.0.wp,
                                      height: 5.0.hp,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5.0.wp, vertical: 1.0.hp),
                                      decoration: BoxDecoration(
                                        color: grey,
                                        borderRadius:
                                            BorderRadius.circular(2.0.wp),
                                      ),
                                      child: ThemeText(
                                          theText: "tr_connect".tr,
                                          thefontSize: 12.0.sp,
                                          theFontWeight: FontWeight.bold,
                                          theColor: white),
                                    ),
                                    theFormKey: loginController.formKey,
                                    theAction: loginController.connect,
                                    theLoadingStatus:
                                        loginController.isLoading.value),
                              )),
                        ]),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
