import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/tools/extension.dart';

void themeSnackBar(String message) {
  Get.snackbar(
    message,
    '',
    backgroundColor: crem,
    borderRadius: 4.0.sp,
    messageText: Container(),
    colorText: Colors.white,
    snackPosition: SnackPosition.TOP,
    padding: EdgeInsets.all(10.0.sp),
    icon: const Icon(Icons.error, color: Colors.white),
  );
}
