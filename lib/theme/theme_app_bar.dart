import 'package:flutter_svg/svg.dart';
import 'package:shayplanner/tools/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeAppBar extends StatelessWidget implements PreferredSizeWidget{
String thePreviousRoute;
  ThemeAppBar(
      {Key? key,
      required this.thePreviousRoute})
      : super(key: key);
          @override
  Size get preferredSize =>  Size.fromHeight(10.0.hp);

  @override
  Widget build(BuildContext context) {
    return   AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
            onTap: () {
              Get.toNamed(thePreviousRoute);
            },
            child: Container(
              padding: EdgeInsets.only(left: 2.0.sp),
              margin:
                  EdgeInsets.symmetric(horizontal: 6.0.sp, vertical: 8.0.sp),
              child: SvgPicture.asset(
                "assets/icons/arrow_left.svg",
              ),
            )),
        leadingWidth: 10.0.wp,
        title: Image.asset(
          "assets/icons/logo.png",
        ),
        centerTitle: true,
        toolbarHeight: 10.0.hp,
      );
  }
}
