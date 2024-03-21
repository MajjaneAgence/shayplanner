import 'package:shayplanner/theme/theme_app_bar.dart';
import 'package:shayplanner/theme/theme_button.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/theme/theme_input.dart';
import 'package:shayplanner/theme/theme_text.dart';
import 'package:shayplanner/tools/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shayplanner/components/forgot_password/forgot_password_controller.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({
    Key? key,
  }) : super(key: key);
  final ForgotPasswordController forgotPasswordController =
      Get.put(ForgotPasswordController());
  static const routename = '/forgot-password';
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
          child: Column(children: [
            Obx(() => forgotPasswordController.forgotPasswordMethod.value ==
                    "email"
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15.0.hp),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 7.0.wp),
                        width: 80.0.wp,
                        child: ThemeText(
                          theText: "tr_forget_password".tr,
                          theColor: black,
                          thefontSize: 20.0.sp,
                          theFontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 2.0.hp),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 7.0.wp),
                        width: 90.0.wp,
                        child: ThemeText(
                          theText: "tr_enter_email_to_receive_code".tr,
                          theColor: lightGrey,
                          thefontSize: 10.0.sp,
                          theFontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 7.0.wp),
                          child: Form(
                            key: forgotPasswordController.formKeyForgetPassword,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 3.0.hp),
                                  ThemeText(
                                    theText: "tr_email_star".tr,
                                    thefontSize: 12.0.sp,
                                    theColor: lightGrey,
                                    theFontWeight: FontWeight.bold,
                                  ),
                                  SizedBox(height: 1.0.hp),
                                  ThemeInput(
                                    theLabelText: "tr_enter_email_address".tr,
                                    theHintText: "tr_enter_email_address".tr,
                                    theTextEditingController:
                                        forgotPasswordController
                                            .emailEditingController,
                                    theValidation:
                                        forgotPasswordController.validateEmail,
                                    theContentPadding: 5.0.sp,
                                    theFloatingLabelBehaviour:
                                        FloatingLabelBehavior.never,
                                  ),
                                  SizedBox(height: 10.0.hp),
                                  Obx(
                                    () => Center(
                                      child: ThemeButton(
                                          theWidth: 65.0.wp,
                                          theHeight: 6.5.hp,
                                          theBorderRadius: 2.0.wp,
                                          theColor: grey,
                                          theContent: ThemeText(
                                              theText: "tr_continue".tr,
                                              thefontSize: 12.0.sp,
                                              theFontWeight: FontWeight.bold,
                                              theColor: white),
                                          theFormKey: forgotPasswordController
                                              .formKeyForgetPassword,
                                          theAction: forgotPasswordController
                                              .sendVerificationCode,
                                          theLoadingStatus:
                                              forgotPasswordController
                                                  .isLoadingSendVerificationCode
                                                  .value),
                                    ),
                                  ),
                                ]),
                          )),
                    ],
                  )
                : Column(
                    children: [
                      SizedBox(height: 10.0.hp),
                      ThemeText(
                        theText: "tr_enter_phone_to_receive_code".tr,
                        theColor: black,
                        thefontSize: 14.0.sp,
                      ),
                      Form(
                        key: forgotPasswordController.formKeyForgetPassword,
                        child: Column(children: [
                          SizedBox(height: 10.0.hp),
                          ThemeInput(
                              theLabelText: "tr_phone".tr,
                              theHintText: "tr_phone".tr,
                              theTextEditingController: forgotPasswordController
                                  .emailEditingController,
                              theValidation:
                                  forgotPasswordController.validateEmail,
                              theContentPadding: 5.0.sp),
                          SizedBox(height: 2.0.hp),
                          Obx(
                            () => ThemeButton(
                              theColor: grey,
                              theContent: Text("tr_send".tr),
                              theAction:
                                  forgotPasswordController.sendVerificationCode,
                              theFormKey: forgotPasswordController
                                  .formKeyForgetPassword,
                              theLoadingStatus: forgotPasswordController
                                  .isLoadingSendVerificationCode.value,
                            ),
                          )
                        ]),
                      )
                    ],
                  )),
            // TextButton(
            //   onPressed: () {
            //     forgotPasswordController.forgotPasswordMethod.value == "email"
            //         ? forgotPasswordController
            //             .toggleResetPasswordMethod("phone")
            //         : forgotPasswordController
            //             .toggleResetPasswordMethod("email");
            //   },
            //   child: Text("tr_try_something_else".tr),
            // )
          ]),
        ),
      ),
    );
  }
}
