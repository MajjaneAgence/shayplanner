import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:shayplanner/components/home/home_service.dart';
import 'package:shayplanner/components/login/login_screen.dart';
import 'package:shayplanner/components/rating_app/rating_app_screen.dart';
import 'package:shayplanner/components/salon_sheet/salon_sheet_service.dart';
import 'package:shayplanner/models/category_model.dart';
import 'package:shayplanner/models/salon_model.dart';
import 'package:shayplanner/theme/theme_snackbar.dart';

class SalonSheetController extends GetxController {
  // Data properties (if any)
  bool isLoadingSalonGallery = true;
  List<String> salonImages = [
    'assets/images/salon_sheet.png',
    'assets/images/salon_sheet.png',
    'assets/images/model_on_mirror.png',
    'assets/images/salon_sheet.png',
    'assets/images/salon_sheet.png',
  ];
  CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  bool isExpanded = false;
  bool isLoadingCategories=false;
  SalonModel salon = SalonModel();
  Map<String, dynamic> arguments;
  List<CategoryModel> categories = <CategoryModel>[];

  SalonSheetController(this.arguments);
  List<String> secourImages = [
    'assets/images/take_appointement/no_image_available.jpg',
  ];
void onInit() async {
    super.onInit();
    int salonId = arguments['salon_id'];
    print(salonId);
    getSalonGallery(salonId);
    getCategoriesBySalon(salonId);
  }
  void toggleExpanded() {
    isExpanded = !isExpanded;
    update();
  }

   getCategoriesBySalon(salonId) async {
    isLoadingCategories = true;
    SalonSheetService().apiGetCategoriesBySalon(salonId).then((value) async {
      isLoadingCategories = false;
      var body = jsonDecode(value.body);
      print(body);
      if (body["success"]) {
        categories.clear();
        for (var category in body["data"]) {
          categories.add(CategoryModel.fromJson(category));
        }
      } else {
        themeSnackBar(body["message"]);
      }
    });
  }

  String salonDesc =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. \nUt enim ad minim veniam, quis nostrud adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat";
  // Functions for interaction (e.g., button presses, fetching data)

  void onButton2Pressed() async {
    Get.toNamed(RatingAppScreen.routename);
  }

  getSalonGallery(salonId) {
    isLoadingSalonGallery = true;
    update();
    SalonSheetService().apiGetSalonGallery(salonId).then((value) async {
      isLoadingSalonGallery = false;
      var body = jsonDecode(value.body);
      print(body);
      if (body["success"]) {
        salon = SalonModel.fromJson(body["data"]["salon"]);
        salonImages.clear();
        salonImages = salon.gallery!;
        update();
      } else {
        themeSnackBar(body["message"]);
      }
    });
  }

  doSomething() {}
}
