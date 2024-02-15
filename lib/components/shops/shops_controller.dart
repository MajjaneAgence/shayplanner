import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/theme/theme_text.dart';
import 'package:shayplanner/tools/extension.dart';

class ShopsController extends GetxController {
  TextEditingController keywordEditingController = TextEditingController();
   RxBool isShowingWorkHours = false.obs;
  RxBool isLoading = false.obs;

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

  validateConfirmPassword(String confirmPassword) {
    if (confirmPassword.isNotEmpty) {
      return null;
    } else {
      return "tr_confirm_password_doent_math".tr;
    }
  }

  register() async {
    print('here');
    isLoading.value = true;
    isLoading.refresh();
    await Future.delayed(const Duration(seconds: 3));
    isLoading.value = false;
    isLoading.refresh();
  }

  searchShop(String keyword) {
    print("searching");
  }

  book() {}
  goToSalonSheet() {print("ggg");}

  List<Widget> buildDaysList() {
    List<Widget> daysList = [];
    DateTime now = DateTime.now();
    final dateFormat = DateFormat('EEE d','fr');
    for (int i = 0; i < 7; i++) {
      DateTime day = now.add(Duration(days: i));
      String dayName = dateFormat.format(day);
      daysList.add(
        InkWell(
          onTap: () {
            showWorkHours();
          },
          child:
          Container(
          margin: EdgeInsets.only(left: 2.0.wp, top:5.0.sp,bottom:5.0.sp),
          padding: EdgeInsets.symmetric(horizontal: 4.0.sp, vertical: 2.0.sp),
          width: 8.0.hp,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: grey,
          ),
          child:Center(child: ThemeText(
            theText: dayName,
            thefontSize: 9.0.sp,
            theColor: white,
            theFontWeight: FontWeight.bold,
          ),)
        )),
      );
    }

    return daysList;
  }

  showWorkHours(){
    isShowingWorkHours.value=!isShowingWorkHours.value;
    isShowingWorkHours.refresh();
  }

   getData() async {
    await Future.delayed(Duration(seconds: 10));
  }
}
