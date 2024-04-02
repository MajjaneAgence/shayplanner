import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shayplanner/components/salon_sheet/salon_sheet_screen.dart';
import 'package:shayplanner/components/salons/salons_service.dart';
import 'package:shayplanner/components/take_appointement/take_appointement_screen.dart';
import 'package:shayplanner/models/salon_model.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/theme/theme_snackbar.dart';
import 'package:shayplanner/theme/theme_text.dart';
import 'package:shayplanner/tools/extension.dart';

class SalonsController extends GetxController {
  TextEditingController keywordEditingController = TextEditingController();
  RxBool isShowingWorkHours = false.obs;
  RxBool isLoadingSalons = false.obs;
  RxBool isLoadingBookAppointment = false.obs;
  RxList<SalonModel> salons = <SalonModel>[].obs;
  Rx<SalonModel?> salon = SalonModel().obs;

  Map<String, dynamic> arguments;
  SalonsController(this.arguments);
  @override
  void onInit() async {
    super.onInit();
    String filter = arguments['filterBy'];
    if (filter == "latestSalons") {
      int salonId = arguments['salon_id'];
      getSalonDetails(salonId);
    } else if (filter == "categories") {
      int categoryId = arguments['category_id'];
      getSalonsByCategory(categoryId);
    }
  }

  dontValidate(String password) {
    return null;
  }

  searchShop(String keyword) {
    print("searching");
  }

  book() {}
  goToSalonSheet() {
    print("test");
    Get.toNamed(SalonSheetScreen.routename);
  }

  List<Widget> buildDaysList(days) {
    List<Widget> daysList = [];
    for (String day in days) {
      daysList.add(
        InkWell(
          onTap: () {
            // showWorkHours();
          },
          child: Container(
            margin: EdgeInsets.only(left: 2.0.wp, top: 5.0.sp, bottom: 5.0.sp),
            padding: EdgeInsets.symmetric(horizontal: 4.0.sp, vertical: 2.0.sp),
            width: 8.0.hp,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: grey,
            ),
            child: Center(
              child: ThemeText(
                theText: day,
                thefontSize: 8.0.sp,
                theColor: white,
                theFontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
    }

    return daysList;
  }

  showWorkHours() {
    isShowingWorkHours.value = !isShowingWorkHours.value;
    isShowingWorkHours.refresh();
  }

  getSalonDetails(id) async {
    isLoadingSalons.value = true;
    isLoadingSalons.refresh();
    SalonsService().apiSalonDetails(id).then((value) async {
      isLoadingSalons.value = false;
      isLoadingSalons.refresh();
      var body = jsonDecode(value.body);
      print(body);
      if (body["success"]) {
        salon.value = SalonModel.fromJson(body["data"]);
        salon.refresh();
      } else {
        themeSnackBar(body["message"]);
      }
    });
  }

  getSalonsByCategory(id) async {
    isLoadingSalons.value = true;
    isLoadingSalons.refresh();
    SalonsService().apiSalonsByCategory(id).then((value) async {
      isLoadingSalons.value = false;
      isLoadingSalons.refresh();
      var body = jsonDecode(value.body);
      print(body);
      if (body["success"]) {
        salons.clear();
        for (var salon in body["data"]) {
          salons.add(SalonModel.fromJson(salon));
        }
        salons.refresh();
      } else {
        themeSnackBar(body["message"]);
      }
    });
  }

  List<Widget> buildDaysListLoading() {
    List<Widget> daysList = [];
    DateTime now = DateTime.now();
    final dateFormat = DateFormat('EEE d', 'fr');
    for (int i = 0; i < 7; i++) {
      DateTime day = now.add(Duration(days: i));
      String dayName = dateFormat.format(day);
      daysList.add(
        InkWell(
            onTap: () {
              showWorkHours();
            },
            child: Container(
                margin:
                    EdgeInsets.only(left: 2.0.wp, top: 5.0.sp, bottom: 5.0.sp),
                padding:
                    EdgeInsets.symmetric(horizontal: 4.0.sp, vertical: 2.0.sp),
                width: 8.0.hp,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: grey,
                ),
                child: Center(
                  child: ThemeText(
                    theText: dayName,
                    thefontSize: 8.0.sp,
                    theColor: white,
                    theFontWeight: FontWeight.bold,
                  ),
                ))),
      );
    }

    return daysList;
  }

  goToTakeAppointement(salonId)  {
   var args = {'salon_id': salonId};
    Get.toNamed(TakeAppointementScreen.routename,
        arguments: args);
  }
}
