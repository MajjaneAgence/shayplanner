import 'package:shayplanner/components/profile/profile_controller.dart';
import 'package:shayplanner/theme/theme_app_bar.dart';
import 'package:shayplanner/theme/theme_button.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/theme/theme_input.dart';
import 'package:shayplanner/theme/theme_text.dart';
import 'package:shayplanner/tools/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({
    Key? key,
  }) : super(key: key);
  final ProfileController profileController =
      Get.isRegistered<ProfileController>()
          ? Get.find<ProfileController>()
          : Get.put(ProfileController());
  static const routename = '/change-password';
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: white,
        appBar: ThemeAppBar(),
        body: profileController.isLoadingCurrentUser.value == true
            ? const Center(child: CircularProgressIndicator())
            : Container(
                width: Get.width,
                height: 90.0.hp,
                color: biege,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 15.0.hp),
                      ThemeText(
                          theText: "tr_change_password".tr,
                          thefontSize: 16.0.sp,
                          theColor: black,
                          theFontWeight: FontWeight.bold),
                      SizedBox(height: 3.0.hp),
                      Container(
                        padding:
                            EdgeInsetsDirectional.symmetric(horizontal: 8.0.wp),
                        child: Form(
                          key: profileController.formKeyChangePassword,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ThemeText(
                                  theText: "tr_current_password".tr,
                                  thefontSize: 10.0.sp,
                                  theColor: lightGrey,
                                  theFontWeight: FontWeight.bold),
                              SizedBox(height: 0.5.hp),
                              ThemeInput(
                                theLabelText: "tr_current_password".tr,
                                theHintText: "tr_current_password".tr,
                                theTextEditingController: profileController
                                    .oldPasswordEditingController,
                                theValidation:
                                    profileController.validateOldPassword,
                                theContentPadding: 5.0.sp,
                                theTextVisibilty: profileController
                                    .isOldPasswordObscure.value,
                                theIconWidget: IconButton(
                                  icon: Icon(
                                    profileController.isOldPasswordObscure.value
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    profileController
                                        .toggleOldPasswordVisibilty(
                                            profileController
                                                .isOldPasswordObscure.value);
                                  },
                                ),
                              ),
                              SizedBox(height: 6.0.hp),
                              ThemeText(
                                  theText: "tr_new_password".tr,
                                  thefontSize: 10.0.sp,
                                  theColor: lightGrey,
                                  theFontWeight: FontWeight.bold),
                              SizedBox(height: 0.5.hp),
                              ThemeInput(
                                theLabelText: "tr_new_password".tr,
                                theHintText: "tr_new_password".tr,
                                theTextEditingController: profileController
                                    .newPasswordEditingController,
                                theValidation:
                                    profileController.validateNewPassword,
                                theContentPadding: 5.0.sp,
                                theTextVisibilty: profileController
                                    .isNewPasswordObscure.value,
                                theFloatingLabelBehaviour:
                                    FloatingLabelBehavior.never,
                                theIconWidget: IconButton(
                                  icon: Icon(
                                    profileController.isNewPasswordObscure.value
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    profileController
                                        .toggleNewPasswordVisibilty(
                                            profileController
                                                .isNewPasswordObscure.value);
                                  },
                                ),
                              ),
                              SizedBox(height: 2.0.hp),
                              ThemeText(
                                  theText: "tr_new_password_confirmation".tr,
                                  thefontSize: 10.0.sp,
                                  theColor: lightGrey,
                                  theFontWeight: FontWeight.bold),
                              SizedBox(height: 0.5.hp),
                              ThemeInput(
                                theLabelText: "tr_new_password_confirmation".tr,
                                theHintText: "tr_new_password_confirmation".tr,
                                theTextEditingController: profileController
                                    .newPasswordConfirmaEditingController,
                                theValidation: profileController
                                    .validatePasswordConfirmation,
                                theContentPadding: 5.0.sp,
                                theTextVisibilty: profileController
                                    .isObscureConfirmation.value,
                                theFloatingLabelBehaviour:
                                    FloatingLabelBehavior.never,
                                theIconWidget: IconButton(
                                  icon: Icon(
                                    profileController
                                            .isObscureConfirmation.value
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    profileController
                                        .togglePasswordConfirmationVisibilty(
                                            profileController
                                                .isObscureConfirmation.value);
                                  },
                                ),
                              ),
                              SizedBox(height: 4.0.hp),
                              Center(
                                child: ThemeButton(
                                    theWidth: 65.0.wp,
                                    theHeight: 6.5.hp,
                                    theBorderRadius: 2.0.wp,
                                    theHorizontalPadding: 5.0.wp,
                                    theVerticalPadding: 1.0.hp,
                                    theColor: grey,
                                    theContent: ThemeText(
                                        theText: "tr_save".tr,
                                        thefontSize: 12.0.sp,
                                        theFontWeight: FontWeight.bold,
                                        theColor: white),
                                    theFormKey:
                                        profileController.formKeyChangePassword,
                                    theAction: profileController.changePassword,
                                    theLoadingStatus: profileController
                                        .isloadingChangePassword.value),
                              ),
                              SizedBox(height: 2.0.hp),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
