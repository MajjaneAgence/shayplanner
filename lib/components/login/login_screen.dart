import 'package:flutter_svg/svg.dart';
import 'package:shayplanner/components/register/register_screen.dart';
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
  static const routename = '/login-email-and-social';
    final LoginController loginController = Get.put(LoginController(Get.arguments));

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(loginController.arguments),
        builder: (controller) => Scaffold(
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
                            theColor: white,
                            theWidth: 90.0.wp,
                            theHeight: 6.5.hp,
                            theBorderRadius: 2.0.wp,
                            theBorderColor: brown,
                            theContent: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                      "assets/icons/social_media/google.svg",
                                      width: 8.0.wp,
                                      height: 8.0.wp),
                                  SizedBox(width: 9.0.wp),
                                  ThemeText(
                                      theText: "tr_continue_with_google".tr,
                                      thefontSize: 10.0.sp,
                                      theFontWeight: FontWeight.bold,
                                      theColor: black)
                                ]),
                            theAction: controller.loginWithGoogle,
                            theLoadingStatus: false),
                      ),
                      SizedBox(height: 2.0.hp),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0.wp),
                        child: ThemeButton(
                            theColor: white,
                            theWidth: 90.0.wp,
                            theHeight: 6.5.hp,
                            theBorderRadius: 2.0.wp,
                            theBorderColor: brown,
                            theContent: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                      "assets/icons/social_media/apple.svg",
                                      width: 8.0.wp,
                                      height: 8.0.wp),
                                  SizedBox(width: 9.0.wp),
                                  ThemeText(
                                      theText: "tr_continue_with_apple".tr,
                                      thefontSize: 10.0.sp,
                                      theFontWeight: FontWeight.bold,
                                      theColor: black)
                                ]),
                            theAction: controller.loginWithApple,
                            theLoadingStatus: false),
                      ),
                      SizedBox(height: 2.0.hp),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0.wp),
                        child: ThemeButton(
                            theColor: white,
                            theWidth: 90.0.wp,
                            theHeight: 6.5.hp,
                            theBorderRadius: 2.0.wp,
                            theBorderColor: brown,
                            theContent: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                      "assets/icons/social_media/facebook.svg",
                                      width: 8.0.wp,
                                      height: 8.0.wp),
                                  SizedBox(width: 9.0.wp),
                                  ThemeText(
                                      theText: "tr_continue_with_facebook".tr,
                                      thefontSize: 10.0.sp,
                                      theFontWeight: FontWeight.bold,
                                      theColor: black)
                                ]),
                            theAction: controller.loginWithFacebook,
                            theLoadingStatus: false),
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
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 5.0.wp),
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
                            key: controller.formKey,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ThemeText(
                                    theText: "tr_email_star".tr,
                                    thefontSize: 12.0.sp,
                                    theColor: lightGrey,
                                    theFontWeight: FontWeight.bold,
                                  ),
                                  SizedBox(height: 1.0.hp),
                                  ThemeInput(
                                    theLabelText: "tr_email_star".tr,
                                    theHintText: "tr_email_star".tr,
                                    theTextEditingController: controller
                                        .usernameEditingController,
                                    theValidation:
                                        controller.validateUsername,
                                    theContentPadding: 5.0.sp,
                                  ),
                                  SizedBox(height: 3.0.hp),
                                  Center(
                                    child: ThemeButton(
                                        theWidth: 65.0.wp,
                                        theHeight: 6.5.hp,
                                        theColor: grey,
                                        theBorderRadius: 2.0.wp,
                                        theContent: ThemeText(
                                          theText: "tr_continue".tr,
                                          thefontSize: 12.0.sp,
                                          theFontWeight: FontWeight.bold,
                                          theColor: white,
                                          theTextAlign: TextAlign.center,
                                        ),
                                        theFormKey: controller.formKey,
                                        theAction:
                                            controller.goToPasswordScreen,
                                        theLoadingStatus: false),
                                  ),
                                  SizedBox(height: 5.0.hp),
                                  Center(
                                    child: ThemeText(
                                        theText: "tr_new_on_planner".tr,
                                        theFontFamily: "Montserrat-regular",
                                        theFontWeight: FontWeight.bold,
                                        thefontSize: 12.0.sp,
                                        theColor: black),
                                  ),
                                  Center(
                                    child: InkWell(
                                      onTap: () {
                                        Get.toNamed(RegisterScreen.routename);
                                      },
                                      child: ThemeText(
                                        theText: "tr_register".tr,
                                        thefontSize: 11.0.sp,
                                        theColor: darkOrange,
                                        theFontWeight: FontWeight.bold,
                                        theTextDecoration:
                                            TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 2.0.hp),
                                  Center(
                                    child: ThemeButton(
                                        theWidth: 65.0.wp,
                                        theHeight: 6.5.hp,
                                        theColor: white,
                                        theBorderRadius: 2.0.wp,
                                        theContent: ThemeText(
                                          theText:
                                              "tr_continue_without_registration"
                                                  .tr,
                                          thefontSize: 11.0.sp,
                                          theFontWeight: FontWeight.bold,
                                          theColor: black,
                                          theTextAlign: TextAlign.center,
                                        ),
                                        theAction: controller.continueLoggedOut,
                                        theLoadingStatus: false),
                                  )
                                ]),
                          )),
                    ],
                  ),
                ),
              ),
            ));
  }
}

