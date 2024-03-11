import 'dart:convert';
import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shayplanner/components/forgot_password/forgot_password_screen.dart';
import 'package:shayplanner/components/home/home_screen.dart';
import 'package:shayplanner/components/login/login_screen.dart';
import 'package:shayplanner/components/login/login_service.dart';
import 'package:shayplanner/components/profile/profile_service.dart';
import 'package:shayplanner/components/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shayplanner/models/user_model.dart';
import 'package:shayplanner/theme/theme_snackbar.dart';
import 'package:shayplanner/tools/extension.dart';

class ProfileController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();

  TextEditingController usernameEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  RxBool isLoadingCurrentUser = false.obs;
  LoginService loginService = LoginService();
  RxBool isChecked = false.obs;
  RxBool isObscure = true.obs;
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
    String capitalizedName = name.replaceFirstMapped(
      RegExp(r'^\w'),
      (match) => match.group(0)!.toUpperCase().toString(),
    );
    return capitalizedName;
  }
}
