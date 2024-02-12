import 'package:flutter/material.dart';
import 'package:shayplanner/tools/extension.dart';

class ThemeText extends StatelessWidget {
  String theText;
  ThemeText({
    Key? key,
    required this.theText,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      theText,
      style: TextStyle(
        color: Colors.black,
        fontSize: 8.0.sp,
      ),
    );
  }
}
