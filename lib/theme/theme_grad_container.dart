import 'package:flutter/material.dart';

class ThemeGradContainer extends StatelessWidget {
  final double theWith;
  final double theHeight;
  final double? theMargin;
  final double? thePadding;
  final Widget? theContent;
  const ThemeGradContainer(
      {Key? key,
      required this.theWith,
      required this.theHeight,
      this.theContent,
      this.theMargin,
      this.thePadding})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: theHeight,
      width: theWith,
      margin: EdgeInsets.all(theMargin ?? 0),
      padding: EdgeInsets.all(thePadding ?? 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        gradient: LinearGradient(
          colors: [
            Color(0xFFD5A702), // D5A702
            Color(0xFF2D2D2D), // 2D2D2D
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: theContent,
    );
  }
}
