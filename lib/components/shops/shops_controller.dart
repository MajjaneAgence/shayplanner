import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopsController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController keywordEditingController = TextEditingController();
  RxBool isLoading=false.obs;


  @override
  void onInit() async {
    super.onInit();
  }

  validateFirstName(String email) {
    if (GetUtils.isEmail(email)) {
      return null;
    } else {
      return "tr_enter_valid_firstname".tr;
    }
  }

  validateLastName(String email) {
    if (GetUtils.isEmail(email)) {
      return null;
    } else {
      return "tr_enter_valid_lastname".tr;
    }
  }

  dontValidate(String password) {
      return null;

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
  register() async{
  print('here');
    isLoading.value = true;
    isLoading.refresh();
    await Future.delayed(const Duration(seconds: 3));
    isLoading.value = false;
    isLoading.refresh();
  }

  searchShop(String keyword){
     print("searching");
  }


}
