import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shayplanner/components/future_appointement/future_appointment_service.dart';
import 'package:shayplanner/models/appointement_model.dart';
import 'package:shayplanner/models/user_model.dart';
import 'package:shayplanner/theme/theme_snackbar.dart';

class FutureAppointementController extends GetxController {
  bool isLoadingFutureAppointment = false;
  TextEditingController keywordEditingController = TextEditingController();
  List<AppointementModel> appointments = <AppointementModel>[];

  @override
  void onInit() async {
    super.onInit();
    getFutureAppointement();
  }

  getFutureAppointement() {
isLoadingFutureAppointment = true;
    update();
    FutureAppointementService().apiGetFutureAppointment().then((value) async {
      var body = jsonDecode(value.body);
      print(body);
      if (body["success"]) {
        isLoadingFutureAppointment = false;
        appointments.clear();
        for (var appointment in body["data"]) {
          appointments.add(AppointementModel.fromJson(appointment));
        }
        update();
      } else {
        themeSnackBar(body["message"]);
      }
    });
  }

  dontValidate(String password) {
    return null;
  }

  doSomething() {}
}
