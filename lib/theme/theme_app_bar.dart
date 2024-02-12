import 'package:shayplanner/tools/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeAppBar extends StatelessWidget {
  Color theBackgroundColor;
  Widget theLeadingPart;
  double theLeadingWidth;
  Widget theMiddlePart;
  List<Widget> theActionsPart;
  ThemeAppBar(
      {Key? key,
      required this.theBackgroundColor,
      required this.theLeadingPart,
      required this.theLeadingWidth,
      required this.theActionsPart,
      required this.theMiddlePart})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  AppBar(
        // Here we take the value from the MyHomePage object that
        // was created by the App.build method, and use it to set
        // our appbar title.
        ///tresse
        backgroundColor: theBackgroundColor,//Colors.white,
        leading: Padding(
            padding: EdgeInsets.only(left: 4.0.wp),
            child: theLeadingPart),
        leadingWidth: 25.0.wp,
        title: theMiddlePart,
        centerTitle: true,
        actions: 
          theActionsPart,
        toolbarHeight: 10.0.hp,
      );
  }
}
