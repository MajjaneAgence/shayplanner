import 'dart:ui';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shayplanner/components/home/home_controller.dart';
import 'package:shayplanner/components/login/login_controller.dart';
import 'package:shayplanner/components/rating_salon/rating_salon_controller.dart';
import 'package:shayplanner/theme/theme_app_bar.dart';
import 'package:shayplanner/theme/theme_button.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/theme/theme_grad_container.dart';
import 'package:shayplanner/theme/theme_input.dart';
import 'package:shayplanner/theme/theme_text.dart';
import 'package:shayplanner/tools/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:text_area/text_area.dart';

class RatingSalonScreen extends StatelessWidget {

  const RatingSalonScreen({super.key});

  static const routename = '/rating_salon';

  @override
  Widget build(BuildContext context) {
    final RatingSalonController ratingsalonController = Get.put(RatingSalonController());
    final HomeController homeController = Get.put(HomeController());

    final LoginController loginController = Get.put(LoginController());


    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Container(),
        leadingWidth: 10.0.wp,
        title: Image.asset(
          "assets/icons/logo.png",
        ),
        centerTitle: true,
        toolbarHeight: 10.0.hp,
      ),
      body: Container(
        width: 100.0.wp,
        height: 90.0.hp,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Stack(children: [
            Container(
              width: Get.width,
              height: 90.0.hp,
              padding: EdgeInsets.only(
                top: 4.0.hp,
                bottom: 4.0.hp,
                right: 2.5.wp,
                left: 2.5.wp,
              ),
              decoration: BoxDecoration(
                boxShadow: themeBoxShadowCard,
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/rating.png'), // Replace 'assets/image.jpg' with your image path
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),

            Positioned(
              top: 15.0.hp,
              left: 7.0.wp,
              right: 7.0.wp,
              bottom: 10.0.hp,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(25)
                    ),
                    child: Container(
                      padding: EdgeInsets.only(
                        left: 5.0.wp,
                        right: 5.0.wp,
                      ),
                      child: Column(
                          children: [
                            SizedBox(height: 4.0.hp,),
                            ThemeText(
                              theText: "tr_question_rating_salon".tr,
                              thefontSize: 18.0.sp,
                              theColor: white,
                              theFontWeight: FontWeight.bold,
                              theTextAlign: TextAlign.center,
                            ),
                            SizedBox(height: 4.0.hp),
                            // SvgPicture.asset("assets/svg/rating_logo_app.svg"),
                            Image.asset("assets/images/rating_salon.png"),
                            SizedBox(height: 4.0.hp,),
                            RatingBar.builder(
                              initialRating: 0,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                // You can use this callback to get the selected rating
                              },
                            ),
                            SizedBox(height: 3.0.hp),
                            Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3), // Shadow color
                                    spreadRadius: 2,  // Spread radius
                                    blurRadius: 7,    // Blur radius
                                    offset: Offset(0, 2), // Offset
                                  ),
                                ],
                              ),
                              child:  TextField(
                                keyboardType: TextInputType.multiline,
                                maxLines: 2,
                                decoration: InputDecoration( 
                                  filled: true,
                                  
                                  fillColor: Colors.white,
                                  hintText: "tr_less_comment".tr,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(width: 1, color: Colors.transparent),
                                      borderRadius: BorderRadius.circular(15.0),
                                  )
                                ),
                        
                              ),
                            ),
                            SizedBox(height: 2.0.hp),
                            Container(
                              alignment: Alignment.centerRight,
                              width: 100.0.wp,
                              child: ThemeButton(
                                theContent: Container(
                                  alignment: Alignment.center,
                                  width: 40.0.wp,
                                  height: 6.0.hp,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 5.0.wp, vertical: 1.0.hp,
                                  ),
                                  decoration: BoxDecoration(
                                    color: crem,
                                    borderRadius: BorderRadius.circular(2.0.wp),
                                  ),
                                  child: ThemeText(
                                    theText: "tr_end".tr,
                                    thefontSize: 11.0.sp,
                                    theFontWeight: FontWeight.bold,
                                    theColor: white,
                                  ),
                                ),
                              theFormKey: loginController.formKey,
                              theAction: loginController.goToPasswordScreen,
                              theLoadingStatus: loginController.isLoading.value),
                            ),
                          ]),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}