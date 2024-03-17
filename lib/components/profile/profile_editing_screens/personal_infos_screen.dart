import 'package:flutter_svg/flutter_svg.dart';
import 'package:shayplanner/components/profile/profile_controller.dart';
import 'package:shayplanner/theme/theme_app_bar.dart';
import 'package:shayplanner/theme/theme_button.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/theme/theme_input.dart';
import 'package:shayplanner/theme/theme_text.dart';
import 'package:shayplanner/tools/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/theme_circle_painter.dart';

class PersonalInfosScreen extends StatelessWidget {
  PersonalInfosScreen({
    Key? key,
  }) : super(key: key);
  final ProfileController profileController =
      Get.isRegistered<ProfileController>()
          ? Get.find<ProfileController>()
          : Get.put(ProfileController());
  static const routename = '/profile-edit';
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        extendBody: true,
        backgroundColor: white,
        appBar: ThemeAppBar(),
        body: profileController.isLoadingCurrentUser.value == true
            ? const Center(child: CircularProgressIndicator())
            : Container(
                width: Get.width,
                height: 90.0.hp,
                color: biege,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 2.0.hp),
                      Stack(
                        children: [
                          Container(
                            width: 100.0.wp,
                            // color: Colors.red,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                vertical: 1.0.hp, horizontal: 5.0.wp),
                            child: CustomPaint(
                              size: Size(6.0.hp * 2, 6.0.hp * 2),
                              painter: CirclePainter(
                                percentage: 0.8,
                                // backgroundColor: Colors.red,
                                progressColor: yellow,
                              ),
                              child: profileController.user.value!.picture ==
                                      null
                                  ? CircleAvatar(
                                      radius: 6.0.hp,
                                      backgroundImage: AssetImage(
                                        "assets/icons/profile/user-with-no-picture.png",
                                      ))
                                  : CircleAvatar(
                                      radius: 6.0.hp,
                                      backgroundImage: NetworkImage(
                                          profileController.user.value!.picture
                                              .toString()),
                                    ),
                            ),
                          ),
                          profileController.isEditingEnabled.value == false
                              ? Positioned(
                                  right: 10.0.wp,
                                  top: 2.0.hp,
                                  child: InkWell(
                                    onTap: () {
                                      profileController.enableEditing();
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(1.0.wp),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4.0.sp),
                                          color: crem),
                                      child: SvgPicture.asset(
                                          "assets/icons/profile/pen.svg"),
                                    ),
                                  ))
                              : const SizedBox()
                        ],
                      ),
                      profileController.user.value!.picture == null
                          ? InkWell(
                              onTap: () {
                                profileController.updateProfilePicture();
                              },
                              child: ThemeText(
                                theText: "tr_add_profile_picture".tr,
                                thefontSize: 10.0.sp,
                                theColor: black,
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                profileController.updateProfilePicture();
                              },
                              child: ThemeText(
                                theText: "tr_change_profile_picture".tr,
                                thefontSize: 10.0.sp,
                                theColor: black,
                              ),
                            ),
                      SizedBox(height: 2.0.hp),
                      Container(
                        padding:
                            EdgeInsetsDirectional.symmetric(horizontal: 8.0.wp),
                        child: Form(
                          key: profileController.formKeyEditPersoInfos,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ThemeText(
                                theText: "tr_firstname".tr,
                                thefontSize: 11.0.sp,
                                theColor: lightGrey,
                                theFontWeight: FontWeight.bold,
                              ),
                              SizedBox(height: 0.5.hp),
                              ThemeInput(
                                theLabelText: "tr_firstname".tr,
                                theHintText: "tr_firstname".tr,
                                theTextEditingController: profileController
                                    .firstNameEditingController,
                                theValidation:
                                    profileController.validateFirstName,
                                theContentPadding: 5.0.sp,
                                theReadOnly:
                                    profileController.isEditingEnabled.value
                                        ? false
                                        : true,
                              ),
                              SizedBox(height: 2.0.hp),
                              ThemeText(
                                theText: "tr_lastname".tr,
                                thefontSize: 11.0.sp,
                                theColor: lightGrey,
                                theFontWeight: FontWeight.bold,
                              ),
                              SizedBox(height: 0.5.hp),
                              ThemeInput(
                                theLabelText: "tr_lastname".tr,
                                theHintText: "tr_lastname".tr,
                                theTextEditingController:
                                    profileController.lastNameEditingContoller,
                                theValidation:
                                    profileController.validateLastName,
                                theContentPadding: 5.0.sp,
                                theReadOnly:
                                    profileController.isEditingEnabled.value
                                        ? false
                                        : true,
                              ),
                              SizedBox(height: 2.0.hp),
                              ThemeText(
                                theText: "tr_address_email".tr,
                                thefontSize: 11.0.sp,
                                theColor: lightGrey,
                                theFontWeight: FontWeight.bold,
                              ),
                              SizedBox(height: 0.5.hp),
                              ThemeInput(
                                theLabelText: "tr_address_email".tr,
                                theHintText: "tr_address_email".tr,
                                theTextEditingController:
                                    profileController.emailEditingController,
                                theValidation: profileController.validateEmail,
                                theContentPadding: 5.0.sp,
                                theReadOnly:
                                    profileController.isEditingEnabled.value
                                        ? false
                                        : true,
                              ),
                              SizedBox(height: 2.0.hp),
                              ThemeText(
                                theText: "tr_phone".tr,
                                thefontSize: 11.0.sp,
                                theColor: lightGrey,
                                theFontWeight: FontWeight.bold,
                              ),
                              SizedBox(height: 0.5.hp),
                              ThemeInput(
                                theLabelText: "+212-600-000000",
                                theHintText: "+212-600-000000",
                                theTextEditingController:
                                    profileController.mobileEditingContoller,
                                theValidation:
                                    profileController.validatePhoneNumber,
                                theKeyboardType: TextInputType.phone,
                                //thePrefixWidget: ThemeText(theText: "+212", thefontSize: 4.0.wp, theColor: lightGrey),
                                theContentPadding: 5.0.sp,
                                theReadOnly:
                                    profileController.isEditingEnabled.value
                                        ? false
                                        : true,
                              ),
                              SizedBox(height: 2.0.hp),
                              ThemeText(
                                theText: "tr_address".tr,
                                thefontSize: 11.0.sp,
                                theColor: lightGrey,
                                theFontWeight: FontWeight.bold,
                              ),
                              SizedBox(height: 0.5.hp),
                              ThemeInput(
                                theLabelText: "",
                                theHintText: "",
                                theTextEditingController:
                                    profileController.addressEditingContoller,
                                theValidation:
                                    profileController.validateAddress,
                                theContentPadding: 5.0.sp,
                                theReadOnly:
                                    profileController.isEditingEnabled.value
                                        ? false
                                        : true,
                              ),
                              SizedBox(height: 2.0.hp),
                              InkWell(
                                onTap: () {
                                  profileController.goTochangePassword();
                                },
                                child: ThemeText(
                                  theText: "tr_change_password".tr,
                                  thefontSize: 11.0.sp,
                                  theColor: black,
                                  theTextDecoration: TextDecoration.underline,
                                  theFontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 3.0.hp),
                              profileController.isEditingEnabled.value
                                  ? Center(
                                      child: ThemeButton(
                                          theColor: grey,
                                          theContent: Container(
                                            alignment: Alignment.center,
                                            width: 60.0.wp,
                                            height: 5.0.hp,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5.0.wp,
                                                vertical: 1.0.hp),
                                            decoration: BoxDecoration(
                                              color: transparent,
                                              borderRadius:
                                                  BorderRadius.circular(2.0.wp),
                                            ),
                                            child: ThemeText(
                                                theText: "tr_save".tr,
                                                thefontSize: 12.0.sp,
                                                theFontWeight: FontWeight.bold,
                                                theColor: white),
                                          ),
                                          theFormKey: profileController
                                              .formKeyEditPersoInfos,
                                          theAction: profileController
                                              .updatePersonalInformations,
                                          theLoadingStatus: profileController
                                              .isSubmittingForm.value),
                                    )
                                  : const SizedBox(),
                              SizedBox(height: 2.0.hp),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
