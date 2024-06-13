import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shayplanner/api/api_helper.dart';
import 'package:shayplanner/components/login/login_screen.dart';
import 'package:shayplanner/components/pin_verfication/pin_verification_service.dart';
import 'package:shayplanner/components/profile/profile_editing_screens/change_password_screen.dart';
import 'package:shayplanner/components/profile/profile_editing_screens/personal_infos_screen.dart';
import 'package:shayplanner/components/profile/profile_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shayplanner/components/register/register_controller.dart';
import 'package:shayplanner/models/user_model.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/theme/theme_snackbar.dart';
import 'package:shayplanner/theme/theme_text.dart';
import 'package:shayplanner/tools/extension.dart';

class PinVerificationController extends GetxController {
  TextEditingController pinTextEditingController = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();
  bool isLoading=false;
  @override
  void onInit() async {
    errorController = StreamController<ErrorAnimationType>();
    super.onInit();
  }

  verifyPin() {
    formKey.currentState!.validate();
    if (currentText.length != 4) {
      errorController!.add(ErrorAnimationType.shake);
      hasError = true;
      update();
    } else {
      hasError = false;
      update();
    }
  }

  validateOtp() {
          RegisterController controller  = Get.find<RegisterController>();
    String mobile =controller.mobileEditingController.text;
      isLoading = true;
       PinVerificationService()
        .apiValidateOtpOnSignUp(mobile,currentText).then((value) async {
      var body = jsonDecode(value.body);
      isLoading = false;
      print(body);
      if (body["success"]) {
        controller.register();
      } else {
        if (body["message"] == "validationError") {
          String errorMessage = '';
          body["data"].forEach((key, value) {
            errorMessage += '${value.join(', ')}\n';
          });
          themeSnackBar(errorMessage);
        } else {
          themeSnackBar(body["message"]);
        }
      }
    });
    } 

    resend(){
      RegisterController controller  = Get.find<RegisterController>();
      controller.sendOtp();

    }
}
