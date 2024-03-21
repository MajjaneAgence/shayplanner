import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:shayplanner/components/register/register_controller.dart';
import 'package:shayplanner/theme/theme_app_bar.dart';
import 'package:shayplanner/theme/theme_button.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/theme/theme_input.dart';
import 'package:shayplanner/theme/theme_text.dart';
import 'package:shayplanner/tools/extension.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({
    Key? key,
  }) : super(key: key);
  final RegisterController registerController = Get.put(RegisterController());
  static const routename = '/register';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: ThemeAppBar(),
      body: Container(
        color: biege,
        padding: EdgeInsets.symmetric(horizontal: 8.0.wp),
        width: Get.width,
        height: Get.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 3.0.hp),
              ThemeText(
                theText: "tr_create_your_account".tr,
                theColor: black,
                thefontSize: 18.0.sp,
                theFontWeight: FontWeight.bold,
              ),
              SizedBox(height: 2.0.hp),
              Form(
                key: registerController.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ThemeText(
                        theText: "tr_lastname_star".tr,
                        thefontSize: 12.0.sp,
                        theColor: black),
                    SizedBox(height: 0.5.hp),
                    ThemeInput(
                      theLabelText: "tr_lastname_star".tr,
                      theHintText: "tr_lastname_star".tr,
                      theTextEditingController:
                          registerController.lastNameEditingController,
                      theValidation: registerController.validateLastName,
                      theContentPadding: 5.0.sp,
                    ),
                    SizedBox(height: 2.0.hp),
                    ThemeText(
                        theText: "tr_firstname_star".tr,
                        thefontSize: 12.0.sp,
                        theColor: black),
                    SizedBox(height: 0.5.hp),
                    ThemeInput(
                      theLabelText: "tr_firstname_star".tr,
                      theHintText: "tr_firstname_star".tr,
                      theTextEditingController:
                          registerController.firstNameEditingController,
                      theValidation: registerController.validateFirstName,
                      theContentPadding: 5.0.sp,
                    ),
                    SizedBox(height: 2.0.hp),
                    ThemeText(
                        theText: "tr_address_email_star".tr,
                        thefontSize: 12.0.sp,
                        theColor: black),
                    SizedBox(height: 0.5.hp),
                    ThemeInput(
                        theLabelText: "tr_address_email_star".tr,
                        theHintText: "tr_address_email_star".tr,
                        theTextEditingController:
                            registerController.emailEditingController,
                        theValidation: registerController.validateEmail,
                        theContentPadding: 5.0.sp),
                    SizedBox(height: 2.0.hp),
                    ThemeText(
                        theText: "tr_phone_number_star".tr,
                        thefontSize: 12.0.sp,
                        theColor: black),
                    SizedBox(height: 0.5.hp),
                    ThemeInput(
                        theLabelText: "+212-600-000000",
                        theHintText: "+212-600-000000",
                        theTextEditingController:
                            registerController.mobileEditingController,
                        theValidation: registerController.validatePhoneNumber,
                        theKeyboardType: TextInputType.phone,
                        theMaxLength: 13,
                        //thePrefixWidget: ThemeText(theText: "+212", thefontSize: 4.0.wp, theColor: lightGrey),
                        theContentPadding: 5.0.sp),
                    SizedBox(height: 2.0.hp),
                    ThemeText(
                        theText: "tr_password_star".tr,
                        thefontSize: 12.0.sp,
                        theColor: black),
                    SizedBox(height: 0.5.hp),
                    Obx(
                      () => ThemeInput(
                        theLabelText: "tr_password_star".tr,
                        theHintText: "tr_password_star".tr,
                        theTextEditingController:
                            registerController.passwordEditingController,
                        theValidation: registerController.validatePassword,
                        theContentPadding: 5.0.sp,
                        theTextVisibilty:
                            registerController.isObscurePassword.value,
                        theIconWidget: IconButton(
                          icon: Icon(
                            registerController.isObscurePassword.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            registerController.togglePasswordVisibilty(
                                registerController.isObscurePassword.value);
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 2.0.hp),
                    ThemeText(
                        theText: "tr_password_confirmation".tr,
                        thefontSize: 12.0.sp,
                        theColor: black),
                    SizedBox(height: 0.5.hp),
                    Obx(
                      () => ThemeInput(
                        theLabelText: "tr_password_star".tr,
                        theHintText: "tr_password_star".tr,
                        theTextEditingController:
                            registerController.confirmPasswordEditingController,
                        theValidation:
                            registerController.validatePasswordConfirmation,
                        theContentPadding: 5.0.sp,
                        theTextVisibilty:
                            registerController.isObscureConfirmation.value,
                        theFloatingLabelBehaviour: FloatingLabelBehavior.never,
                        theIconWidget: IconButton(
                          icon: Icon(
                            registerController.isObscureConfirmation.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            registerController
                                .togglePasswordConfirmationVisibilty(
                                    registerController
                                        .isObscureConfirmation.value);
                          },
                        ),
                      ),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Obx(
                        () => Checkbox(
                          activeColor: grey,
                          value: registerController.isChecked.value,
                          onChanged: (value) {
                            registerController.changeCheckbox(
                                registerController.isChecked.value);
                          },
                        ),
                      ),
                      Container(
                          width: 60.0.wp,
                          child: ThemeText(
                              theText:
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod",
                              thefontSize: 9.0.sp,
                              theColor: grey)),
                      SizedBox(width: 5.0.wp),
                    ]),
                    SizedBox(height: 2.0.hp),
                    Obx(
                      () => Center(
                        child: ThemeButton(
                            theColor: grey,
                            theWidth: 65.0.wp,
                            theHeight: 6.5.hp,
                            theBorderRadius: 2.0.wp,
                            theContent: ThemeText(
                                theText: "tr_register".tr,
                                thefontSize: 12.0.sp,
                                theFontWeight: FontWeight.bold,
                                theColor: white),
                            theFormKey: registerController.formKey,
                            theAction: registerController.register,
                            theLoadingStatus:
                                registerController.isLoading.value),
                      ),
                    ),
                    // SizedBox(height: 2.0.hp),
                    // InkWell(
                    //   onTap: () {
                    //     registerController.updateProfilePicture();
                    //   },
                    //   child: CircleAvatar(
                    //     backgroundImage: AssetImage('assets/icons/user.png')
                    //         as ImageProvider,
                    //   ),
                    // ),
                    // Obx(
                    //   () => ThemeButton(
                    //     theContent: Text("tr_register".tr),
                    //     theAction: registerController.register,
                    //     theFormKey: registerController.formKey,
                    //     theLoadingStatus:
                    //         registerController.isLoading.value,
                    //   ),
                    // ),
                    SizedBox(height: 2.0.hp),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
