import 'package:flutter/material.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/tools/extension.dart';

class ThemeGradContainer extends StatelessWidget {
  final double theWith;
  final double theHeight;
  final double? theMargin;
  final LinearGradient theLinearGradient;
  final double? thePadding;
  final Widget? theContent;
  const ThemeGradContainer({
    Key? key,
    required this.theWith,
    required this.theHeight,
    this.theMargin,
    required this.theLinearGradient,
    this.thePadding,
    this.theContent,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: theHeight,
      width: theWith,
      margin: EdgeInsets.all(theMargin ?? 0),
      padding: EdgeInsets.all(thePadding ?? 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0.sp),
        gradient: theLinearGradient,
      ),
      child: theContent,
    );
  }
}
