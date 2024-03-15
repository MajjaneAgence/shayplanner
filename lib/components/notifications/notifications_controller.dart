import 'dart:convert';
import 'dart:io';
import 'package:shayplanner/components/api/api_helper.dart';
import 'package:shayplanner/components/login/login_screen.dart';
import 'package:shayplanner/components/profile/profile_editing_screens/change_password_screen.dart';
import 'package:shayplanner/components/profile/profile_editing_screens/personal_infos_screen.dart';
import 'package:shayplanner/components/profile/profile_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shayplanner/models/user_model.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/theme/theme_snackbar.dart';
import 'package:shayplanner/theme/theme_text.dart';
import 'package:shayplanner/tools/extension.dart';

class NotificationsController extends GetxController {
  final formKeyEditPersoInfos = GlobalKey<FormState>();
  final formKeyChangePassword = GlobalKey<FormState>();

  TextEditingController firstNameEditingController = TextEditingController();
  TextEditingController lastNameEditingContoller = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController mobileEditingContoller = TextEditingController();
  TextEditingController addressEditingContoller = TextEditingController();
  TextEditingController oldPasswordEditingController = TextEditingController();
  TextEditingController newPasswordEditingController = TextEditingController();
  TextEditingController newPasswordConfirmaEditingController =
      TextEditingController();

  RxBool isLoadingCurrentUser = false.obs;
  RxBool isSubmittingForm = false.obs;
  RxBool isloadingChangePassword = false.obs;
  RxBool isEditingEnabled = false.obs;
  RxBool isOldPasswordObscure = true.obs;
  RxBool isNewPasswordObscure = true.obs;
  RxBool isObscureConfirmation = true.obs;
  Rx<UserModel?> user = UserModel().obs;
  Rx<File> picture = Rx<File>(File(''));

  @override
  void onInit() async {
    super.onInit();
  }

