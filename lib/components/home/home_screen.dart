import 'dart:math';

import 'package:shayplanner/components/home/home_controller.dart';
import 'package:shayplanner/theme/theme_app_bar.dart';
import 'package:shayplanner/theme/theme_button.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/theme/theme_grad_container.dart';
import 'package:shayplanner/theme/theme_input.dart';
import 'package:shayplanner/theme/theme_text.dart';
import 'package:shayplanner/tools/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key? key,
  }) : super(key: key);
  HomeController homeController = Get.put(HomeController());
  static const routename = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // for the appBar we're going to give it 10% of the height
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that
        // was created by the App.build method, and use it to set
        // our appbar title.
        ///tresse
        backgroundColor: Colors.white,
        leading: Padding(
            padding: EdgeInsets.only(left: 4.0.wp),
            child: Row(
              children: [
                Obx(
                  () => PopupMenuButton<String>(
                    position: PopupMenuPosition.under,
                    //offset: Offset(-10, 0),
                    color: Colors.transparent,
                    elevation: 0,
                    itemBuilder: (context) {
                      return homeController.lanuages.map((str) {
                        return PopupMenuItem(
                          value: str,
                          height: 8.0.wp,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(253, 250, 242, 1),
                                borderRadius: BorderRadius.circular(5.0)),
                            padding: EdgeInsets.all(4),
                            width: double.infinity,
                            child: Text(str),
                          ),
                        );
                      }).toList();
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        homeController.selectedLanguage.value == "Fr"
                            ? Text(
                                "Fr",
                                style: TextStyle(color: Colors.black),
                              )
                            : Text("An", style: TextStyle(color: Colors.black)),
                        SizedBox(width: 4.0.sp),
                        SvgPicture.asset("assets/icons/drop_down.svg"),
                      ],
                    ),
                    onSelected: (v) {
                      print(v);
                      if (v == "Français") {
                        homeController.selectedLanguage.value = "Fr";
                        homeController.selectedLanguage.refresh();
                      } else {
                        homeController.selectedLanguage.value = "An";
                        homeController.selectedLanguage.refresh();
                      }
                    },
                  ),
                ),
                SizedBox(width: 3.0.wp),
                SvgPicture.asset(
                  "assets/icons/bell.svg",
                  width: 20,
                  height: 20,
                ),
              ],
            )),
        leadingWidth: 25.0.wp,
        title: Image.asset(
          "assets/images/logo.png",
          width: 9.0.hp,
          height: 9.0.hp,
        ),
        centerTitle: true,
        actions: [
          ThemeGradContainer(
              theWith: 5.0.hp,
              theHeight: 5.0.hp,
              theMargin: 2.5.hp,
              theLinearGradient: greyYellowLinearGradient,
              theContent: Image.asset(
                "assets/icons/user.png",
              )),
          SizedBox(width: 3.0.wp),
        ],
        toolbarHeight: 10.0.hp,
      ),
      // first we're going to add a container that will occupy the whole width and 90% of the height
      body: Container(
        //we're going to add some padding horizontally for the container in order
        //that the content will not stick to the edge of the screen
        padding: EdgeInsets.all(0),
        width: Get.width,
        height:
            90.0.hp, // 10 percent of the height is a lready taken by the appbar
        // inside the container we're going to use SingleScrollView so that if the screen is not
        // long enought he content will scroll
        child: SingleChildScrollView(
          // we're going to use the Column widget inside the SingleChildScrollView in order
          //to place multiple widget whithin the SingleChildScrollView Widget
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: Get.width,
                height: 70.0.hp,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/models.png'), // Replace 'assets/image.jpg' with your image path
                    fit: BoxFit.cover,
                  ),
                ),
                child: Opacity(
                  opacity: 0.85,
                  child: Container(
                    margin: EdgeInsets.only(
                        top: 40.0.hp,
                        left: 7.0.wp,
                        right: 7.0.wp,
                        bottom: 10.0.hp),
                    padding: EdgeInsets.only(
                      left: 5.0.wp,
                      right: 5.0.wp,
                    ),
                    height: 30.0.hp,
                    width: 75.0.wp,
                    decoration: BoxDecoration(
                        //color: Colors.transparent,
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(25)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Réservez l'élégance à son apogée"),
                          SizedBox(height: 3.0.hp),
                          ThemeInput(
                            theLabelText: "Nom du Salon",
                            theHintText: "Nom du salon",
                            theTextEditingController:
                                homeController.shopNameEditingController,
                            theValidation: homeController.validateUsername,
                            theContentPadding: 5.0.sp,
                            theIconWidget: ThemeGradContainer(
                              theHeight: 3.0.wp,
                              theWith: 3.0.wp,
                              theMargin: 5.0.sp,
                              theLinearGradient: yellowFadeGradient,
                              theContent: Image.asset(
                                "assets/icons/shop.png",
                                color: Colors.white,
                              ),
                            ),
                            theFloatingLabelBehaviour:
                                FloatingLabelBehavior.never,
                          ),
                          SizedBox(height: 1.0.hp),
                          ThemeInput(
                            theLabelText: "Adresse du Salon",
                            theHintText: "Adresse du salon",
                            theTextEditingController:
                                homeController.shopAddressEditingController,
                            theValidation: homeController.validateUsername,
                            theContentPadding: 5.0.sp,
                            theIconWidget: ThemeGradContainer(
                              theHeight: 3.0.wp,
                              theWith: 3.0.wp,
                              theLinearGradient: yellowFadeGradient,
                              theMargin: 5.0.sp,
                              theContent: Image.asset(
                                "assets/icons/localization.png",
                              ),
                            ),
                            theFloatingLabelBehaviour:
                                FloatingLabelBehavior.never,
                          ),
                        ]),
                  ),
                ),
              ),
              ThemeText(
                theText: "Catégorie",
                theColor: black,
                thefontSize: 14.0.sp,
              ),
              SizedBox(
                height: 10.0.hp,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(width: 2.0.wp),
                    CustomPaint(
                      size: Size(4.0.hp * 2, 4.0 * 2),
                      painter: CirclePainter(
                        percentage: 0.85,
                        // backgroundColor: Colors.red,
                        progressColor: Colors.green,
                      ),
                      child: Container(
                        width: 8.0.hp,
                        height: 8.0.hp,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/images/template_circle.png",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 4.0.wp),
                    CustomPaint(
                      size: Size(4.0.hp * 2, 4.0 * 2),
                      painter: CirclePainter(
                        percentage: 0.85,
                        // backgroundColor: Colors.red,
                        progressColor: Colors.green,
                      ),
                      child: Container(
                        width: 8.0.hp,
                        height: 8.0.hp,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/images/template_circle.png",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 4.0.wp),
                    CustomPaint(
                      size: Size(4.0.hp * 2, 4.0 * 2),
                      painter: CirclePainter(
                        percentage: 0.85,
                        // backgroundColor: Colors.red,
                        progressColor: Colors.green,
                      ),
                      child: Container(
                        width: 8.0.hp,
                        height: 8.0.hp,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/images/template_circle.png",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 4.0.wp),
                    CustomPaint(
                      size: Size(4.0.hp * 2, 4.0 * 2),
                      painter: CirclePainter(
                        percentage: 0.85,
                        // backgroundColor: Colors.red,
                        progressColor: Colors.green,
                      ),
                      child: Container(
                        width: 8.0.hp,
                        height: 8.0.hp,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/images/template_circle.png",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 4.0.wp),
                    CustomPaint(
                      size: Size(4.0.hp * 2, 4.0 * 2),
                      painter: CirclePainter(
                        percentage: 0.85,
                        // backgroundColor: Colors.red,
                        progressColor: Colors.green,
                      ),
                      child: Container(
                        width: 8.0.hp,
                        height: 8.0.hp,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/images/template_circle.png",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 4.0.wp),
                    CustomPaint(
                      size: Size(4.0.hp * 2, 4.0 * 2),
                      painter: CirclePainter(
                        percentage: 0.85,
                        // backgroundColor: Colors.red,
                        progressColor: Colors.green,
                      ),
                      child: Container(
                        width: 8.0.hp,
                        height: 8.0.hp,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/images/template_circle.png",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 4.0.wp),
                    CustomPaint(
                      size: Size(4.0.hp * 2, 4.0 * 2),
                      painter: CirclePainter(
                        percentage: 0.85,
                        // backgroundColor: Colors.red,
                        progressColor: Colors.green,
                      ),
                      child: Container(
                        width: 8.0.hp,
                        height: 8.0.hp,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/images/template_circle.png",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 4.0.wp),
                  ],
                ),
              ),
              ThemeText(
                theText: "Nouveau sur PLANNER",
                theColor: black,
                thefontSize: 14.0.sp,
              ),
              Container(
                height: 40.0.hp,
                margin: EdgeInsets.symmetric(horizontal: 8.0.sp),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 4.0.wp,bottom: 1.0.hp),
                      decoration: BoxDecoration(
                          boxShadow: themeBoxShadowCard,
                          borderRadius: BorderRadius.circular(25)),
                      child: Column(children: [
                        Container(
                          height: 25.0.hp,
                          width: 87.0.wp,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(18.0.sp),
                                topRight: Radius.circular(18.0.sp)),
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/images/model_on_mirror.png",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          height: 5.0.hp,
                          width: 87.0.wp,
                          padding: EdgeInsets.symmetric(horizontal: 9.0.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Lorem ipsum"),
                              ThemeGradContainer(
                                  theWith: 7.0.wp,
                                  theHeight: 7.0.wp,
                                  thePadding: 4.0.sp,
                                  theLinearGradient: greyYellowLinearGradient,
                                  theContent: SvgPicture.asset(
                                    "assets/icons/arrow_right.svg",
                                  )),
                            ],
                          ),
                        ),
                        Container(
                          width: 87.0.wp,
                          height: 4.0.hp,
                          padding: EdgeInsets.symmetric(horizontal: 9.0.sp),
                          child: RichText(
                            text: TextSpan(
                              style:
                                  TextStyle(fontSize: 24, color: Colors.black),
                              children: [
                                WidgetSpan(
                                  child: Container(
                                    width: 5.0.wp,
                                    height: 5.0.wp,
                                    margin: EdgeInsets.only(right: 6.0.sp),
                                    child: SvgPicture.asset(
                                        'assets/icons/bell.svg'),
                                  ),
                                ),
                                WidgetSpan(
                                    child: ThemeText(
                                        theText: "Lorem ipsum dolor sit amet,",
                                        thefontSize: 10.0.sp,
                                        theColor: black)),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 87.0.wp,
                          height: 4.0.hp,
                          padding: EdgeInsets.symmetric(horizontal: 9.0.sp),
                          child: RichText(
                            text: TextSpan(
                              style:
                                  TextStyle(fontSize: 24, color: Colors.black),
                              children: [
                                WidgetSpan(
                                  child: Container(
                                    width: 5.0.wp,
                                    height: 5.0.wp,
                                    margin: EdgeInsets.only(right: 6.0.sp),
                                    child: SvgPicture.asset(
                                        'assets/icons/bell.svg'),
                                  ),
                                ),
                                WidgetSpan(
                                    child: ThemeText(
                                        theText: "Lorem ipsum dolor sit amet,",
                                        thefontSize: 10.0.sp,
                                        theColor: black)),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 1.0.hp),
                        
                        //  Text("hhhhhh")
                      ]),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 4.0.wp,bottom: 1.0.hp),
                      decoration: BoxDecoration(
                          boxShadow: themeBoxShadowCard,
                          borderRadius: BorderRadius.circular(25)),
                      child: Column(children: [
                        Container(
                          height: 25.0.hp,
                          width: 87.0.wp,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(18.0.sp),
                                topRight: Radius.circular(18.0.sp)),
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/images/model_on_mirror.png",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          height: 5.0.hp,
                          width: 87.0.wp,
                          padding: EdgeInsets.symmetric(horizontal: 9.0.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Lorem ipsum"),
                              ThemeGradContainer(
                                  theWith: 7.0.wp,
                                  theHeight: 7.0.wp,
                                  thePadding: 4.0.sp,
                                  theLinearGradient: greyYellowLinearGradient,
                                  theContent: SvgPicture.asset(
                                    "assets/icons/arrow_right.svg",
                                  )),
                            ],
                          ),
                        ),
                        Container(
                          width: 87.0.wp,
                          height: 4.0.hp,
                          padding: EdgeInsets.symmetric(horizontal: 9.0.sp),
                          child: RichText(
                            text: TextSpan(
                              style:
                                  TextStyle(fontSize: 24, color: Colors.black),
                              children: [
                                WidgetSpan(
                                  child: Container(
                                    width: 5.0.wp,
                                    height: 5.0.wp,
                                    margin: EdgeInsets.only(right: 6.0.sp),
                                    child: SvgPicture.asset(
                                        'assets/icons/bell.svg'),
                                  ),
                                ),
                                WidgetSpan(
                                    child: ThemeText(
                                        theText: "Lorem ipsum dolor sit amet,",
                                        thefontSize: 10.0.sp,
                                        theColor: black)),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 87.0.wp,
                          height: 4.0.hp,
                          padding: EdgeInsets.symmetric(horizontal: 9.0.sp),
                          child: RichText(
                            text: TextSpan(
                              style:
                                  TextStyle(fontSize: 24, color: Colors.black),
                              children: [
                                WidgetSpan(
                                  child: Container(
                                    width: 5.0.wp,
                                    height: 5.0.wp,
                                    margin: EdgeInsets.only(right: 6.0.sp),
                                    child: SvgPicture.asset(
                                        'assets/icons/bell.svg'),
                                  ),
                                ),
                                WidgetSpan(
                                    child: ThemeText(
                                        theText: "Lorem ipsum dolor sit amet,",
                                        thefontSize: 10.0.sp,
                                        theColor: black)),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 1.0.hp),
                        
                        //  Text("hhhhhh")
                      ]),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0.sp)
            ],
          ),
        ),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  final double percentage;
  final Color progressColor;
  final double
      strokeWidth; // Added strokeWidth to control the thickness of the progress arc

  CirclePainter({
    required this.percentage,
    required this.progressColor,
    this.strokeWidth = 4.0, // Default stroke width
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint bgPaint = Paint()..style = PaintingStyle.fill;

    Paint progressPaint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth; // Set the stroke width

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);

    // Calculate the inner radius by subtracting the strokeWidth from the outer radius
    double innerRadius = radius + strokeWidth / 2 + 2.0.sp;

    canvas.drawCircle(center, radius, bgPaint);

    double sweepAngle = 2 * pi * percentage;
    canvas.drawArc(
      Rect.fromCircle(
          center: center, radius: innerRadius), // Use the inner radius here
      -pi / 2,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
