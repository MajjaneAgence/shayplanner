import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shayplanner/components/login/login_screen.dart';
import 'package:shayplanner/components/pin_verfication/pin_verification_screen.dart';
import 'package:shayplanner/components/register/register_service.dart';
import 'package:shayplanner/components/register/salon_infos_screen.dart';
import 'package:shayplanner/theme/theme_snackbar.dart';

class RegisterController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final formKeySalonInfos = GlobalKey<FormState>();
  TextEditingController firstNameEditingController = TextEditingController();
  TextEditingController lastNameEditingController = TextEditingController();

  TextEditingController labelStyle = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  TextEditingController confirmPasswordEditingController =
      TextEditingController();
  TextEditingController mobileEditingController = TextEditingController();
  TextEditingController salonNameEditingController = TextEditingController();
  TextEditingController salonAddressEditingController = TextEditingController();
  TextEditingController cityEditingController = TextEditingController();
  TextEditingController postalCodeEditingController = TextEditingController();
  TextEditingController patentEditingController = TextEditingController();

  String argument;
  RegisterController(this.argument);

  final double _kItemExtent = 32;
  final List _cities = [
    "Casablanca",
    "Rabat",
    "Marrakech",
    "Tanger",
    "Agadir",
    "Fès",
    "Meknès",
    "Oujda",
    "Kénitra",
    "Tétouan",
    "Safi",
    "Mohammedia",
    "El Jadida",
    "Khouribga",
    "Beni Mellal",
    "Témara",
    "Nador",
    "Ksar El Kebir",
    "Settat",
    "Salé",
  ];
  RxBool isObscurePassword = true.obs;
  RxBool isObscureConfirmation = true.obs;
  Rx<File> picture = Rx<File>(File(''));
  Rx<File> patentFile = Rx<File>(File(''));
  RxBool isLoading = false.obs;
  RxBool isChecked = false.obs;

  @override
  void onInit() async {
    super.onInit();
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

  String? validatePassword(String password) {
    if (password.isNotEmpty) {
      return null;
    } else {
      return "tr_enter_password".tr;
    }
  }

  String? validateConfirmPassword(String confirmPassword) {
    if (confirmPassword.isNotEmpty) {
      return null;
    } else {
      return "tr_confirm_password_doent_math".tr;
    }
  }

  validatePasswordConfirmation(String passwordConfirmation) {
    if (passwordConfirmation.isEmpty) {
      return "tr_enter_password".tr;
    } else if (passwordConfirmation != passwordEditingController.text) {
      return "tr_incorrect_password_confirmation".tr;
    }
  }

  validateSalonName(String salonName) {
    if (salonName.isEmpty) {
      return "tr_enter_salon_name".tr;
    }
  }

  validateSalonAddress(String salonAddress) {
    if (salonAddress.isEmpty) {
      return "tr_enter_salon_address".tr;
    }
  }

  validateSalonCity(String salonAddress) {
    if (salonAddress.isEmpty) {
      return "tr_enter_salon_address".tr;
    }
  }

  validateDropDown(cityEditingController) {
    if (cityEditingController.value.text.isEmpty) {
      return "Ce champ est obligatoire";
    }
    return null;
  }

  togglePasswordVisibilty(bool visibilty) {
    print(isObscurePassword.value);
    isObscurePassword.value = !visibilty;
    isObscurePassword.refresh();
    print(isObscurePassword.value);
  }

  togglePasswordConfirmationVisibilty(bool visibilty) {
    print(isObscureConfirmation.value);
    isObscureConfirmation.value = !visibilty;
    isObscureConfirmation.refresh();
    print(isObscureConfirmation.value);
  }

  sendOtp() {
    if (isChecked.value) {
      isLoading.value = true;
      isLoading.refresh();
       RegisterService()
        .apiSendOtpOnSignUp(mobileEditingController.text).then((value) async {
      var body = jsonDecode(value.body);
      isLoading.value = false;
      isLoading.refresh();
      print(body);
      if (body["success"]) {
        Get.toNamed(PinCodeVerificationScreen.routename);
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
    } else {
      themeSnackBar("tr_accept_general_condions".tr);
    }
  }
   


  register() {
    RegisterService()
        .apiRegister(
            firstNameEditingController.text,
            lastNameEditingController.text,
            emailEditingController.text,
            passwordEditingController.text,
            confirmPasswordEditingController.text,
            mobileEditingController.text
            //picture.value
            )
        .then((value) async {
      var body = jsonDecode(value.body);
      isLoading.value = false;
      isLoading.refresh();
      print(body);
      if (body["success"]) {
        // await secureStorage.write(
        //     key: "token", value: body["data"]['token']);
        // print(await secureStorage.read(key: "token"));
        Get.offAllNamed(LoginScreen.routename);
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

  updateProfilePicture() async {
    Get.defaultDialog(
        title: "Télécharger une photo",
        titleStyle: (Get.width > 500)
            ? TextStyle(fontSize: Get.width / 50, fontWeight: FontWeight.w500)
            : TextStyle(
                fontSize: Get.width * 0.05, fontWeight: FontWeight.w500),
        content: Obx(
          () {
            var textStyle = TextStyle(fontSize: Get.width * 0.04);
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
                        Get.back();
                      },
                      child: Text('Save')),
                ListTile(
                  leading: Icon(
                    Icons.camera_alt,
                    size: 25,
                  ),
                  title: Text("Prendre une photo",
                      style: (Get.width > 500)
                          ? textStyle.copyWith(fontSize: Get.width / 50)
                          : textStyle),
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
                  title: Text("Choisir une photo",
                      style: (Get.width > 500)
                          ? textStyle.copyWith(fontSize: Get.width / 50)
                          : textStyle),
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

  changeCheckbox(value) {
    print(isChecked.value);
    isChecked.value = !value;
    isChecked.refresh();
    print(isChecked.value);
  }

  selectCity() {
    showCupertinoModalPopup<void>(
        context: Get.context!,
        builder: (BuildContext context) => Container(
            height: 250,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: CupertinoColors.white.withOpacity(0.9),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text("Ok")),
                ),
                Expanded(
                    child: CupertinoPicker(
                  magnification: 1.22,
                  squeeze: 1.2,
                  useMagnifier: true,
                  itemExtent: _kItemExtent,
                  // This is called when selected item is changed.
                  onSelectedItemChanged: (int selectedItem) {
                    cityEditingController.text =
                        _cities[selectedItem].toString();
                  },

                  children: List<Widget>.generate(_cities.length, (int index) {
                    return Center(
                      child: Text(
                        _cities[index].toString(),
                      ),
                    );
                  }),
                ))
              ],
            )));
  }

  continueToSalonInfos() {
    Get.toNamed(SalonInfosScreen.routename, arguments: "pro");
  }

  validatePostalCode(String postalCode) {
    if (postalCode.isEmpty) {
      return "tr_enter_salon_address".tr;
    }
  }

  validatePatent(String patent) {
    if (patent.isEmpty) {
      return "tr_patent_is_required";
    }
    return null;
  }

  validatePicture() {
    if (picture.value.path != '') {
      return "tr_picture_is_required";
    }
    return null;
  }

  validatePatentFile() {
    if (patentFile.value.path == '') {
      return "tr_patent_file_is_required";
    }
    return null;
  }

  addPatentFile() async {
    Get.defaultDialog(
        title: "Télécharger une photo",
        titleStyle: (Get.width > 500)
            ? TextStyle(fontSize: Get.width / 50, fontWeight: FontWeight.w500)
            : TextStyle(
                fontSize: Get.width * 0.05, fontWeight: FontWeight.w500),
        content: Obx(
          () {
            var textStyle = TextStyle(fontSize: Get.width * 0.04);
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
                        Get.back();
                      },
                      child: Text('Save')),
                ListTile(
                  leading: Icon(Icons.photo),
                  title: Text("Choisir un ficher",
                      style: (Get.width > 500)
                          ? textStyle.copyWith(fontSize: Get.width / 50)
                          : textStyle),
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
}
