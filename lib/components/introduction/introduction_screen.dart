import 'package:shayplanner/components/introduction/introduction_controller.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/theme/theme_text.dart';
import 'package:shayplanner/tools/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  static const routename = '/introduction';

  @override
  Widget build(BuildContext context) {
    final IntroductionController introductionController =
        Get.put(IntroductionController());

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: // Use Stack to position elements freely
          Stack(
        children: [
          Positioned(
            top: 60.0.hp,
            child: Container(
              width: 100.0.wp,
              height: 40.0.hp,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(76, 75, 75, 0),
                      Color.fromRGBO(45, 45, 45, 0.9),
                      black,
                    ],
                    stops: [
                      0.3,
                      0.6,
                      1
                    ]),
              ),
            ),
          ),
          Container(
            width: 100.0.wp,
            height: 100.0.hp,
            decoration: BoxDecoration(
              backgroundBlendMode: BlendMode.plus,
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [white, brown, yellow.withOpacity(0.3)],
                  stops: [0.3, 0.7, 1]),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20.0.hp,
                  ),
                  SizedBox(
                    width: 65.0.wp,
                    height: 65.0.wp,
                    child: Image.asset(
                      'assets/images/logo.png',
                    ),
                  ),
                  SizedBox(
                    height: 10.0.hp,
                  ),
                  SizedBox(
                    width: 80.0.wp,
                    height:7.0.hp,
                    child: ElevatedButton(
                      onPressed: () {
                        introductionController.bookAppointement();
                      },
                      child: ThemeText(
                        theText: "Je souhaite réserver un RDV",
                        thefontSize: 12.0.sp,
                        theColor: black,
                        theFontFamily: fontBold,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(
                            255, 255, 255, 255), // Adjust button color
                        onPrimary: Color.fromARGB(
                            255, 22, 20, 20), // Adjust text color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0.sp),
                          side: BorderSide(
                            color: Color(0xFFC39800), // Set border color
                            width: 2.0, // Set border width
                          ), // Set border radius // Set border radius
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3.0.hp,
                  ),
                  SizedBox(
                    width: 80.0.wp,
                    height: 7.0.hp,
                    child: ElevatedButton(
                      onPressed: () {
                        introductionController.bookAppointement();
                      },
                      child: ThemeText(
                        theText: "Ajouter mon établissement",
                        thefontSize: 12.0.sp,
                        theColor: black,
                        theFontFamily: fontBold,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(
                            255, 255, 255, 255), // Adjust button color
                        onPrimary: Color.fromARGB(
                            255, 22, 20, 20), // Adjust text color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0.sp),
                          side: BorderSide(
                            color: Color(0xFFC39800), // Set border color
                            width: 2.0, // Set border width
                          ), // Set border radius
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.0.hp,
                  ),
                  SizedBox(
                    child:ThemeText(
                        theText: "Suivez-nous",
                        thefontSize: 10.0.sp,
                        theColor: black,
                        theFontFamily: fontBold,
                      ),
                  ),
                  SizedBox(
                    height: 1.5.hp,
                  ),
                  SizedBox(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // InkWell()
                          SvgPicture.asset("assets/icons/fb.svg"),
                          SizedBox(
                            width: 3.0.wp,
                          ),
                          SvgPicture.asset("assets/icons/ig.svg"),
                          SizedBox(
                            width: 3.0.wp,
                          ),
                          Image.asset("assets/icons/tiktok.png"),
                        ]),
                  ),
                  SizedBox(height: 4.0.hp)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
