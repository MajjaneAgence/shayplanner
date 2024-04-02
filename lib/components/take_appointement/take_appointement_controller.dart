import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shayplanner/components/login/login_screen.dart';
import 'package:shayplanner/components/take_appointement/appointement_recap/appointement_recap.dart';
import 'package:shayplanner/components/take_appointement/take_appointement_service.dart';
import 'package:shayplanner/models/specialite_model.dart';
import 'package:shayplanner/models/user_model.dart';
import 'package:shayplanner/theme/theme_button.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/theme/theme_snackbar.dart';
import 'package:shayplanner/theme/theme_text.dart';
import 'package:shayplanner/tools/extension.dart';
import 'package:table_calendar/table_calendar.dart';

class TakeAppointmentController extends GetxController {
  Map<String, dynamic> arguments;
  TakeAppointmentController(this.arguments);
  bool isLoadingSpecialites = false;
  RxBool isLoadingBookingAppoitement = false.obs;
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
  List<Animal> animals = [
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
  List<MultiSelectItem<SpecialiteModel>> items =
      <MultiSelectItem<SpecialiteModel>>[].obs;
  List<Object?> selectedAnimals2 = [].obs;
  final multiSelectKey = GlobalKey<FormFieldState>();
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  RxBool isLoadingCurrentUser = false.obs;
  Rx<UserModel?> user = UserModel().obs;
  var keySelectDateHour = GlobalKey();
  List<SpecialiteModel> specialites = <SpecialiteModel>[].obs;

  @override
  void onInit() async {
    super.onInit();
    FlutterSecureStorage storage = FlutterSecureStorage();
    String? token = await storage.read(key: 'token');
    if (token != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      print(prefs.getString("mobile"));
      user.value!.firstname = prefs.getString("firstname");
      user.value!.lastname = prefs.getString("lastname");
      user.value!.email = prefs.getString("email");
      user.value!.mobile = prefs.getString("mobile");
      user.refresh();
    }
    int salonId = arguments['salon_id'];
        print(salonId);

    getSpecilaites(salonId);
  }

  void onDaySelected(DateTime day, DateTime focusedDay) {
    selectedDay = day;
    this.focusedDay = focusedDay;
    print(selectedDay);
    update();
  }

  void onFormatChanged(CalendarFormat newFormat) {
    format = newFormat;
    update();
  }

  doSomething() {}

  selectDateAndHour() {
    DateTime selectedDay = DateTime.utc(2010, 10, 16);
    Get.dialog(
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
            child: Container(
              decoration: BoxDecoration(
                color: biege,
                borderRadius: BorderRadius.all(
                  Radius.circular(27.0.sp),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 1.5.hp),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: ThemeText(
                            theText: "tr_choose_date_and_hour".tr,
                            thefontSize: 11.0.sp,
                            theColor: black,
                            theFontWeight: FontWeight.bold,
                            theTextAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: ThemeButton(
                            theWidth: 10.0.wp,
                            theHeight: 11.0.wp,
                            theContent: SvgPicture.asset(
                                "assets/icons/take_appointement/close.svg",
                                width: 15.0.sp,
                                height: 15.0.sp),
                            theColor: white,
                            theLoadingStatus: false,
                            theElevation: 4,
                            theBorderRadius: 10.0.wp,
                            theAction: () {
                              Get.back();
                            },
                            theHorizontalPadding: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 1.5.hp),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0.wp),
                    child: Material(
                      color: Colors.transparent,
                      child: Center(
                        child: GetBuilder<TakeAppointmentController>(
                          init: TakeAppointmentController(arguments),
                          builder: (controller) => Container(
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(15.0.sp),
                            ),
                            child: Stack(children: [
                              TableCalendar(
                                locale: Get.locale!.languageCode,
                                firstDay: DateTime.now(),
                                lastDay: DateTime.utc(2070, 3, 14),
                                focusedDay: controller.focusedDay,
                                startingDayOfWeek: StartingDayOfWeek.monday,
                                availableCalendarFormats: const {
                                  CalendarFormat.month: 'Month'
                                },
                                selectedDayPredicate: (day) {
                                  // Use `selectedDayPredicate` to determine which day is currently selected.
                                  return isSameDay(controller.selectedDay, day);
                                },
                                onDaySelected: controller.onDaySelected,
                                onFormatChanged: controller.onFormatChanged,
                                calendarFormat: controller.format,
                                onPageChanged: (focusedDay) {
                                  // No need to call `setState()` here, GetX manages the state.
                                  controller.focusedDay = focusedDay;
                                },
                                rowHeight: 21.0.sp,
                                daysOfWeekHeight: 30.0.sp,
                                daysOfWeekStyle: DaysOfWeekStyle(
                                    dowTextFormatter: (date, locale) {
                                      // Use DateFormat.EEEE(locale).format(date) to return the full name of the day based on the locale
                                      String dayName =
                                          DateFormat.E(locale).format(date);
                                      // Remove the dot at the end
                                      dayName = dayName.substring(
                                          0, dayName.length - 1);
                                      return dayName
                                              .substring(0, 1)
                                              .toUpperCase() +
                                          dayName.substring(1);
                                    },
                                    weekdayStyle: TextStyle(
                                        fontSize: 10.0.sp, color: black),
                                    weekendStyle: TextStyle(
                                        fontSize: 10.0.sp, color: black)),
                                calendarStyle: CalendarStyle(
                                    selectedDecoration: BoxDecoration(
                                        color: darkOrange,
                                        shape: BoxShape.circle),
                                    todayDecoration: BoxDecoration(
                                        color: grey, shape: BoxShape.circle),
                                    cellMargin: EdgeInsets.all(0),
                                    cellPadding: EdgeInsets.all(0),
                                    tablePadding: EdgeInsets.all(5.0.sp),
                                    defaultTextStyle: TextStyle(
                                        fontSize: 12.0.sp,
                                        fontWeight: FontWeight.bold),
                                    weekendTextStyle: TextStyle(
                                        fontSize: 12.0.sp,
                                        fontWeight: FontWeight.bold)),
                                headerStyle: HeaderStyle(
                                  titleCentered: true,
                                  formatButtonVisible: false,
                                  titleTextFormatter: (DateTime date, locale) {
                                    // Make the first letter uppercase
                                    String month =
                                        DateFormat.MMMM(locale).format(date);
                                    return month.substring(0, 1).toUpperCase() +
                                        month.substring(1);
                                  },
                                  titleTextStyle: TextStyle(
                                      color: darkOrange,
                                      fontSize: 20.0.sp,
                                      fontWeight: FontWeight.bold),
                                  leftChevronIcon: SvgPicture.asset(
                                      "assets/icons/take_appointement/left_chevron.svg",
                                      width: 15.0.sp,
                                      height: 15.0.sp),
                                  rightChevronIcon: SvgPicture.asset(
                                      "assets/icons/take_appointement/right_chevron.svg",
                                      width: 15.0.sp,
                                      height: 15.0.sp),
                                ),
                              ),
                              Positioned(
                                top: 45.0.sp,
                                left: 15.0.sp,
                                right: 15.0.sp,
                                child: Container(
                                  width: 60.0.wp,
                                  height: 2.0.sp,
                                  color: black,
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5.0.hp),
                  Container(
                    width: 70.0.wp,
                    height: 20.0.hp,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(27.0.sp),
                      ),
                    ),
                    child: Column(children: [
                      SizedBox(height: 1.5.hp),
                      ThemeText(
                        theText: "tr_availibility",
                        thefontSize: 14.0.sp,
                        theColor: black,
                        theFontWeight: FontWeight.bold,
                      ),
                      Row(
                        children: [
                          ThemeButton(
                              theWidth: 10.0.wp,
                              theHeight: 3.5.hp,
                              theBorderColor: darkOrange,
                              theBorderRadius: 4.0.sp,
                              theElevation: 0,
                              theColor: lightOrange,
                              theAction: choseDisponibility,
                              theHorizontalPadding: 2.0.wp,
                              theContent: ThemeText(
                                  theText: "Lorem ipsum",
                                  thefontSize: 9.0.sp,
                                  theColor: darkOrange),
                              theLoadingStatus: false),
                        ],
                      )
                    ]),
                  ),
                  SizedBox(height: 2.0.hp),
                  ThemeButton(
                      theWidth: 40.0.wp,
                      theHeight: 5.5.hp,
                      theBorderRadius: 6.0.sp,
                      theElevation: 0,
                      theColor: grey,
                      theAction: choseDisponibility,
                      theHorizontalPadding: 2.0.wp,
                      theContent: ThemeText(
                        theText: "tr_continue".tr,
                        thefontSize: 13.0.sp,
                        theColor: white,
                        theFontWeight: FontWeight.bold,
                      ),
                      theLoadingStatus: false),
                  SizedBox(height: 5.0.hp),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  goToLogin() {
    Get.offAllNamed(LoginScreenForEmailAndSocial.routename);
  }

  bookAppointement() {
    Get.toNamed(AppointmentRecapScreen.routename);
  }

  choseDisponibility() {}

  getSpecilaites(salonId) {
    isLoadingSpecialites = true;
    TakeAppointmentService().apiGetSpecialite(salonId).then((value) async {
      isLoadingSpecialites= false;
      var body = jsonDecode(value.body);
      print(body);
      if (body["success"]) {
        specialites.clear();
        for (var category in body["data"]) {
          specialites.add(SpecialiteModel.fromJson(category));
        }
        items = specialites
            .map((specialite) =>
                MultiSelectItem<SpecialiteModel>(specialite, specialite.name))
            .toList();
        update();
      } else {
        themeSnackBar(body["message"]);
      }
    });
  }

  validateServices(value) {
    print(value);
    return "";
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
