import 'package:flutter_svg/svg.dart';
import 'package:shayplanner/components/about/about_controller.dart';
import 'package:shayplanner/theme/theme_app_bar.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/theme/theme_navigation_bottom_bar.dart';
import 'package:shayplanner/theme/theme_text.dart';
import 'package:shayplanner/tools/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutScreen extends StatelessWidget {
  AboutScreen({
    Key? key,
  }) : super(key: key);
  final AboutController aboutController = Get.put(AboutController());
  static const routename = '/about';
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
                SvgPicture.asset("assets/icons/about/infos.svg",
                    width: 8.0.wp, height: 8.0.wp),
                SizedBox(width: 4.0.wp),
                Expanded(
                  child: ThemeText(
                    theText: "tr_about_".tr,
                    thefontSize: 17.0.sp,
                    theColor: black,
                    theFontFamily: fontBold,
                    theMaxOfLines: 2,
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 24.0.wp),
                Expanded(
                  child: ThemeText(
                    theText: "PLANNER".tr,
                    thefontSize: 17.0.sp,
                    theColor: black,
                    theFontFamily: fontBold,
                    theMaxOfLines: 2,
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.0.hp),
            Expanded(
              child: Container(
                width: 100.0.wp,
                padding:
                    EdgeInsets.symmetric(horizontal: 6.0.wp, vertical: 12.0.wp),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.5.wp),
                    topRight: Radius.circular(8.5.wp),
                  ),
                ),
                child: Obx(
                  () => SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: ThemeText(
                                theText: "Lorem ipsum dolor sit amet,",
                                thefontSize: 14.0.sp,
                                theColor: black,
                                theFontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        aboutController.isExpanded.value
                            ? Text(
                                aboutController.aboutDesc,
                                style:
                                    TextStyle(fontSize: 12.0.sp, color: black),
                              )
                            : Text(
                                aboutController.aboutDesc,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 7,
                                style:
                                    TextStyle(fontSize: 12.0.sp, color: black),
                              ),
                        aboutController.aboutDesc.length > 50
                            ? InkWell(
                                onTap: aboutController.toggleExpanded,
                                child: Text(
                                  aboutController.isExpanded.value
                                      ? 'tr_show_less'.tr
                                      : 'tr_show_more'.tr,
                                  style: TextStyle(
                                      color: lightGrey,
                                      decoration: TextDecoration.underline),
                                ),
                              )
                            : Container(),
                        SizedBox(height: 2.0.hp),
                        Row(
                          children: [
                            Expanded(
                              child: ThemeText(
                                theText: "tr_faqs".tr,
                                thefontSize: 16.0.sp,
                                theColor: black,
                                theFontFamily: fontBold,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 2.0.hp),
                        ...aboutController.faqList.map(
                          (question) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  aboutController.openFaqs(question['id']);
                                },
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: ThemeText(
                                        theText: question['question'] ?? "",
                                        thefontSize: 11.0.sp,
                                        theColor: black,
                                        theMaxOfLines: 4,
                                      ),
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: SvgPicture.asset(
                                            "assets/icons/about/arrow_right.svg")),
                                  ],
                                ),
                              ),
                              Divider(),
                              question['isExpanded']
                                  ? Text(
                                        question['answer'] ?? "",
                                        style: TextStyle(
                                            fontSize: 10.0.sp, color: grey),
                                      )
                                  : SizedBox(),
                              SizedBox(height: 1.0.hp),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.0.hp,
                        )
                      ],
                    ),
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
