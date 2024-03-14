import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shayplanner/components/api/api_helper.dart';
import 'package:shayplanner/components/home/home_service.dart';
import 'package:get/get.dart';
import 'package:shayplanner/components/login/login_screen.dart';
import 'package:shayplanner/models/category_model.dart';
import 'package:shayplanner/theme/theme_snackbar.dart';

class HomeController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController shopNameEditingController = TextEditingController();
  TextEditingController shopAddressEditingController = TextEditingController();
  RxBool isLoadingCategories = false.obs;
  RxBool isLoadingLatestSalons = false.obs;
  RxString selectedLanguage = Get.locale!.languageCode.obs;
  RxList<CategoryModel> categories = <CategoryModel>[].obs;
  // List of items in our dropdown menu
  final List<String> lanuages = ['Français', 'English', 'العربية'];
  final List<String> modelsImages =['assets/images/home/models.jpg','assets/images/home/models.jpg'];
  RxInt currentIndex = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    getCatgories();
    getLatestSalons();
  }

  getCatgories() async {
    isLoadingCategories.value = true;
    isLoadingCategories.refresh();
    HomeService().apiGetCategories().then((value) async {
      isLoadingCategories.value = false;
      isLoadingCategories.refresh();
      var body = jsonDecode(value.body);
      print(body);
      if (body["success"]) {
        categories.clear();
        for (var category in body["data"]) {
          categories.add(CategoryModel.fromJson(category));
        }
        categories.refresh();
      } else {
        themeSnackBar(body["message"]);
      }
    });
  }

  getLatestSalons() async {
    isLoadingLatestSalons.value = true;
    isLoadingLatestSalons.refresh();
    await Future.delayed(Duration(seconds: 5));
    isLoadingLatestSalons.value = false;
    isLoadingLatestSalons.refresh();
  }

  changeLanguage(String language) async {
    var lang="fr";
    if (language == "Français") {
      lang = "fr";
    } else if (language == "English") {
      lang = "en";
    } else {
      lang = "ar";
    }
    selectedLanguage.value=lang;
    selectedLanguage.refresh();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('language', lang);
    Get.updateLocale(Locale(lang));
    print(Get.locale);
    Get.back();
  }

  validateFirstName(String email) {
    if (GetUtils.isEmail(email)) {
      return null;
    } else {
      return "tr_enter_valid_firstname".tr;
    }
  }
}
