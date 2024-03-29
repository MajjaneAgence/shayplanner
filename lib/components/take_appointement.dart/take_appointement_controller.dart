import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:shayplanner/components/login/login_screen.dart';
import 'package:shayplanner/components/rating_app/rating_app_screen.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/theme/theme_text.dart';
import 'package:shayplanner/tools/extension.dart';
import 'package:table_calendar/table_calendar.dart';

class TakeAppointmentController extends GetxController {
  // Data properties (if any)

  final String LoginStatus;
  TakeAppointmentController(this.LoginStatus);
  RxBool isLoading = false.obs;
  RxString? errorMessage;
  List<String> salonImages = [
    'assets/images/salon_sheet.png',
    'assets/images/salon_sheet.png',
    'assets/images/model_on_mirror.png',
    'assets/images/salon_sheet.png',
    'assets/images/salon_sheet.png',
  ];
  CarouselController carouselController = CarouselController();
  RxInt currentIndex = 0.obs;
  RxList<Animal> animals = [
    Animal(id: 1, name: "Lion"),
    Animal(id: 2, name: "Flamingo"),
    Animal(id: 3, name: "Hippo"),
    Animal(id: 4, name: "Horse"),
    Animal(id: 5, name: "Tiger"),
    Animal(id: 6, name: "Penguin"),
    Animal(id: 7, name: "Spider"),
    Animal(id: 8, name: "Snake"),
    Animal(id: 9, name: "Bear"),
    Animal(id: 10, name: "Beaver"),
    Animal(id: 11, name: "Cat"),
    Animal(id: 12, name: "Fish"),
    Animal(id: 13, name: "Rabbit"),
    Animal(id: 14, name: "Mouse"),
    Animal(id: 15, name: "Dog"),
    Animal(id: 16, name: "Zebra"),
    Animal(id: 17, name: "Cow"),
    Animal(id: 18, name: "Frog"),
    Animal(id: 19, name: "Blue Jay"),
    Animal(id: 20, name: "Moose"),
    Animal(id: 21, name: "Gecko"),
    Animal(id: 22, name: "Kangaroo"),
    Animal(id: 23, name: "Shark"),
    Animal(id: 24, name: "Crocodile"),
    Animal(id: 25, name: "Owl"),
    Animal(id: 26, name: "Dragonfly"),
    Animal(id: 27, name: "Dolphin"),
  ].obs;
  RxBool updatee = false.obs;
  RxList<MultiSelectItem<Animal>> items = <MultiSelectItem<Animal>>[].obs;
  RxList<Object?> selectedAnimals2 = [].obs;
  final multiSelectKey = GlobalKey<FormFieldState>();
  doSomething() {}

  @override
  void onInit() {
    super.onInit();
    items.value = animals
        .map((animal) => MultiSelectItem<Animal>(animal, animal.name))
        .toList();
  }

  bookAppointement() {
    Get.dialog(
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.wp),
            child: Container(
              decoration: BoxDecoration(
                color: biege,
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0.sp),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(10.0.wp),
                child: Material(
                  child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 3.0.hp),
                    Row(
                      children: [
                        ThemeText(
                          theText: "tr_select_date_and_hour".tr,
                          thefontSize: 13.0.sp,
                          theColor: black,
                          theFontWeight: FontWeight.bold,
                          theTextAlign: TextAlign.center,
                        ),
                        SvgPicture.asset(
                            "assets/icons/take_appointement/close.svg",
                            width: 18.0.sp,
                            height: 18.0.sp),
                      ],
                    ),
                    SizedBox(height: 4.0.hp),
                    TableCalendar(
                      firstDay: DateTime.utc(2010, 10, 16),
                      lastDay: DateTime.utc(2030, 3, 14),
                      focusedDay: DateTime.now(),
                    )
                  ],
                ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Animal {
  final int id;
  final String name;

  Animal({
    required this.id,
    required this.name,
  });
}
