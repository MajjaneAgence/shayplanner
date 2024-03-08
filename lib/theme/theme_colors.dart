import 'package:flutter/material.dart';
import 'dart:math' as math;
String fontBold ="Montserrat-Bold";
String fontRegular ="Montserrat-regular";
String fontThin ="Montserrat-Light";

Color biege = Color(0xFFBA9C54).withOpacity(0.33);
Color black = Colors.black;
Color white = Colors.white;
Color lightYellow = Color(0xFFFBF6EA);
Color brown = Color(0xFFAA886A);
Color yellow = Color(0xFFD5A702);
Color grey = Color(0xFF2D2D2D);
Color lightGrey = Color(0xFF848484);
Color crem = Color(0xFFD79F6C);
Color lightYellowTransparent = Color.fromRGBO(251, 246, 234, 0.6);
Color darkOrange= Color(0xFFBE6412);
Color lightOrange =Color(0xFFFBF0E5);
Color transparent = Colors.transparent;
Color verylightGrey = Color(0xFFF7F7F7);
const BoxShadow themeBoxShadowInput = BoxShadow(
  color: Color.fromARGB(255, 224, 217, 217),
  offset: Offset(
    1.0,
    5.0,
  ),
  blurRadius: 5.0,
  spreadRadius: 2.0,
);
const List<BoxShadow> themeBoxShadowCard = [
  BoxShadow(
    color: Colors.grey,
    offset: const Offset(
      5.0,
      5.0,
    ),
    blurRadius: 10.0,
    //spreadRadius: 2.0,
  ), //BoxShadow
  BoxShadow(
    color: const Color.fromRGBO(255, 255, 255, 1),
    offset: const Offset(0.0, 0.0),
    blurRadius: 0.0,
    spreadRadius: 0.0,
  ), //BoxShadow
];
const LinearGradient greyYellowLinearGradient = LinearGradient(
  colors: [
    Color(0xFFD5A702),
     Color.fromRGBO(213, 167, 2, 0.6),
    Color(0xFF2D2D2D), 
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
const LinearGradient yellowFadeGradient = LinearGradient(
  colors: [
    Color(0xFFCFB83F), // D5A702
    Color(0xFFD5A702), // 2D2D2D
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

const LinearGradient goldenLinearGradient = LinearGradient(
  colors: [
     Color(0xFFCFB83F),
      Color(0xFFF4E282),
    Color(0xFFC7AB48), 
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);
// Color darkGrey = const Color(0xff707070);
// Color labelGrey = const Color(0xff9D9D9D);
// Color lightgrey = const Color(0xffE8E8E8);
// Color stepGrey = const Color(0xffC7C7C7);
// Color lightGreyStep = const Color(0xffEFEFEF);
// Color borderGrey = const Color(0xffCCCCCC);
// Color tableTextGrey = const Color(0xff999999);
// Color greyBorderRecap = const Color(0xffE8E8E8);
// //red
// Color red = const Color(0xffC83223);
// Color flashRed = const Color(0xffDB180D);
// Color cancelRed = const Color(0xffE63946);

// //blue
// Color blue = const Color(0xff056195);
// Color darkBlue = const Color(0xff03314B);

// //yellow

// Color starYellow = const Color(0xffFFC107);
// Color waitYellow = const Color(0xffE9C46A);

// //black

// Color lightBlack = const Color(0xff333333);

// //green

// Color green = const Color(0xff588157);

// //primary color

// Color orange = const Color(0xffEC672A);
// Color yellow = const Color(0xffFAB71C);
// Color purple = const Color(0xff56348B);
// Color grey = const Color(0xffEDEDEE);
// Color greyBorder = const Color(0xffF2F2F2);
// Color greyTabbar = const Color(0xffF7F8F9);

// //Card color
// Color lightbeige = const Color(0xffFEF6E3);
// Color lightpink = const Color(0xffFCECE5);
// Color lightpurple = const Color(0xffEAE6F1);
// SweepGradient sweepGradient = SweepGradient(
//   transform: const GradientRotation(-math.pi / 4),
//   colors: [
//     purple,
//     orange,
//     yellow,
//     purple,
//   ],
// );
// Gradient sweepGradientBottomBar = const SweepGradient(
//   center: FractionalOffset(193.5 / 360, 53.5 / 360),
//           colors: [
//             Color(0xFF56348B),
//             Color(0xFFFAB71C),
//             Color(0xFFEC672A),
//           ],
//           stops: [0, 0.677, 1],
// );
