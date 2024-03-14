import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shayplanner/components/home/home_controller.dart';
import 'package:shayplanner/components/home/home_screen.dart';
import 'package:shayplanner/components/profile/profile_screen.dart';
import 'package:shayplanner/components/salon_sheet/salon_sheet_screen.dart';
import 'package:shayplanner/components/shops/shops_screen.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/tools/extension.dart';

// use this theme button only if the function of the action of your button doesn't require parameters line : action(param1,param2)
class ThemeNavigationBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0.wp,
      height: 9.0.hp,
      decoration: BoxDecoration(
        color: grey,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.5.wp),
          topRight: Radius.circular(8.5.wp),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
              onTap: () {
                Get.toNamed(HomeScreen.routename);
                // Get.delete<HomeController>();
              },
              child: Get.currentRoute == HomeScreen.routename
                  ? SvgPicture.asset(
                      'assets/icons/floating_app_bar/home-active.svg',
                      width: 8.0.wp,
                      height: 8.0.wp)
                  : SvgPicture.asset('assets/icons/floating_app_bar/home.svg',
                      width: 8.0.wp, height: 8.0.wp)),
          InkWell(
            onTap: () => {},
            child: Get.currentRoute == ProfileScreen.routename
                ? SvgPicture.asset(
                    'assets/icons/floating_app_bar/map-active.svg',
                    width: 8.0.wp,
                    height: 8.0.wp)
                : SvgPicture.asset('assets/icons/floating_app_bar/map.svg',
                    width: 8.0.wp, height: 8.0.wp),
          ),
          InkWell(
            onTap: () {
              Get.toNamed(ShopsScreen.routename);
            },
            child: (Get.currentRoute == ShopsScreen.routename ||
                    Get.currentRoute == SalonSheetScreen.routename)
                ?
                // Image.asset(
                // 'assets/icons/floating_app_bar/calendar-active.png'):
                SvgPicture.asset(
                    'assets/icons/floating_app_bar/calendar-active.svg',
                    width: 8.0.wp,
                    height: 8.0.wp)
                : SvgPicture.asset('assets/icons/floating_app_bar/calendar.svg',
                    width: 8.0.wp, height: 8.0.wp),
          ),
          InkWell(
            onTap: () {
              Get.toNamed(ProfileScreen.routename);
            },
            child: Get.currentRoute == ProfileScreen.routename
                ? SvgPicture.asset(
                    'assets/icons/floating_app_bar/profile-active.svg',
                    width: 9.0.wp,
                    height: 9.0.wp,
                  )
                : SvgPicture.asset(
                    'assets/icons/floating_app_bar/profile.svg',
                    width: 9.0.wp,
                    height: 9.0.wp,
                  ),
          ),
        ],
      ),
    );
  }
}
