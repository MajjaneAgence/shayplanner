import 'package:shayplanner/components/introduction/introduction_controller.dart';
import 'package:shayplanner/tools/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

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
          Container(
        width: 100.0.wp,
        height: 100.0.hp,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFFFFFF),
              Color(0xFFC39800),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 18.0.hp,
              ),
              SizedBox(
                width: 60.0.wp,
                height: 60.0.wp,
                child: Image.asset(
                  'assets/images/logo103.png',
                ),
              ),
              SizedBox(
                height: 15.0.hp,
              ),
              SizedBox(
                width: 80.0.wp,
                height: 7.0.hp,
                child: ElevatedButton(
                  onPressed: () {
                    introductionController.bookAppointement();
                  },
                  child: Text(
                    'Je souhaite réserver un RDV',
                    style: TextStyle(fontSize: 12.0.sp),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(
                        255, 255, 255, 255), // Adjust button color
                    onPrimary:
                        Color.fromARGB(255, 22, 20, 20), // Adjust text color
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
                height: 4.0.hp,
              ),
              SizedBox(
                width: 80.0.wp,
                height: 7.0.hp,
                child: ElevatedButton(
                  onPressed: () {
                    introductionController.onButton2Pressed();
                  },
                  child: Text(
                    'Ajouter mon établissement',
                    style: TextStyle(fontSize: 12.0.sp),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(
                        255, 255, 255, 255), // Adjust button color
                    onPrimary:
                        Color.fromARGB(255, 22, 20, 20), // Adjust text color
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
                child: Text('Suivez nous',
                    style: TextStyle(
                        fontSize: 15.0.sp, fontWeight: FontWeight.w700)),
              ),
              SizedBox(
                height: 1.5.hp,
              ),
              SizedBox(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
            ],
          ),
        ),
      ),
    );
  }
}
