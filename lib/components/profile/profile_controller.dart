import 'dart:convert';
import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shayplanner/components/forgot_password/forgot_password_screen.dart';
import 'package:shayplanner/components/home/home_screen.dart';
import 'package:shayplanner/components/login/login_screen.dart';
import 'package:shayplanner/components/login/login_service.dart';
import 'package:shayplanner/components/profile/profile_editing_screens/change_password_screen.dart';
import 'package:shayplanner/components/profile/profile_editing_screens/personal_infos_screen.dart';
import 'package:shayplanner/components/profile/profile_screen.dart';
import 'package:shayplanner/components/profile/profile_service.dart';
import 'package:shayplanner/components/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shayplanner/models/user_model.dart';
import 'package:shayplanner/theme/theme_snackbar.dart';
import 'package:shayplanner/tools/extension.dart';

class ProfileController extends GetxController {
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
    getCurrentUser();
  }

  getCurrentUser() async {
    isLoadingCurrentUser.value = true;
    isLoadingCurrentUser.refresh();
    profileService().apiGetCurrentUser().then((value) async {
      isLoadingCurrentUser.value = false;
      isLoadingCurrentUser.refresh();
      var body = jsonDecode(value.body);
      print(body);
      if (body["success"]) {
        user.value = UserModel.fromJson(body["data"]);
        print(user.value?.picture);
      } else {
        themeSnackBar(body["message"]);
      }
    });
  }

  updateProfilePicture() async {
    Get.defaultDialog(
        title: "tr_upload_profile_picture".tr,
        titleStyle: TextStyle(fontSize: 14.0.sp, fontWeight: FontWeight.bold),
        content: Obx(
          () {
            return Column(
              children: [
                if (picture.value.path != '')
                  CircleAvatar(
                    radius: 75,
                    backgroundImage: FileImage(picture.value),
                  ),
                if (picture.value.path != '')
                  TextButton(
                      onPressed: () async {
                        isLoadingCurrentUser.value = true;
                        isLoadingCurrentUser.refresh();
                        profileService()
                            .apiUploadProfilePicture(picture.value)
                            .then((value) async {
                          isLoadingCurrentUser.value = false;
                          isLoadingCurrentUser.refresh();
                          var body = jsonDecode(value.body);
                          print(body);
                          if (body["success"]) {
                            user.value!.picture =
                                body['data']['user']['picture'];
                            user.refresh();
                            picture.value = File('');
                            picture.refresh();
                            Get.back();
                          } else {
                            themeSnackBar(body["message"]);
                          }
                        });
                      },
                      child: user.value!.picture == null
                          ? Text('tr_add_profile_picture'.tr)
                          : Text('tr_change_profile_picture'.tr)),
                ListTile(
                  leading: Icon(
                    Icons.camera_alt,
                    size: 24,
                  ),
                  title: Text("tr_take_picture".tr,
                      style: TextStyle(
                          fontSize: 14.0.sp, fontWeight: FontWeight.bold)),
                  onTap: () async {
                    var image = await ImagePicker()
                        .pickImage(source: ImageSource.camera);
                    if (image != null) {
                      picture.value = File(image.path);
                      update();
                    }
                  },
                ),
                ListTile(
                  leading: Icon(Icons.photo),
                  title: Text("tr_choose_picture".tr,
                      style: TextStyle(
                          fontSize: 14.0.sp, fontWeight: FontWeight.bold)),
                  onTap: () async {
                    var image = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    if (image != null) {
                      picture.value = File(image.path);
                      update();
                    }
                  },
                )
              ],
            );
          },
        ));
  }

  String transformFirstLetterToupperCase(name) {
    if (name != null) {
      String capitalizedName = name.replaceFirstMapped(
        RegExp(r'^\w'),
        (match) => match.group(0)!.toUpperCase().toString(),
      );
      return capitalizedName;
    }
    return "";
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

  goToProfileEditing() {
    isEditingEnabled.value = false;
    isEditingEnabled.refresh();
    firstNameEditingController.text = user.value!.firstname ?? "";
    lastNameEditingContoller.text = user.value!.lastname ?? "";
    emailEditingController.text = user.value!.email ?? "";
    mobileEditingContoller.text = user.value!.mobile ?? "";
    addressEditingContoller.text = user.value!.address ?? "";
    Get.toNamed(PersonalInfosScreen.routename);
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