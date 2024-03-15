import 'package:flutter/material.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/tools/extension.dart';

class ThemeGradContainer extends StatelessWidget {
  final double theWith;
  final double theHeight;
  final double? theMargin;
  final LinearGradient? theLinearGradient;
  final Color? theColor;
  final double? thePadding;
  final Widget? theContent;
  final List<BoxShadow>? theBoxShadow;
  const ThemeGradContainer({
    Key? key,
    required this.theWith,
    required this.theHeight,
    this.theMargin,
    this.theColor,
    this.theLinearGradient,
    this.thePadding,
    this.theContent,
    this.theBoxShadow
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: theHeight,
      width: theWith,
      margin: EdgeInsets.all(theMargin ?? 0),
      padding: EdgeInsets.all(thePadding ?? 0),
      decoration: theLinearGradient != null
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(6.0.sp),
              gradient: theLinearGradient,
            )
          : BoxDecoration(
              borderRadius: BorderRadius.circular(6.0.sp),
               color: theColor,
              // boxShadow: 
              // [
              //   BoxShadow(color: Color.fromARGB(255, 185, 126, 70)),
              //   BoxShadow(
              //       color: crem,
              //       spreadRadius: -1.5,
              //       offset: Offset(-3, -3),
              //       blurRadius: 0.5),
              // ],
            ),
      child: theContent,
    );
  }
}
