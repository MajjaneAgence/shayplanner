import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:shayplanner/components/register/register_controller.dart';
import 'package:shayplanner/theme/theme_app_bar.dart';
import 'package:shayplanner/theme/theme_button.dart';
import 'package:shayplanner/theme/theme_circle_painter.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/theme/theme_input.dart';
import 'package:shayplanner/theme/theme_text.dart';
import 'package:shayplanner/tools/extension.dart';

class SalonInfosScreen extends StatelessWidget {
  SalonInfosScreen({
    Key? key,
  }) : super(key: key);
  final RegisterController registerController =
      Get.put(RegisterController(Get.arguments));
  static const routename = '/salon-infos';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: ThemeAppBar(),
      body: Container(
        color: biege,
        padding: EdgeInsets.symmetric(horizontal: 8.0.wp),
        width: Get.width,
        height: Get.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 3.0.hp),
              ThemeText(
                theText: "tr_salon_informations".tr,
                theColor: black,
                thefontSize: 18.0.sp,
                theFontWeight: FontWeight.bold,
              ),
              SizedBox(height: 2.0.hp),
              Form(
                key: registerController.formKeySalonInfos,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ThemeText(
                        theText: "tr_salon_name".tr,
                        thefontSize: 12.0.sp,
                        theColor: black),
                    SizedBox(height: 0.5.hp),
                    ThemeInput(
                      theLabelText: "tr_salon_name".tr,
                      theHintText: "tr_salon_name".tr,
                      theTextEditingController:
                          registerController.salonNameEditingController,
                      theValidation: registerController.validateSalonName,
                      theContentPadding: 5.0.sp,
                    ),
                    SizedBox(height: 2.0.hp),
                    ThemeText(
                        theText: "tr_address".tr,
                        thefontSize: 12.0.sp,
                        theColor: black),
                    SizedBox(height: 0.5.hp),
                    ThemeInput(
                      theLabelText: "tr_address".tr,
                      theHintText: "tr_address".tr,
                      theTextEditingController:
                          registerController.salonAddressEditingController,
                      theValidation: registerController.validateSalonAddress,
                      theContentPadding: 5.0.sp,
                    ),
                    SizedBox(height: 2.0.hp),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ThemeText(
                                  theText: "tr_city".tr,
                                  thefontSize: 12.0.sp,
                                  theColor: black),
                              SizedBox(height: 0.5.hp),
                              SizedBox(
                                height: 5.0.hp,
                                child: TextFormField(
                                  readOnly: true,
                                  validator: (value) => registerController
                                      .validateSalonCity(registerController
                                          .cityEditingController.text),
                                  controller:
                                      registerController.cityEditingController,
                                  textInputAction: TextInputAction.done,
                                  keyboardType: TextInputType.number,
                                  onTap: () => registerController.selectCity(),
                                  style: TextStyle(fontSize: 10.0.sp),
                                  decoration: InputDecoration(
                                    labelText: "tr_city".tr ?? '',
                                    hintText: "tr_city".tr,
                                    counterText: "",
                                    fillColor: white,
                                    errorStyle: TextStyle(
                                        height: 0.1, fontSize: 8.0.sp),
                                    hintStyle: TextStyle(fontSize: 10.0.sp),
                                    labelStyle: TextStyle(fontSize: 10.0.sp),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    contentPadding: EdgeInsets.all(5.0.sp),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    filled: true,
                                    suffixIcon: SizedBox(
                                      width: 6.0.wp,
                                      child: Icon(
                                        Icons.keyboard_arrow_down,
                                        size: 5.0.wp,
                                      ),
                                    ),
                                    suffixIconConstraints:
                                        BoxConstraints(maxWidth: 6.0.wp),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 6.0.wp),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ThemeText(
                                  theText: "tr_postal_code".tr,
                                  thefontSize: 12.0.sp,
                                  theColor: black),
                              SizedBox(height: 0.5.hp),
                              ThemeInput(
                                  theLabelText: "tr_postal_code".tr,
                                  theHintText: "tr_postal_code".tr,
                                  theTextEditingController: registerController
                                      .postalCodeEditingController,
                                theKeyboardType: TextInputType.phone,
                                  theValidation:
                                      registerController.validatePostalCode,
                                  theContentPadding: 5.0.sp),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.0.hp),
                    ThemeText(
                        theText: "tr_patent".tr,
                        thefontSize: 12.0.sp,
                        theColor: black),
                    SizedBox(height: 0.5.hp),
                    ThemeInput(
                        theLabelText: "tr_patent".tr,
                        theHintText: "tr_patent".tr,
                        theTextEditingController:
                            registerController.patentEditingController,
                        theValidation: registerController.validatePatent,
                        theContentPadding: 5.0.sp),
                    SizedBox(height: 2.0.hp),
                    ThemeText(
                        theText: "tr_patent_file".tr,
                        thefontSize: 12.0.sp,
                        theColor: black),
                    SizedBox(height: 0.5.hp),
                    SizedBox(
                      height: 5.0.hp,
                      child: TextFormField(
                        readOnly: true,
                        validator: (value) =>
                            registerController.validatePatentFile(),
                        onTap: () {
                          registerController.addPatentFile();
                        },
                        style: TextStyle(fontSize: 10.0.sp),
                        decoration: InputDecoration(
                          labelText: "tr_patent_file".tr,
                          hintText: "tr_patent_file".tr,
                          counterText: "",
                          fillColor: white,
                          errorStyle: TextStyle(height: 0.1, fontSize: 8.0.sp),
                          hintStyle: TextStyle(fontSize: 10.0.sp),
                          labelStyle: TextStyle(fontSize: 10.0.sp),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          contentPadding: EdgeInsets.all(5.0.sp),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 3.0.hp),
                    Center(
                      child: Container(
                        width: 33.0.wp,
                        height: 32.0.wp,
                        child: InkWell(
                          onTap: () {
                            registerController.updateProfilePicture();
                          },
                          child: Stack(
                            children: [
                              CustomPaint(
                                size: Size(30.0.wp * 2, 30.0.wp * 2),
                                painter: CirclePainter(
                                  percentage: 0.8,
                                  // backgroundColor: Colors.red,
                                  progressColor: verylightGrey,
                                ),
                                child: Container(
                                  width: 30.0.wp,
                                  height: 30.0.wp,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    "assets/icons/register/user.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  width: 10.0.wp,
                                  height: 10.0.wp,
                                  padding: EdgeInsets.all(2.0.wp),
                                  decoration: BoxDecoration(
                                      color: white, shape: BoxShape.circle),
                                  child: SvgPicture.asset(
                                    "assets/icons/register/plus.svg",
                                    width: 6.0.wp,
                                    height: 6.0.wp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 3.0.hp),
                    Obx(
                      () => Center(
                        child: ThemeButton(
                            theColor: grey,
                            theWidth: 65.0.wp,
                            theHeight: 6.5.hp,
                            theBorderRadius: 2.0.wp,
                            theContent: ThemeText(
                                theText: "tr_register".tr,
                                thefontSize: 12.0.sp,
                                theFontWeight: FontWeight.bold,
                                theColor: white),
                            theFormKey: registerController.formKeySalonInfos,
                            theAction: registerController.register,
                            theLoadingStatus:
                                registerController.isLoading.value),
                      ),
                    ),
                    SizedBox(height: 2.0.hp),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
