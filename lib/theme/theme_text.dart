import 'package:flutter/material.dart';
import 'package:shayplanner/tools/extension.dart';

class ThemeText extends StatelessWidget {
  String theText;
  double thefontSize;
  Color theColor;
  FontWeight? theFontWeight;
  int? theMaxOfLines;
  TextAlign? theTextAlign;
  TextDecoration? theTextDecoration;
  ThemeText({
    Key? key,
    required this.theText,
    required this.thefontSize,
    required this.theColor,
   this.theFontWeight,
   this.theMaxOfLines,
   this.theTextAlign,
   this.theTextDecoration
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      theText,
      overflow: TextOverflow.ellipsis,
      textAlign: theTextAlign ?? TextAlign.start,
      maxLines: theMaxOfLines ?? 2,
      
      style: TextStyle(
        color: theColor,
        fontSize: thefontSize,
        fontFamily: "Montserrat-regular",
        fontWeight: theFontWeight ?? FontWeight.normal,
        decoration: theTextDecoration ?? TextDecoration.none,
      ),
    );
  }
}
