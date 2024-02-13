import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:shayplanner/components/register/register_controller.dart';
import 'package:shayplanner/theme/theme_button.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/theme/theme_input.dart';
import 'package:shayplanner/theme/theme_text.dart';
import 'package:shayplanner/tools/extension.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({
    Key? key,
  }) : super(key: key);
  RegisterController registerController = Get.put(RegisterController());
  static const routename = '/register';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 10.0.hp),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0.wp),
        width: Get.width,
        height: Get.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10.0.hp),
              ThemeText(
                theText: "tr_create_account_by_filling_inputs".tr,
                theColor: black,
                thefontSize: 8.0.sp,
              ),
              Form(
                  key: registerController.formKey,
                  child: Column(children: [
                    Row(children: [
                      Expanded(
                        child: ThemeInput(
                          theLabelText: "tr_firstname".tr,
                          theHintText: "tr_firstname".tr,
                          theTextEditingController:
                              registerController.emailEditingController,
                          theValidation: registerController.validateFirstName,
                          theContentPadding: 5.0.sp,
                        ),
                      ),
                      SizedBox(width: 2.0.wp),
                      Expanded(
                        child: ThemeInput(
                            theLabelText: "tr_lastname".tr,
                            theHintText: "tr_lastname".tr,
                            theTextEditingController:
                                registerController.emailEditingController,
                            theValidation: registerController.validateLastName,
                            theContentPadding: 5.0.sp),
                      )
                    ]),
                    SizedBox(height: 2.0.hp),
                    ThemeInput(
                        theLabelText: "tr_username".tr,
                        theHintText: "tr_username".tr,
                        theTextEditingController:
                            registerController.emailEditingController,
                        theValidation: registerController.validateEmail,
                        theContentPadding: 5.0.sp),
                    SizedBox(height: 2.0.hp),
                    ThemeInput(
                        theLabelText: "tr_password".tr,
                        theHintText: "tr_password".tr,
                        theTextEditingController:
                            registerController.passwordEditingController,
                        theValidation: registerController.validatePassword,
                        theContentPadding: 5.0.sp),
                    SizedBox(height: 2.0.hp),
                    ThemeInput(
                        theLabelText: "tr_confirm_password".tr,
                        theHintText: "tr_confirm_password".tr,
                        theTextEditingController:
                            registerController.passwordEditingController,
                        theValidation:
                            registerController.validateConfirmPassword,
                        theContentPadding: 5.0.sp),
                    SizedBox(height: 2.0.hp),
                    SizedBox(
                      height: 200,
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        initialDateTime: DateTime(1969, 1, 1),
                        onDateTimeChanged: (DateTime newDateTime) {},
                      ),
                    ),
                    SizedBox(height: 2.0.hp),
                    Obx(
                      () => ThemeButton(
                        theContent: Text("tr_register".tr),
                        theAction: registerController.register,
                        theFormKey: registerController.formKey,
                        theLoadingStatus: registerController.isLoading.value,
                      ),
                    ),
                    SizedBox(height: 2.0.hp),
                  ]))
            ],
          ),
        ),
      ),
    );
  }
}
