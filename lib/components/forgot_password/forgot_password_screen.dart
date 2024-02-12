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
      // for the appBar we're going to give it 10% of the height
      appBar: AppBar(toolbarHeight: 10.0.hp),
      // first we're going to add a container that will occupy the whole width and 90% of the height
      body: Container(
        //we're going to add some padding horizontally for the container in order
        //that the content will not stick to the edge of the screen
        padding: EdgeInsets.symmetric(horizontal: 8.0.wp),
        width: Get.width,
        height:
            90.0.hp, // 10 percent of the height is a lready taken by the appbar
        // in ide the container we're going to use SingleScrollView so that if the screen is not
        // long enought he content will scroll
        child: SingleChildScrollView(
          // we're going to use the Column widget inside the SingleChildScrollView in order
          //to place multiple widget whithin the SingleChildScrollView Widget
          // in this case we're going to place in this Column either the Column (that contains the Form with
          // email and the send button) along with ( the text that make the user able to togggle between
          // email and phone reset) or the same text mentioned previously along with the Column (that contains the Form with
          // phone and the send button)
          child: Column(children: [
            Obx(() =>
                // Bu default we will suppose that the user will reset the pasword with the email
                // but we're going to wrap with Obx widget to check if the user has chosen to reset using
                // phone number
                forgotPasswordController.forgotPasswordMethod.value == "email"
                    ? Column(
                        children: [
                          SizedBox(height: 10.0.hp),
                          //ThemeText is a widget that we created to unify all the text across the app
                          //and at the same time avoid repeating code for widget
                          ThemeText(
                              theText: "tr_enter_email_to_receive_code".tr,theColor: black,thefontSize: 14.0.sp,),
                          // this the form that contains the Email and the send button for email reset
                          Form(
                            key: forgotPasswordController.formKey,
                            child: Column(children: [
                              SizedBox(height: 10.0.hp),
                              // this ThemeInput a TextFormField Widget that we created to avoid
                              // repeating TextFormField code multiple times and unify all the TextFormField in the app
                              ThemeInput(
                                  theLabelText: "tr_email".tr,
                                  theHintText: "tr_email".tr,
                                  theTextEditingController:
                                      forgotPasswordController
                                          .emailEditingController,
                                  theValidation:
                                      forgotPasswordController.validateEmail,
                                  theContentPadding: 5.0.sp),
                              SizedBox(height: 2.0.hp),
                              // we will wrap the button with Obx widget making us able to check if the user has already cicked on the button
                              // so we can decide if we will continue to show the button or we will show CircularProgressIndicator
                              Obx(
                                // Here we have our ThemeButton that we created to avoid repeating the same code accross the app
                                // to render the same visual for a button
                                () => ThemeButton(
                                  theText: "tr_send".tr,
                                  theAction: forgotPasswordController
                                      .sendVerificationCode,
                                  theFormKey: forgotPasswordController.formKey,
                                  theLoadingStatus:
                                      forgotPasswordController.isLoading.value,
                                ),
                              ),
                            ]),
                          )
                        ],
                      )
                    :
                    //if the user chooses phone number we're going to render
                    //this column instead of the previous one
                    Column(
                        children: [
                          SizedBox(height: 10.0.hp),
                          //ThemeText is a widget that we created to unify all the text across the app
                          //and at the same time avoid repeating code for widget
                          ThemeText(
                              theText: "tr_enter_phone_to_receive_code".tr,theColor: black,thefontSize: 14.0.sp,),
                          Form(
                            key: forgotPasswordController.formKey,
                            child: Column(children: [
                              SizedBox(height: 10.0.hp),
                              // this ThemeInput a TextFormField Widget that we created to avoid
                              // repeating TextFormField code multiple times and unify all the TextFormField in the app
                              ThemeInput(
                                  theLabelText: "tr_phone".tr,
                                  theHintText: "tr_phone".tr,
                                  theTextEditingController:
                                      forgotPasswordController
                                          .emailEditingController,
                                  theValidation:
                                      forgotPasswordController.validateEmail,
                                  theContentPadding: 5.0.sp),
                              SizedBox(height: 2.0.hp),
                              // we will wrap the button with Obx widget making us able to check if the user has already cicked on the button
                              // so we can decide if we will continue to show the button or we will show CircularProgressIndicatorFF
                              Obx(
                                // Here we have our ThemeButton that we created to avoid repeating the same code accross the app
                                // to render the same visual for a button
                                () => ThemeButton(
                                  theText: "tr_send".tr,
                                  theAction: forgotPasswordController
                                      .sendVerificationCode,
                                  theFormKey: forgotPasswordController.formKey,
                                  theLoadingStatus:
                                      forgotPasswordController.isLoading.value,
                                ),
                              )
                            ]),
                          )
                        ],
                      )),
            // and here we're gonna add the text button making us able to toggle reset method
            TextButton(
              onPressed: () {
                forgotPasswordController.forgotPasswordMethod.value == "email"
                    ? forgotPasswordController
                        .toggleResetPasswordMethod("phone")
                    : forgotPasswordController
                        .toggleResetPasswordMethod("email");
              },
              child: Text("tr_try_something_else".tr),
            )
          ]),
        ),
      ),
    );
  }
}
