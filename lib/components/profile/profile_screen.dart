import 'package:flutter_svg/svg.dart';
import 'package:shayplanner/components/notifications/notifications_screen.dart';
import 'package:shayplanner/components/profile/profile_controller.dart';
import 'package:shayplanner/components/profile/profile_loading/user_info_loading.dart';
import 'package:shayplanner/theme/theme_app_bar.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/theme/theme_navigation_bottom_bar.dart';
import 'package:shayplanner/theme/theme_text.dart';
import 'package:shayplanner/tools/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/theme_circle_painter.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({
    Key? key,
  }) : super(key: key);
  final ProfileController profileController = Get.put(ProfileController());
  static const routename = '/profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: white,
      appBar: ThemeAppBar(),
      body: Container(
        width: Get.width,
        height: 90.0.hp,
        color: biege,
        child: Obx(
          () => Column(
            children: [
              profileController.isLoadingCurrentUser.value == true
                  ? UserInfoLoading()
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: 10.0.wp),
                        Stack(
                          children: [
                            Container(
                              width: 25.0.wp,
                              //color: Colors.red,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: 2.0.hp),
                                  CustomPaint(
                                    size: Size(4.0.hp * 2, 4.0 * 2),
                                    painter: CirclePainter(
                                      percentage: 0.8,
                                      // backgroundColor: Colors.red,
                                      progressColor: yellow,
                                    ),
                                    child:
                                        profileController.user.value!.picture ==
                                                null
                                            ? CircleAvatar(
                                                radius: 4.0.hp,
                                                backgroundImage: AssetImage(
                                                  "assets/icons/profile/user-with-no-picture.png",
                                                ))
                                            : CircleAvatar(
                                                radius: 4.0.hp,
                                                backgroundImage: NetworkImage(
                                                    profileController
                                                        .user.value!.picture
                                                        .toString()),
                                              ),
                                  ),
                                  SizedBox(height: 3.0.hp),
                                ],
                              ),
                            ),
                            Positioned(
                              left: 15.0.wp,
                              top: 8.0.hp,
                              child: InkWell(
                                onTap: () {
                                  profileController.updateProfilePicture();
                                },
                                child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 1.5.wp, horizontal: 1.5.wp),
                                    width: 7.0.wp,
                                    height: 7.0.wp,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: darkOrange),
                                    child: Image.asset(
                                      "assets/icons/profile/camera.png",
                                    )),
                              ),
                            )
                          ],
                        ),
                        SizedBox(width: 3.0.wp),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ThemeText(
                              theText: profileController
                                  .transformFirstLetterToupperCase(
                                      profileController.user.value!.firstname),
                              thefontSize: 14.0.sp,
                              theColor: black,
                              theFontWeight: FontWeight.bold,
                            ),
                            SizedBox(height: 1.0.wp),
                            ThemeText(
                              theText: profileController
                                  .transformFirstLetterToupperCase(
                                      profileController.user.value!.lastname),
                              thefontSize: 14.0.sp,
                              theColor: black,
                              theFontWeight: FontWeight.bold,
                            ),
                          ],
                        )
                      ],
                    ),
              Expanded(
                child: Container(
                  width: 100.0.wp,
                  padding:
                    EdgeInsets.symmetric(horizontal: 6.0.hp, vertical: 12.0.wp),
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.5.wp),
                      topRight: Radius.circular(8.5.wp),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            profileController.goToProfileEditing();
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset("assets/icons/profile/user.svg",
                                  width: 18.0.sp, height: 18.0.sp),
                              SizedBox(width: 5.0.wp),
                              ThemeText(
                                theText: "tr_personal_informations".tr,
                                thefontSize: 11.0.sp,
                                theColor: black,
                                theFontWeight: FontWeight.bold,
                              ),
                              SizedBox(width: 12.0.wp),
                              SvgPicture.asset(
                                  "assets/icons/profile/arrow_right.svg",
                                  width: 10.0.sp,
                                  height: 10.0.sp),
                            ],
                          ),
                        ),
                        SizedBox(height: 4.0.hp),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              SvgPicture.asset("assets/icons/profile/heart.svg",
                                  width: 18.0.sp, height: 18.0.sp),
                              SizedBox(width: 5.0.wp),
                              ThemeText(
                                theText: "tr_favorite".tr,
                                thefontSize: 11.0.sp,
                                theColor: black,
                                theFontWeight: FontWeight.bold,
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 4.0.hp),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              SvgPicture.asset("assets/icons/profile/card.svg",
                                  width: 18.0.sp, height: 18.0.sp),
                              SizedBox(width: 5.0.wp),
                              ThemeText(
                                theText: "tr_booking_history".tr,
                                thefontSize: 11.0.sp,
                                theColor: black,
                                theFontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 4.0.hp),
                        InkWell(
                          onTap: () {
                            Get.toNamed(NotificationsScreen.routename);
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset("assets/icons/profile/bell.svg",
                                  width: 18.0.sp, height: 18.0.sp),
                              SizedBox(width: 5.0.wp),
                              ThemeText(
                                theText: "tr_notifications".tr,
                                thefontSize: 11.0.sp,
                                theColor: black,
                                theFontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 4.0.hp),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              SvgPicture.asset("assets/icons/profile/infos.svg",
                                  width: 18.0.sp, height: 18.0.sp),
                              SizedBox(width: 5.0.wp),
                              ThemeText(
                                theText: "tr_about_PLANNER".tr,
                                thefontSize: 11.0.sp,
                                theColor: black,
                                theFontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 4.0.hp),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                  "assets/icons/profile/support.svg",
                                  width: 18.0.sp,
                                  height: 18.0.sp),
                              SizedBox(width: 5.0.wp),
                              ThemeText(
                                theText: "tr_support".tr,
                                thefontSize: 11.0.sp,
                                theColor: black,
                                theFontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5.0.hp),
                        InkWell( 
                          onTap: (){
                            profileController.logout();
                          },
                          child:
                        Row(
                          children: [
                            SvgPicture.asset("assets/icons/profile/logout.svg",
                                width: 18.0.sp, height: 18.0.sp),
                            SizedBox(width: 5.0.wp),
                            ThemeText(
                              theText: "tr_logout".tr,
                              thefontSize: 11.0.sp,
                              theColor: Colors.red,
                              theFontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                        ),
                        SizedBox(height: 10.0.hp)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ThemeNavigationBottomBar(),
    );
  }
}
