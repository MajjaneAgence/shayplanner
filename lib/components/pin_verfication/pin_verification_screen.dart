import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shayplanner/components/pin_verfication/pin_verification_controller.dart';
import 'package:shayplanner/theme/theme_app_bar.dart';
import 'package:shayplanner/theme/theme_button.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/theme/theme_text.dart';
import 'package:shayplanner/tools/extension.dart';

class PinCodeVerificationScreen extends StatelessWidget {
  static const routename = '/pin-verification';
  const PinCodeVerificationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PinVerificationController>(
      init: PinVerificationController(),
      builder: (controller) => Scaffold(
        appBar: ThemeAppBar(),
        backgroundColor: biege,
        body: GestureDetector(
          onTap: () {},
          child: Container(
            height: 90.0.hp,
            width: 100.0.wp,
            padding: EdgeInsets.symmetric(horizontal: 7.0.wp),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.0.hp),
                  ThemeText(
                      theText: "tr_verification_code".tr,
                      thefontSize: 20.0.sp,
                      theColor: grey,
                      theFontWeight: FontWeight.bold),
                  SizedBox(
                    height: 2.0.hp,
                  ),
                  ThemeText(theText: "tr_please_enter_code_sent_to".tr, thefontSize: 12.0.sp, theColor: grey),
                    SizedBox(
                    height: 3.0.hp,
                  ),
                  Form(
                    key: controller.formKey,
                    child: PinCodeTextField(
                      appContext: context,
                      pastedTextStyle: TextStyle(
                        color: Colors.green.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                      length: 4,
                      obscureText: true,
                      obscuringCharacter: '*',
                      blinkWhenObscuring: true,
                      animationType: AnimationType.fade,
                      useExternalAutoFillGroup: true,
                      validator: (v) {
                        // print(v);
                        // if (v!.length < 3) {
                        //   return "I'm from validator";
                        // } else {
                        //   return null;
                        // }
                      },
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(3.0.sp),
                        fieldHeight: 12.0.hp,
                        fieldWidth:  19.0.wp,
                        activeFillColor: white,
                        inactiveFillColor: white,
                        selectedFillColor: white,
                        activeColor: white,
                        inactiveColor: white,
                        selectedColor: white,
                      ),
                      cursorColor: grey,
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      errorAnimationController: controller.errorController,
                      controller: controller.pinTextEditingController,
                      keyboardType: TextInputType.number,
                      boxShadows: const [
                        BoxShadow(
                          offset: Offset(0, 1),
                          color: Colors.black12,
                          blurRadius: 10,
                        )
                      ],
                      onCompleted: (v) {
                        debugPrint("Completed");
                      },
                      // onTap: () {
                      //   print("Pressed");
                      // },
                      onChanged: (value) {
                        debugPrint(value);
                        controller.currentText = value;
                        controller.update();
                      },
                      beforeTextPaste: (text) {
                        debugPrint("Allowing to paste $text");
                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        return true;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Text(
                      controller.hasError
                          ? "tr_please_enter_valid_pin_code".tr
                          : "",
                      style:  TextStyle(
                        color: Colors.red,
                        fontSize: 12.0.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4.0.hp,
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: controller.isLoading? TextButton(
                        onPressed: controller.resend(),
                        child: ThemeText(theText: "tr_resend", thefontSize: 12.0.sp, theColor: grey,theFontWeight: FontWeight.bold),
                       ):CircularProgressIndicator(color: crem,),
                  ),
                  SizedBox(
                    height: 4.0.hp,
                  ),
                  ThemeButton(
                    theColor: grey,
                    theWidth: 90.0.wp,
                    theHeight: 6.5.hp,
                    theBorderRadius: 2.0.wp,
                    theBorderColor: brown,
                    theContent:ThemeText(theText: "tr_verify".tr, thefontSize: 14.0.sp, theColor: white,theFontWeight: FontWeight.bold,),
                     theAction: controller.validateOtp,
                    theLoadingStatus: false),
                   SizedBox(
                    height: 8.0.hp,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