  Future<bool?> confirmDismiss(direction) async {
    bool dismiss = false;
    await Get.dialog(
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.wp),
            child: Container(
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0.sp),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(10.0.wp),
                child: Material(
                  child: Column(
                    children: [
                      SizedBox(height: 3.0.hp),
                      ThemeText(
                        theText: "tr_delete_confirmation".tr,
                        thefontSize: 13.0.sp,
                        theColor: black,
                        theFontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 2.0.hp),
                      ThemeText(
                        theText:
                            "tr_are_you_sure_you_wanna_delete_notification".tr,
                        thefontSize: 12.0.sp,
                        theColor: black,
                        theTextAlign: TextAlign.center,
                      ),
                      SizedBox(height: 4.0.hp),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: crem,
                                foregroundColor: white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {
                                dismiss = false;
                                Get.back();
                              },
                              child: Text(
                                'tr_no_answer'.tr,
                              ),
                            ),
                          ),
                           SizedBox(width: 5.0.wp),
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: crem,
                                foregroundColor: white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {
                                dismiss = true;
                                Get.back();
                              },
                              child: Text(
                                'tr_yes_answer'.tr,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
    return dismiss;
  }

  String? validateFirstName(String firstname) {
    if (firstname.isNotEmpty) {
      return null;
    } else {
      return "tr_enter_valid_firstname".tr;
    }
  }

  String? validateLastName(String lastname) {
    if (lastname.isNotEmpty) {
      return null;
    } else {
      return "tr_enter_valid_lastname".tr;
    }
  }

  String? validateEmail(String email) {
    if (GetUtils.isEmail(email)) {
      return null;
    } else {
      return "tr_enter_valid_email_address".tr;
    }
  }

  String? validatePhoneNumber(String value) {
    // Regex pattern to match the desired format +212617052369
    String pattern = r'^\+212\d{9}$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return 'tr_enter_valid_phone_number'.tr;
    }
    return null;
  }

  String? validateAddress(String address) {
    return null;
    // if (address.isNotEmpty) {
    //   return null;
    // } else {
    //   return "tr_enter_valid_address".tr;
    // }
  }

  updatePersonalInformations() {
    isSubmittingForm.value = true;
    isSubmittingForm.refresh();
    profileService()
        .apiUpdateProfileInfos(
            firstNameEditingController.text,
            lastNameEditingContoller.text,
            emailEditingController.text,
            mobileEditingContoller.text,
            addressEditingContoller.text)
        .then((value) async {
      var body = jsonDecode(value.body);
      isSubmittingForm.value = false;
      isSubmittingForm.refresh();
      print(body);
      if (body["success"]) {
        user.value = UserModel.fromJson(body["data"]);
        user.refresh();
        themeSnackBar("tr_your_infos_have_been_updated_successfully".tr);
      } else {
        if (body["message"] == "validationError") {
          String errorMessage = '';
          body["data"].forEach((key, value) {
            //errorMessage += '$key: ${value.join(', ')}\n';
            errorMessage += '${value.join(', ')}\n';
          });
          themeSnackBar(errorMessage);
        } else {
          themeSnackBar(body["message"]);
        }
      }
    });
  }

  enableEditing() {
    isEditingEnabled.value = true;
    isEditingEnabled.refresh();
  }

  goToProfileEditing()async {

     String? token  = await ApiHelper().getToken();
    if(token!=null){ 
    isEditingEnabled.value = false;
    isEditingEnabled.refresh();
    firstNameEditingController.text = user.value!.firstname ?? "";
    lastNameEditingContoller.text = user.value!.lastname ?? "";
    emailEditingController.text = user.value!.email ?? "";
    mobileEditingContoller.text = user.value!.mobile ?? "";
    addressEditingContoller.text = user.value!.address ?? "";
    Get.toNamed(PersonalInfosScreen.routename);
    }else{
      Get.toNamed(LoginScreenForEmailAndSocial.routename);
    }
  }

  String? validateOldPassword(String password) {
    if (password.isNotEmpty) {
      return null;
    } else {
      return "tr_enter_password".tr;
    }
  }

  String? validateNewPassword(String password) {
    if (password.isNotEmpty) {
      return null;
    } else {
      return "tr_enter_password".tr;
    }
  }

  validatePasswordConfirmation(String passwordConfirmation) {
    if (passwordConfirmation.isEmpty) {
      return "tr_enter_password".tr;
    } else if (passwordConfirmation != newPasswordEditingController.text) {
      return "tr_incorrect_password_confirmation".tr;
    }
  }

  toggleOldPasswordVisibilty(bool visibilty) {
    isOldPasswordObscure.value = !visibilty;
    isOldPasswordObscure.refresh();
  }

  toggleNewPasswordVisibilty(bool visibilty) {
    isNewPasswordObscure.value = !visibilty;
    isNewPasswordObscure.refresh();
  }

  togglePasswordConfirmationVisibilty(bool visibilty) {
    isObscureConfirmation.value = !visibilty;
    isObscureConfirmation.refresh();
  }

  goTochangePassword() {
    isEditingEnabled.value = false;
    isEditingEnabled.refresh();
    isSubmittingForm.value = false;
    isEditingEnabled.refresh();
    isloadingChangePassword.value = false;
    isloadingChangePassword.refresh();
    oldPasswordEditingController.clear();
    newPasswordEditingController.clear();
    newPasswordConfirmaEditingController.clear();
    Get.toNamed(ChangePasswordScreen.routename);
  }

  changePassword() {
    isloadingChangePassword.value = true;
    isloadingChangePassword.refresh();
    profileService()
        .apiChangePassword(
      oldPasswordEditingController.text,
      newPasswordEditingController.text,
      newPasswordConfirmaEditingController.text,
    )
        .then((value) async {
      var body = jsonDecode(value.body);
      isloadingChangePassword.value = false;
      isloadingChangePassword.refresh();
      print(body);
      if (body["success"]) {
        themeSnackBar("tr_you_re_password_has_been_chnaged_sucessfully".tr);
      } else {
        if (body["message"] == "validationError") {
          String errorMessage = '';
          body["data"].forEach((key, value) {
            //errorMessage += '$key: ${value.join(', ')}\n';
            errorMessage += '${value.join(', ')}\n';
          });
          themeSnackBar(errorMessage);
        } else {
          themeSnackBar(body["message"]);
        }
      }
    });
  }
}