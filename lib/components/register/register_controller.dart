import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shayplanner/components/register/register_service.dart';
import 'package:shayplanner/theme/theme_snackbar.dart';

class RegisterController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController firstNameEditingController = TextEditingController();
  TextEditingController lastNameEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  TextEditingController confirmPasswordEditingController = TextEditingController();
  TextEditingController mobileEditingController = TextEditingController();
  TextEditingController addressEditingController = TextEditingController();
  Rx<File> picture = Rx<File>(File(''));
  RxBool isLoading=false.obs;


  @override
  void onInit() async {
    super.onInit();
  }

  validateFirstName(String firstname) {
    if (firstname.isNotEmpty) {
      return null;
    } else {
      return "tr_enter_valid_firstname".tr;
    }
  }

  validateLastName(String lastname) {
    if (lastname.isNotEmpty) {
      return null;
    } else {
      return "tr_enter_valid_lastname".tr;
    }
  }

  validateEmail(String password) {
    if (password.isNotEmpty) {
      return null;
    } else {
      return "tr_enter_valid_email_address".tr;
    }
  }

  validatePassword(String password) {
    if (password.isNotEmpty) {
      return null;
    } else {
      return "tr_enter_password".tr;
    }
  }

  validateConfirmPassword(String confirmPassword){
 if (confirmPassword.isNotEmpty) {
      return null;
    } else {
      return "tr_confirm_password_doent_math".tr;
    }
  }

  validateAdress(){

  }
  register(){
  isLoading.value=true;
    isLoading.refresh();
    const FlutterSecureStorage secureStorage = FlutterSecureStorage();
    RegisterService()
        .apiRegister(
          firstNameEditingController.text,
          lastNameEditingController.text,
          emailEditingController.text,
          passwordEditingController.text,
          confirmPasswordEditingController.text,
          mobileEditingController.text,
          addressEditingController.text,
          picture.value
        )
        .then((value) async {
      var body = jsonDecode(value.body);
      isLoading.value=false;
      isLoading.refresh();
      print(body);
      if (body["success"]) {
        await secureStorage.write(
            key: "token", value: body["data"]['api_token']);
        print(await secureStorage.read(key: "token"));
      } else {
       themeSnackBar(body["message"]);
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

}
