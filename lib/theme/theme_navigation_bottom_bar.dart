
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shayplanner/components/home/home_screen.dart';
import 'package:shayplanner/components/salon_sheet/salon_sheet_screen.dart';
import 'package:shayplanner/components/shops/shops_screen.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/tools/extension.dart';

// use this theme button only if the function of the action of your button doesn't require parameters line : action(param1,param2)
class ThemeNavigationBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: Container(
          width: 92.0.wp,
          height: 10.0.hp,
          decoration: BoxDecoration(
            color: grey,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.5.wp),
              topRight: Radius.circular(8.5.wp),
            ),
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            InkWell(
              onTap: () => {Get.toNamed(HomeScreen.routename)},
              child: SizedBox(
                width: 9.0.wp,
                height: 9.0.wp,
                child: Get.currentRoute==HomeScreen.routename ?
                 Image.asset(
                    'assets/icons/floating_app_bar/home-active.png'):
                   Image.asset(
                    'assets/icons/floating_app_bar/home.png') ,
              ),
            ),
            InkWell(
              onTap: () => {},
              child: SizedBox(
                width: 9.0.wp,
                height: 9.0.wp,
                child: Get.currentRoute==HomeScreen.routename ?
                //  Image.asset(
                //     'assets/icons/floating_app_bar/map-active.png'):
                Image.asset(
                    'assets/icons/floating_app_bar/map.png'):
                   Image.asset(
                    'assets/icons/floating_app_bar/map.png'),
              ),
            ),
            InkWell(
              onTap: () => {Get.toNamed(ShopsScreen.routename)},
              child: SizedBox(
                width: 9.0.wp,
                height: 9.0.wp,
                child:(Get.currentRoute==ShopsScreen.routename ||Get.currentRoute==SalonSheetScreen.routename) ?
                    // Image.asset(
                    // 'assets/icons/floating_app_bar/calendar-active.png'):
                    Image.asset(
                    'assets/icons/floating_app_bar/calendar.png'):
                   Image.asset(
                    'assets/icons/floating_app_bar/calendar.png'),
              ),
            ),
            InkWell(
              onTap: () => {},
              child: SizedBox(
                width: 9.0.wp,
                height: 9.0.wp,
                child:Get.currentRoute==HomeScreen.routename ?
                    // Image.asset(
                    // 'assets/icons/floating_app_bar/profile-active.png'):
                     Image.asset(
                    'assets/icons/floating_app_bar/profile.png'):
                   Image.asset(
                    'assets/icons/floating_app_bar/profile.png'),
              ),
            ),
          ]),
        ),
      );
  }
        
}