class LoginScreenForPassword extends StatelessWidget {
  LoginScreenForPassword({
    Key? key,
  }) : super(key: key);
  static const routename = '/login';
    final LoginController loginController = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(loginController.arguments),
      builder: (controller) => Scaffold(
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
                      key: controller.formKey2,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 2.0.hp),
                            ThemeText(
                              theText: "tr_password_star".tr,
                              thefontSize: 12.0.sp,
                              theColor: lightGrey,
                              theFontWeight: FontWeight.bold,
                            ),
                            SizedBox(height: 1.0.hp),
                            Container(
                              child: ThemeInput(
                                theLabelText: "tr_password_star".tr,
                                theHintText: "tr_password_star".tr,
                                theTextEditingController:
                                    controller.passwordEditingController,
                                theValidation: controller.validatePassword,
                                theContentPadding: 5.0.sp,
                                theTextVisibilty: controller.isObscure,
                                theFloatingLabelBehaviour:
                                    FloatingLabelBehavior.never,
                                theIconWidget: IconButton(
                                  icon: Icon(
                                    controller.isObscure
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    controller.togglePasswordVisibilty(
                                        controller.isObscure);
                                  },
                                ),
                              ),
                            ),

                            //SizedBox(height: 1.0.hp),
                            Container(
                                height: 8.0.hp,
                                width: double.infinity,
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Checkbox(
                                              activeColor: grey,
                                              value: controller.isChecked,
                                              onChanged: (value) {
                                                controller.changeCheckbox(
                                                    controller.isChecked);
                                              },
                                            ),
                                            ThemeText(
                                                theText: "tr_remember_me".tr,
                                                thefontSize: 9.0.sp,
                                                theColor: grey),
                                          ]),
                                      TextButton(
                                        onPressed: () {
                                          controller.goToRestPassword();
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
                            Center(
                              child: ThemeButton(
                                  theWidth: 65.0.wp,
                                  theHeight: 6.5.hp,
                                  theColor: grey,
                                  theBorderRadius: 2.0.wp,
                                  theContent: ThemeText(
                                    theText: "tr_connect".tr,
                                    thefontSize: 12.0.sp,
                                    theFontWeight: FontWeight.bold,
                                    theColor: white,
                                    theTextAlign: TextAlign.center,
                                  ),
                                  theFormKey: controller.formKey2,
                                  theAction: controller.connect,
                                  theLoadingStatus: controller.isLoading),
                            )
                          ]),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
