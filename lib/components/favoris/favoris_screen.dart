import 'package:flutter_svg/svg.dart';
import 'package:shayplanner/components/booking_history/booking_history_controller.dart';
import 'package:shayplanner/components/favoris/favoris_controller.dart';
import 'package:shayplanner/theme/theme_app_bar.dart';
import 'package:shayplanner/theme/theme_button.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/theme/theme_navigation_bottom_bar.dart';
import 'package:shayplanner/theme/theme_text.dart';
import 'package:shayplanner/tools/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavorisScreen extends StatelessWidget {
  FavorisScreen({
    Key? key,
  }) : super(key: key);
  final FavoriteController favoriteController = Get.put(FavoriteController());
  static const routename = '/favoris';
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
        child: Column(
          children: [
            SizedBox(height: 4.0.hp),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 12.0.wp),
                SvgPicture.asset("assets/icons/favorite/heart.svg",
                    width: 8.0.wp, height: 8.0.wp),
                SizedBox(width: 4.0.wp),
                Expanded(
                  child: ThemeText(
                    theText: "tr_favorite".tr,
                    thefontSize: 17.0.sp,
                    theColor: black,
                    theFontFamily: fontBold,
                    theMaxOfLines: 2,
                  ),
                ),
              ],
            ),
            SizedBox(height: 4.0.hp),
            Expanded(
              child: Container(
                width: 100.0.wp,
                padding:
                    EdgeInsets.symmetric(horizontal: 3.0.wp, vertical: 12.0.wp),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.5.wp),
                    topRight: Radius.circular(8.5.wp),
                  ),
                ),
                child: Obx(
                  () => GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 6.0.hp,
                      crossAxisSpacing: 8.0.sp,
                    ),
                    scrollDirection: Axis.vertical,
                    children: [
                      ...favoriteController.list.map(
                        (e) => Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0.sp),
                              ),
                              boxShadow: themeBoxShadowCard),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 7,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10.0.sp),
                                        topRight: Radius.circular(10.0.sp)),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        "assets/images/model_on_mirror.png",
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 2.0.wp),
                                  child: ThemeText(
                                    theText: "Lorem ipsum ",
                                    thefontSize: 6.0.sp,
                                    theColor: black,
                                    theFontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 2.0.wp),
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        WidgetSpan(
                                          child: SvgPicture.asset(
                                            "assets/icons/booking_history/clock.svg",
                                            width: 6.0.sp,
                                            height: 6.0.sp,
                                          ),
                                        ),
                                        TextSpan(
                                          text: " 4,9 (317 avis)",
                                          style: TextStyle(
                                              fontFamily: fontThin,
                                              fontSize: 6.0.sp,
                                              color: black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: InkWell(
                                  onTap: () {
                                    favoriteController.toggleFavorite(e['id']);
                                  },
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 2.0.wp, vertical: 1.0.sp),
                                    child: e['isFavorite']
                                        ? SvgPicture.asset(
                                            "assets/icons/favorite/heart_black.svg",
                                            width: 10.0.sp,
                                            height: 10.0.sp,
                                          )
                                        : SvgPicture.asset(
                                            "assets/icons/favorite/heart.svg",
                                            width: 10.0.sp,
                                            height: 10.0.sp,
                                          ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ThemeNavigationBottomBar(),
    );
  }
}
