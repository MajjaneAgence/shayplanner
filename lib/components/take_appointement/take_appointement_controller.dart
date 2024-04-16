import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shayplanner/components/home/home_screen.dart';
import 'package:shayplanner/components/login/login_controller.dart';
import 'package:shayplanner/components/login/login_screen.dart';
import 'package:shayplanner/components/take_appointement/appointement_recap/appointement_recap.dart';
import 'package:shayplanner/components/take_appointement/take_appointement_service.dart';
import 'package:shayplanner/models/salon_model.dart';
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
  bool isLoadingAvailability = false;
  bool isLoadingBookingAppoitement = false;
  bool isLoadingSalonGallery = true;
  String? errorMessage;
  List<String> secourImages = [
    'assets/images/take_appointement/no_image_available.jpg',
  ];
  List<String> salonImages = <String>[];
  CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  List<MultiSelectItem<SpecialiteModel>> items =
      <MultiSelectItem<SpecialiteModel>>[];
  List<SpecialiteModel?> selectedSpecialities = <SpecialiteModel?>[];
  final multiSelectKey = GlobalKey<FormFieldState>();
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime selectedDayBeforeLogin = DateTime.now();
  String selectedHour = "--:--";
  DateTime focusedDay = DateTime.now();
  bool isLoadingCurrentUser = false;
  UserModel? user = UserModel();
  var keySelectDateHour = GlobalKey();
  List<SpecialiteModel> specialites = <SpecialiteModel>[];
  List<SpecialiteModel> specialitiesInitValue = <SpecialiteModel>[];
  List<Map<String, dynamic>> availability = [];
  TextEditingController msgForSalonEditingController = TextEditingController();
  SalonModel salon = SalonModel();
  bool isLoggedIn = false;

  @override
  void onInit() async {
    super.onInit();
    String previousScreen = arguments['source'];
    // if the user is visitng the screen after logging in
    if (previousScreen == "login") {
      isLoggedIn = true;
      int salonId = arguments['salon_id'];
      getCurrentUser();
      getSpecialities(salonId);
      getSalonGallery(salonId);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String? selectedDayString = prefs.getString('selectedDay');
      selectedHour = prefs.getString('selectedHour') ?? "--:--";
      selectedDay = DateTime.parse(selectedDayString!);
      selectedDayBeforeLogin = DateTime.parse(selectedDayString!);
      focusedDay = DateTime.parse(selectedDayString!);
      msgForSalonEditingController.text = prefs.getString("msgForSalon") ?? "";
      // prefs.remove("selectedDay");
      // prefs.remove("selectedHour");
      // prefs.remove("msgForSalon");
      update();
    } else {
      FlutterSecureStorage storage = FlutterSecureStorage();
      String? token = await storage.read(key: 'token');
      if (token != null) {
        isLoggedIn = true;
        getCurrentUser();
      }
      int salonId = arguments['salon_id'];
      getSpecialities(salonId);
      getSalonGallery(salonId);
    }
  }

  void onFormatChanged(CalendarFormat newFormat) {
    format = newFormat;
    update();
  }

  doSomething() {}

  selectDateAndHour() {
    if (selectedSpecialities.isEmpty) {
      Get.dialog(
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0.wp),
              child: Container(
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0.sp),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(3.0.wp),
                  child: Material(
                    child: Column(
                      children: [
                        Container(
                          width: 70.0.wp,
                          height: 5.0.hp,
                          alignment: Get.locale!.languageCode != "ar"
                              ? Alignment.bottomRight
                              : Alignment.bottomLeft,
                          child: ThemeButton(
                            theWidth: 10.0.wp,
                            theHeight: 10.0.wp,
                            theContent: Container(
                              width: 10.0.wp,
                              height: 10.0.wp,
                              padding: EdgeInsets.all(2.7.wp),
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              child: SvgPicture.asset(
                                  "assets/icons/take_appointement/close.svg",
                                  width: 10.0.sp,
                                  height: 10.0.sp),
                            ),
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
                        Container(
                          alignment: Alignment.center,
                          width: 70.0.wp,
                          height: 15.0.hp,
                          child: ThemeText(
                            theText:
                                "tr_please_choose_at_least_one_speciality".tr,
                            thefontSize: 13.0.sp,
                            theColor: black,
                            theFontWeight: FontWeight.bold,
                            theTextAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      // DateTime now = DateTime.now();
      // String date = DateFormat('yyyy-MM-dd').format(now);
      List<int> ids = selectedSpecialities.map((obj) => obj!.id).toList();
// print(ids);
//        print(date);
//        print(selectedSpecialities);
//        print(arguments['salon_id']);
      getAvailability(DateFormat('yyyy-MM-dd').format(selectedDay), arguments['salon_id'], ids);
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
                child: GetBuilder<TakeAppointmentController>(
                  init: TakeAppointmentController(arguments),
                  builder: (controller) => Column(
                    children: [
                      SizedBox(height: 1.5.hp),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 6,
                              child: ThemeText(
                                theText: "tr_choose_date_and_hour".tr,
                                thefontSize: 12.0.sp,
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
                                theContent: Container(
                                  width: 10.0.wp,
                                  height: 10.0.wp,
                                  padding: EdgeInsets.all(2.7.wp),
                                  decoration:
                                      BoxDecoration(shape: BoxShape.circle),
                                  child: SvgPicture.asset(
                                      "assets/icons/take_appointement/close.svg",
                                      width: 10.0.sp,
                                      height: 10.0.sp),
                                ),
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
                            child: Container(
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
                                    return isSameDay(
                                        controller.selectedDay, day);
                                  },
                                  onDaySelected: controller.onDaySelected,
                                  onFormatChanged: controller.onFormatChanged,
                                  calendarFormat: controller.format,
                                  onPageChanged: (focusedDay) {
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
                                          fontSize: 10.5.sp,
                                          fontWeight: FontWeight.bold),
                                      weekendTextStyle: TextStyle(
                                          fontSize: 10.5.sp,
                                          fontWeight: FontWeight.bold)),
                                  headerStyle: HeaderStyle(
                                    titleCentered: true,
                                    formatButtonVisible: false,
                                    titleTextFormatter:
                                        (DateTime date, locale) {
                                      // Make the first letter uppercase
                                      String month =
                                          DateFormat.MMMM(locale).format(date);
                                      return month
                                              .substring(0, 1)
                                              .toUpperCase() +
                                          month.substring(1);
                                    },
                                    titleTextStyle: TextStyle(
                                        color: darkOrange,
                                        fontSize: 20.0.sp,
                                        fontWeight: FontWeight.bold),
                                    leftChevronIcon: SvgPicture.asset(
                                        Get.locale!.languageCode != "ar"
                                            ? "assets/icons/take_appointement/left_chevron.svg"
                                            : "assets/icons/take_appointement/right_chevron.svg",
                                        width: 15.0.sp,
                                        height: 15.0.sp),
                                    rightChevronIcon: SvgPicture.asset(
                                        Get.locale!.languageCode != "ar"
                                            ? "assets/icons/take_appointement/right_chevron.svg"
                                            : "assets/icons/take_appointement/left_chevron.svg",
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
                      SizedBox(height: 5.0.hp),
                      Container(
                        width: 70.0.wp,
                        height: 20.0.hp,
                        padding: EdgeInsets.symmetric(
                            horizontal: 3.0.wp, vertical: 2.0.wp),
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0.sp),
                          ),
                        ),
                        child: Column(children: [
                          SizedBox(height: 1.5.hp),
                          ThemeText(
                            theText: "tr_availibility".tr,
                            thefontSize: 14.0.sp,
                            theColor: black,
                            theFontWeight: FontWeight.bold,
                          ),
                          SizedBox(height: 2.0.hp),
                          GetBuilder<TakeAppointmentController>(
                            init: TakeAppointmentController(arguments),
                            builder: (controller) => Expanded(
                              child: isLoadingAvailability
                                  ? Center(
                                      child: CircularProgressIndicator(
                                          color: crem))
                                  : availability.isEmpty
                                      ? Center(
                                          child: ThemeText(
                                              theText: "tr_no_availability".tr,
                                              thefontSize: 11.0.sp,
                                              theColor: black),
                                        )
                                      : GridView(
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 4,
                                                  mainAxisSpacing: 10.0.sp,
                                                  crossAxisSpacing: 4.0.sp,
                                                  childAspectRatio: 3 / 2),
                                          scrollDirection: Axis.vertical,
                                          children: [
                                            ...availability
                                                .map(
                                                  (e) => ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal:
                                                                  2.0.wp),
                                                      backgroundColor:
                                                          e['isChecked']
                                                              ? crem
                                                              : lightOrange,
                                                      surfaceTintColor:
                                                          e['isChecked']
                                                              ? crem
                                                              : lightOrange,
                                                      shadowColor: null,
                                                      elevation: 0,
                                                      foregroundColor: crem,
                                                      fixedSize: Size(40, 5),
                                                      minimumSize: Size(40, 5),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius: BorderRadius
                                                            .circular(4.0
                                                                .sp), // Border radius
                                                        side: BorderSide(
                                                          color: e['isChecked']
                                                              ? crem
                                                              : darkOrange,
                                                        ),
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      choseDisponibility(
                                                          e['hour']);
                                                    },
                                                    child: ThemeText(
                                                      theText: e['hour'],
                                                      thefontSize: 11.0.sp,
                                                      theColor: e['isChecked']
                                                          ? white
                                                          : darkOrange,
                                                      theFontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                )
                                                .toList()
                                          ],
                                        ),
                            ),
                          ),
                        ]),
                      ),
                      SizedBox(height: 2.0.hp),
                      ThemeButton(
                          theWidth: 40.0.wp,
                          theHeight: 5.5.hp,
                          theBorderRadius: 6.0.sp,
                          theElevation: 0,
                          theColor: grey,
                          theAction: () {
                            Get.back();
                          },
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
            ),
          ],
        ),
      );
    }
  }

  editAppointement() {
    Get.back();
  }

  void onDaySelected(DateTime day, DateTime focusedDay) {
    selectedDay = day;
    String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDay);
    this.focusedDay = focusedDay;
    List<int> specialiteIds =
        selectedSpecialities.map((obj) => obj!.id).toList();
    getAvailability(formattedDate, arguments['salon_id'], specialiteIds);
    update();
  }

  goToLogin() async {
    if (Get.isRegistered<LoginController>()) {
      Get.delete<LoginController>();
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // List<Map<String, dynamic>> specialitiesJson =
    //     selectedSpecialities.map((specialite) => specialite!.toJson()).toList();
    // String jsonString = jsonEncode(specialitiesJson);
    // print(jsonString);
    List<int> specialiteIds =
        selectedSpecialities.map((obj) => obj!.id).toList();
    String jsonString = jsonEncode(specialiteIds);
    prefs.setInt("salon_id", arguments['salon_id']);
    prefs.setString("selectedIds", jsonString);
    prefs.setString("selectedDay", selectedDay.toString());
    prefs.setString("selectedHour", selectedHour);
    prefs.setString("msgForSalon", msgForSalonEditingController.text);
    Get.toNamed(LoginScreen.routename);
  }

  getCurrentUser() async {
    isLoadingCurrentUser = true;
    TakeAppointmentService().apiGetCurrentUser().then((value) async {
      isLoadingCurrentUser = false;
      var body = jsonDecode(value.body);
      print(body);
      if (body["success"]) {
        user = UserModel.fromJson(body["data"]);
        update();
      } else {
        themeSnackBar(body["message"]);
      }
    });
  }

  goToRecap() {
    if (selectedSpecialities.isEmpty) {
      showErrorDialog("tr_please_choose_at_least_one_speciality".tr);
    } else if (selectedHour == "--:--") {
      showErrorDialog("tr_please_chose_an_hour".tr);
    } else if (availability.isEmpty) {
      showErrorDialog("tr_salon_has_no_availibality_try_another_date".tr);
    } else if (!isLoggedIn) {
      showErrorDialog("tr_you_must_be_loggedIn_to_continue".tr);
    } else {
      Get.toNamed(AppointmentRecapScreen.routename,
          arguments: {"salon_id": arguments["salon_id"],"source":"tetstttt"});
    }
  }

  choseDisponibility(hour) {
    for (var item in availability) {
      item['isChecked'] = false;
    }
    update();
    for (var item in availability) {
      if (hour == item['hour']) {
        item['isChecked'] = !item['isChecked'];
        selectedHour = item['hour'];
        update();
      }
    }
  }

  getSpecialities(salonId) {
    isLoadingSpecialites = true;
    update();
    TakeAppointmentService().apiGetSpecialites(salonId).then((value) async {
      var body = jsonDecode(value.body);
      print(body);
      if (body["success"]) {
        isLoadingSpecialites = false;
        update();
        specialites.clear();
        for (var specialite in body["data"]) {
          specialites.add(SpecialiteModel.fromJson(specialite));
        }
        items = specialites
            .map((specialite) =>
                MultiSelectItem<SpecialiteModel>(specialite, specialite.name))
            .toList();
        update();

        // if the user has chosen specialities before login we should rememeber what he has
        // chosen and a fter login we get what he has chosen and we fill the select of specialities
        //autiomatically
        if (arguments["source"] == "login") {
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          final String? selectedServicesString = prefs.getString('selectedIds');
          var selectedServicesIds = jsonDecode(selectedServicesString!);
          selectedSpecialities.clear();
          List<int> selectedIndexes = [];
          selectedServicesIds.forEach((selectedServiceId) {
            int index = specialites
                .indexWhere((specialite) => specialite.id == selectedServiceId);
            if (index != -1) {
              selectedIndexes.add(index);
              selectedSpecialities.add(specialites[index]);
            }
          });
          print(selectedIndexes);
          specialitiesInitValue = selectedIndexes.map((index) {
            return specialites[index];
          }).toList();
          List<int> specialiteIds =
          selectedSpecialities.map((obj) => obj!.id).toList();
          print(selectedDay);
          focusedDay = selectedDay;
          getAvailability(DateFormat('yyyy-MM-dd').format(selectedDayBeforeLogin), salonId,
              specialiteIds);
        }
      } else {
        themeSnackBar(body["message"]);
      }
    });
  }

  getSalonGallery(salonId) {
    isLoadingSalonGallery = true;
    update();
    TakeAppointmentService().apiGetSalonGallery(salonId).then((value) async {
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

  bookAppointemnt() {
    isLoadingAvailability = true;
    update();
    List<int> specialiteIds =
        selectedSpecialities.map((obj) => obj!.id).toList();
    TakeAppointmentService()
        .apiBookAppointement(
            DateFormat('yyyy-MM-dd').format(selectedDay),
            availability
                .firstWhere((element) => element['isChecked'] == true)['hour'],
            specialiteIds,
            arguments['salon_id'],
            msgForSalonEditingController.text)
        .then((value) async {
      isLoadingAvailability = false;
      var body = jsonDecode(value.body);
      print(body);
      if (body["success"]) {
        showAppointmentBookingSuccess();
      }
    });
  }

  showAppointmentBookingSuccess() {
    Get.dialog(
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.wp),
            child: Container(
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0.sp),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(3.0.wp),
                child: Material(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 70.0.wp,
                        height: 15.0.hp,
                        child: ThemeText(
                          theText:
                              "tr_ur_appointement_has_been_booked_sucessfully"
                                  .tr,
                          thefontSize: 13.0.sp,
                          theColor: black,
                          theFontWeight: FontWeight.bold,
                          theTextAlign: TextAlign.center,
                        ),
                      ),
                      SvgPicture.asset(
                          "assets/icons/take_appointement/confirmation.svg")
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 3.0.hp),
          Material(
            color: transparent,
            child: ThemeButton(
              theColor: grey,
              theWidth: 40.0.wp,
              theHeight: 6.5.hp,
              theBorderRadius: 2.0.wp,
              theContent: ThemeText(
                  theText: "tr_finish".tr,
                  thefontSize: 12.0.sp,
                  theFontWeight: FontWeight.bold,
                  theColor: white),
              theAction: () {
                Get.offAllNamed(HomeScreen.routename);
              },
              theLoadingStatus: false,
            ),
          ),
        ],
      ),
      barrierDismissible: false, // Make the dialog dismissible
    );
  }

  validateServices(value) {
    if (value.isEmpty) {
      return "tr_please_choose_at_least_one_speciality".tr;
    }
    return null;
  }

  getAvailability(date, salonId, specialiteIds) {
    isLoadingAvailability = true;
    update();
    TakeAppointmentService()
        .apiGetAvailability(date, salonId, specialiteIds)
        .then((value) async {
      isLoadingAvailability = false;
      var body = jsonDecode(value.body);
      print(body);
      if (body["success"]) {
        availability.clear();
        for (var hour in body["data"]) {
          availability.add({"hour": hour, "isChecked": false});
        }
        // print(availability);
        // print(date);
        // print(DateFormat('yyyy-MM-dd').format(selectedDayBeforeLogin));
        if (arguments["source"] == "login" &&
            date == DateFormat('yyyy-MM-dd').format(selectedDayBeforeLogin)) {
          availability.firstWhere(
            (element) => element['hour'] == selectedHour,
          )['isChecked'] = true;
        }
        update();
      } else {
        themeSnackBar(body["message"]);
      }
    });
  }

  showErrorDialog(message) {
    Get.dialog(
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.wp),
            child: Container(
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0.sp),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(3.0.wp),
                child: Material(
                  child: Column(
                    children: [
                      Container(
                        width: 70.0.wp,
                        height: 5.0.hp,
                        alignment: Get.locale!.languageCode != "ar"
                            ? Alignment.bottomRight
                            : Alignment.bottomLeft,
                        child: ThemeButton(
                          theWidth: 10.0.wp,
                          theHeight: 10.0.wp,
                          theContent: Container(
                            width: 10.0.wp,
                            height: 10.0.wp,
                            padding: EdgeInsets.all(2.7.wp),
                            decoration: BoxDecoration(shape: BoxShape.circle),
                            child: SvgPicture.asset(
                                "assets/icons/take_appointement/close.svg",
                                width: 10.0.sp,
                                height: 10.0.sp),
                          ),
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
                      Container(
                        alignment: Alignment.center,
                        width: 70.0.wp,
                        height: 15.0.hp,
                        child: ThemeText(
                          theText: message,
                          thefontSize: 11.0.sp,
                          theColor: black,
                          theFontWeight: FontWeight.bold,
                          theTextAlign: TextAlign.center,
                          theMaxOfLines: 6,
                        ),
                      ),
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
