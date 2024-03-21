import 'package:shayplanner/theme/theme_app_bar.dart';
import 'package:shayplanner/theme/theme_button.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/theme/theme_input.dart';
import 'package:shayplanner/theme/theme_text.dart';
import 'package:shayplanner/tools/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shayplanner/components/forgot_password/forgot_password_controller.dart';

class SetNewPasswordScreen extends StatelessWidget {
  SetNewPasswordScreen({
    Key? key,
  }) : super(key: key);
  final ForgotPasswordController forgotPasswordController =
      Get.put(ForgotPasswordController());
  static const routename = '/set-new-password';
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
          child: Form(
            key: forgotPasswordController.formKeySetNewPassword,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(height: 15.0.hp),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 7.0.wp),
                width: 90.0.wp,
                child: ThemeText(
                  theText: "tr_set_new_password".tr,
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
                    theText: "tr_password_star".tr,
                    thefontSize: 12.0.sp,
                    theColor: lightGrey,
                    theFontWeight: FontWeight.bold,),
              ),
              SizedBox(height: 1.0.hp),
              Obx(
                () => Container(
                  margin: EdgeInsets.symmetric(horizontal: 7.0.wp),
                  width: 90.0.wp,
                  child: ThemeInput(
                    theLabelText: "tr_password_star".tr,
                    theHintText: "tr_password_star".tr,
                    theTextEditingController:
                        forgotPasswordController.passwordEditingController,
                    theValidation: forgotPasswordController.validatePassword,
                    theContentPadding: 5.0.sp,
                    theTextVisibilty:
                        forgotPasswordController.isObscurePassword.value,
                    theFloatingLabelBehaviour: FloatingLabelBehavior.never,
                    theIconWidget: IconButton(
                      icon: Icon(
                        forgotPasswordController.isObscurePassword.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        forgotPasswordController.togglePasswordVisibilty(
                            forgotPasswordController.isObscurePassword.value);
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 3.0.hp),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 7.0.wp),
                width: 90.0.wp,
                child: ThemeText(
                    theText: "tr_password_confirmation".tr,
                    thefontSize: 12.0.sp,
                     theColor: lightGrey,
                    theFontWeight: FontWeight.bold,),
              ),
              SizedBox(height: 1.0.hp),
              Obx(
                () => Container(
                  margin: EdgeInsets.symmetric(horizontal: 7.0.wp),
                  width: 90.0.wp,
                  child: ThemeInput(
                    theLabelText: "tr_password_star".tr,
                    theHintText: "tr_password_star".tr,
                    theTextEditingController: forgotPasswordController
                        .confirmPasswordEditingController,
                    theValidation:
                        forgotPasswordController.validatePasswordConfirmation,
                    theContentPadding: 5.0.sp,
                    theTextVisibilty:
                        forgotPasswordController.isObscureConfirmation.value,
                    theFloatingLabelBehaviour: FloatingLabelBehavior.never,
                    theIconWidget: IconButton(
                      icon: Icon(
                        forgotPasswordController.isObscureConfirmation.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        forgotPasswordController
                            .togglePasswordConfirmationVisibilty(
                                forgotPasswordController
                                    .isObscureConfirmation.value);
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5.0.hp),
              Obx(
                () => Center(
                  child: ThemeButton(
                      theWidth: 65.0.wp,
                      theHeight: 6.5.hp,
                      theBorderRadius: 2.0.wp,
                      theColor: grey,
                      theContent: ThemeText(
                          theText: "tr_save".tr,
                          thefontSize: 12.0.sp,
                          theFontWeight: FontWeight.bold,
                          theColor: white),
                      theFormKey:
                          forgotPasswordController.formKeySetNewPassword,
                      theAction: forgotPasswordController.changePassword,
                      theLoadingStatus: forgotPasswordController
                          .isLoadingChnagePassword.value),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
