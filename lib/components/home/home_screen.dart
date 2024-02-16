import 'dart:math';
import 'dart:ui';

import 'package:shayplanner/components/home/home_controller.dart';
import 'package:shayplanner/components/shops/shops_screen.dart';
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
import 'dart:ui' as ui;
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatelessWidget {
  HomeController homeController = Get.put(HomeController());
  static const routename = '/home';
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: homeController.getData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return HomeScreenUnloaded(); // Shimmer effect while loading
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          return HomeScreenLoaded();
        }
      },
    );
  }
}

class HomeScreenLoaded extends StatelessWidget {
  HomeScreenLoaded({
    Key? key,
  }) : super(key: key);
  HomeController homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
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
                            padding: EdgeInsets.all(4.0.sp),
                            width: 25.0.wp,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ThemeText(
                                    theText: str,
                                    thefontSize: 10.0.sp,
                                    theColor: black),
                                SizedBox(width: 5.0.sp),
                                SvgPicture.asset(
                                    "assets/icons/language_chose_arrow.svg")
                              ],
                            ),
                          ),
                        );
                      }).toList();
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        homeController.selectedLanguage.value == "Fr"
                            ? ThemeText(
                                theText: "Fr",
                                thefontSize: 12.0.sp,
                                theColor: black,
                                theFontWeight: FontWeight.bold)
                            : ThemeText(
                                theText: "An",
                                thefontSize: 12.0.sp,
                                theColor: black,
                                theFontWeight: FontWeight.bold),
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
        color: lightYellowTransparent,
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
              Stack(children: [
                Container(
                  width: Get.width,
                  height: 75.0.hp,
                  decoration: BoxDecoration(
                    boxShadow: themeBoxShadowCard,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0.sp),
                        topRight: Radius.circular(40.0.sp)),
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/models.png'), // Replace 'assets/image.jpg' with your image path
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ),
                Positioned(
                  top: 40.0.hp,
                  left: 7.0.wp,
                  right: 7.0.wp,
                  bottom: 7.0.hp,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.25),
                            borderRadius: BorderRadius.circular(25)),
                        child: Container(
                          padding: EdgeInsets.only(
                            left: 5.0.wp,
                            right: 5.0.wp,
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ThemeText(
                                  theText: "Réservez l'élégance à son apogée",
                                  thefontSize: 18.0.sp,
                                  theColor: white,
                                  theFontWeight: FontWeight.bold,
                                  theTextAlign: TextAlign.center,
                                ),
                                SizedBox(height: 2.0.hp),
                                ThemeInput(
                                  theLabelText: "Nom du Salon",
                                  theHintText: "Nom du salon",
                                  theTextEditingController:
                                      homeController.shopNameEditingController,
                                  theValidation:
                                      homeController.validateUsername,
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
                                  theTextEditingController: homeController
                                      .shopAddressEditingController,
                                  theValidation:
                                      homeController.validateUsername,
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
                                SizedBox(height: 2.0.hp),
                              ]),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
              // ),
              SizedBox(height: 2.0.hp),
              Container(
                margin: EdgeInsets.only(left: 4.0.wp),
                child: ThemeText(
                  theText: "Catégories",
                  theColor: black,
                  thefontSize: 14.0.sp,
                  theFontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 1.0.hp),
              Container(
                alignment: Alignment.center,
                height: 14.0.hp,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(width: 3.0.wp),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomPaint(
                            size: Size(4.0.hp * 2, 4.0 * 2),
                            painter: CirclePainter(
                              percentage: 0.85,
                              // backgroundColor: Colors.red,
                              progressColor: yellow,
                            ),
                            child: CircleAvatar(
                              radius: 4.0.hp,
                              backgroundImage: AssetImage(
                                  "assets/images/template_circle.png"),
                            )),
                        SizedBox(height: 7.0.sp),
                        ThemeText(
                            theText: "Cheuveux",
                            thefontSize: 10.0.sp,
                            theColor: black)
                      ],
                    ),
                    SizedBox(width: 6.0.wp),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomPaint(
                            size: Size(4.0.hp * 2, 4.0 * 2),
                            painter: CirclePainter(
                              percentage: 0.85,
                              // backgroundColor: Colors.red,
                              progressColor: yellow,
                            ),
                            child: CircleAvatar(
                              radius: 4.0.hp,
                              backgroundImage: AssetImage(
                                  "assets/images/template_circle.png"),
                            )),
                        SizedBox(height: 7.0.sp),
                        ThemeText(
                            theText: "Cheuveux",
                            thefontSize: 10.0.sp,
                            theColor: black)
                      ],
                    ),
                    SizedBox(width: 6.0.wp),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomPaint(
                            size: Size(4.0.hp * 2, 4.0 * 2),
                            painter: CirclePainter(
                              percentage: 0.85,
                              // backgroundColor: Colors.red,
                              progressColor: yellow,
                            ),
                            child: CircleAvatar(
                              radius: 4.0.hp,
                              backgroundImage: AssetImage(
                                  "assets/images/template_circle.png"),
                            )),
                        SizedBox(height: 7.0.sp),
                        ThemeText(
                            theText: "Cheuveux",
                            thefontSize: 10.0.sp,
                            theColor: black)
                      ],
                    ),
                    SizedBox(width: 6.0.wp),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomPaint(
                            size: Size(4.0.hp * 2, 4.0 * 2),
                            painter: CirclePainter(
                              percentage: 0.85,
                              // backgroundColor: Colors.red,
                              progressColor: yellow,
                            ),
                            child: CircleAvatar(
                              radius: 4.0.hp,
                              backgroundImage: AssetImage(
                                  "assets/images/template_circle.png"),
                            )),
                        SizedBox(height: 7.0.sp),
                        ThemeText(
                            theText: "Cheuveux",
                            thefontSize: 10.0.sp,
                            theColor: black)
                      ],
                    ),
                    SizedBox(width: 6.0.wp),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomPaint(
                            size: Size(4.0.hp * 2, 4.0 * 2),
                            painter: CirclePainter(
                              percentage: 0.85,
                              // backgroundColor: Colors.red,
                              progressColor: yellow,
                            ),
                            child: CircleAvatar(
                              radius: 4.0.hp,
                              backgroundImage: AssetImage(
                                  "assets/images/template_circle.png"),
                            )),
                        SizedBox(height: 7.0.sp),
                        ThemeText(
                            theText: "Cheuveux",
                            thefontSize: 10.0.sp,
                            theColor: black)
                      ],
                    ),
                    SizedBox(width: 4.0.wp),
                  ],
                ),
              ),
              SizedBox(height: 1.0.hp),
              Container(
                margin: EdgeInsets.only(left: 4.0.wp),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 14.0.sp, color: black),
                    children: [
                      TextSpan(
                        text: 'Nouveau sur ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: 'PLANNER',
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 1.0.hp),
              Container(
                height: 40.0.hp,
                margin: EdgeInsets.symmetric(horizontal: 8.0.sp),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 4.0.wp, bottom: 1.0.hp),
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
                          padding: EdgeInsets.symmetric(horizontal: 5.0.wp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ThemeText(
                                  theText: "Lorem ipsum",
                                  thefontSize: 14.0.sp,
                                  theColor: black,
                                  theFontFamily: "Montserrat-Bold"),
                              ThemeGradContainer(
                                  theWith: 6.0.hp,
                                  theHeight: 4.0.hp,
                                  thePadding: 4.0.sp,
                                  theLinearGradient: yellowFadeGradient,
                                  theContent: SvgPicture.asset(
                                    "assets/icons/arrow_right.svg",
                                  )),
                            ],
                          ),
                        ),
                        Container(
                          width: 87.0.wp,
                          height: 3.0.hp,
                          padding: EdgeInsets.only(
                              left: 5.0.wp, right: 5.0.wp, bottom: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 5.0.wp,
                                height: 5.0.wp,
                                margin: EdgeInsets.only(right: 2.0.sp),
                                child: SvgPicture.asset(
                                    'assets/icons/localization.svg',
                                    color: grey),
                              ),
                              Center(
                                child: Container(
                                  width: 50.0.wp,
                                  margin: EdgeInsets.only(right: 6.0.sp),
                                  child: ThemeText(
                                    theText: "Lorem ipsum dolor sit amet",
                                    thefontSize: 10.0.sp,
                                    theColor: grey,
                                    theMaxOfLines: 1,
                                    theTextDecoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 87.0.wp,
                          height: 3.0.hp,
                          padding: EdgeInsets.only(
                              left: 5.0.wp, right: 5.0.wp, top: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 5.0.wp,
                                height: 5.0.wp,
                                margin: EdgeInsets.only(right: 2.0.sp),
                                child: SvgPicture.asset('assets/icons/star.svg',
                                    color: grey),
                              ),
                              Center(
                                child: Container(
                                  width: 50.0.wp,
                                  margin: EdgeInsets.only(right: 6.0.sp),
                                  child: ThemeText(
                                    theText: "4,9 (317 avis)  MAD",
                                    thefontSize: 10.0.sp,
                                    theColor: grey,
                                    theMaxOfLines: 1,
                                    theTextDecoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 1.0.hp),

                        //  Text("hhhhhh")
                      ]),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.0.hp)
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: 92.0.wp,
        height: 8.0.hp,
        decoration: BoxDecoration(
          color: grey,
          borderRadius: BorderRadius.circular(6.5.wp),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          InkWell(
              onTap: () => {Get.toNamed(HomeScreen.routename)},
              child:SizedBox(
                width: 9.0.wp,
                height: 9.0.wp,
                child:Image.asset('assets/icons/floating_app_bar/home-active.png'),) ,),
          InkWell(
              onTap: () => {},
              child: SizedBox(
                width: 9.0.wp,
                height: 9.0.wp,
                child:Image.asset('assets/icons/floating_app_bar/map.png'),),),
          InkWell(
              onTap: () => {Get.toNamed(ShopsScreen.routename)},
              child: SizedBox(
                width: 9.0.wp,
                height: 9.0.wp,
                child:Image.asset('assets/icons/floating_app_bar/calendar.png'),),),
          InkWell(
              onTap: () => {},
              child:SizedBox(
                width: 9.0.wp,
                height: 9.0.wp,
                child: Image.asset('assets/icons/floating_app_bar/profile.png'),),),
        ]),
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
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);

    Paint progressPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Color(0xFFCFB83F),
          Color(0xFFF4E282),
          Color(0xFFC7AB48),
        ], // Example gradient colors
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

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

class HomeScreenUnloaded extends StatelessWidget {
  HomeController homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
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
                            padding: EdgeInsets.all(4.0.sp),
                            width: 25.0.wp,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ThemeText(
                                    theText: str,
                                    thefontSize: 10.0.sp,
                                    theColor: black),
                                SizedBox(width: 5.0.sp),
                                SvgPicture.asset(
                                    "assets/icons/language_chose_arrow.svg")
                              ],
                            ),
                          ),
                        );
                      }).toList();
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        homeController.selectedLanguage.value == "Fr"
                            ? ThemeText(
                                theText: "Fr",
                                thefontSize: 12.0.sp,
                                theColor: black,
                                theFontWeight: FontWeight.bold)
                            : ThemeText(
                                theText: "An",
                                thefontSize: 12.0.sp,
                                theColor: black,
                                theFontWeight: FontWeight.bold),
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
        color: lightYellowTransparent,
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
              Stack(children: [
                Container(
                  width: Get.width,
                  height: 75.0.hp,
                  decoration: BoxDecoration(
                    boxShadow: themeBoxShadowCard,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0.sp),
                        topRight: Radius.circular(40.0.sp)),
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/models.png'), // Replace 'assets/image.jpg' with your image path
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ),
                Positioned(
                  top: 40.0.hp,
                  left: 7.0.wp,
                  right: 7.0.wp,
                  bottom: 7.0.hp,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.25),
                            borderRadius: BorderRadius.circular(25)),
                        child: Container(
                          padding: EdgeInsets.only(
                            left: 5.0.wp,
                            right: 5.0.wp,
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ThemeText(
                                  theText: "Réservez l'élégance à son apogée",
                                  thefontSize: 18.0.sp,
                                  theColor: white,
                                  theFontWeight: FontWeight.bold,
                                  theTextAlign: TextAlign.center,
                                ),
                                SizedBox(height: 2.0.hp),
                                ThemeInput(
                                  theLabelText: "Nom du Salon",
                                  theHintText: "Nom du salon",
                                  theTextEditingController:
                                      homeController.shopNameEditingController,
                                  theValidation:
                                      homeController.validateUsername,
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
                                  theTextEditingController: homeController
                                      .shopAddressEditingController,
                                  theValidation:
                                      homeController.validateUsername,
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
                                SizedBox(height: 2.0.hp),
                              ]),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
              // ),
              SizedBox(height: 2.0.hp),
              Container(
                margin: EdgeInsets.only(left: 4.0.wp),
                child: ThemeText(
                  theText: "Catégories",
                  theColor: black,
                  thefontSize: 14.0.sp,
                  theFontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 1.0.hp),
              Container(
                alignment: Alignment.center,
                height: 14.0.hp,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: ListView.builder(
                      itemCount: 5, // Adjust the count based on your needs
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            SizedBox(width: 3.0.wp),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomPaint(
                                    size: Size(4.0.hp * 2, 4.0 * 2),
                                    painter: CirclePainter(
                                      percentage: 0.85,
                                      // backgroundColor: Colors.red,
                                      progressColor: yellow,
                                    ),
                                    child: CircleAvatar(
                                      radius: 4.0.hp,
                                      backgroundImage: AssetImage(
                                          "assets/images/template_circle.png"),
                                    )),
                                SizedBox(height: 8.0.sp),
                                Container(
                                    color: Colors.black,
                                    width: 15.0.wp,
                                    height: 5.0.sp)
                              ],
                            ),
                            SizedBox(width: 3.0.wp),
                          ],
                        );
                      }),
                ),
              ),
              SizedBox(height: 1.0.hp),
              Container(
                margin: EdgeInsets.only(left: 4.0.wp),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(fontSize: 14.0.sp, color: black),
                    children: [
                      TextSpan(
                        text: 'Nouveau sur ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: 'PLANNER',
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 1.0.hp),
              Container(
                height: 40.0.hp,
                margin: EdgeInsets.symmetric(horizontal: 8.0.sp),
                child: ListView.builder(
                    itemCount: 5, // Adjust the count based on your needs
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Container(
                            margin:
                                EdgeInsets.only(right: 4.0.wp, bottom: 1.0.hp),
                            decoration: BoxDecoration(
                                boxShadow: themeBoxShadowCard,
                                borderRadius: BorderRadius.circular(25)),
                            child: Column(children: [
                              Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
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
                              ),
                              Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  height: 5.0.hp,
                                  width: 87.0.wp,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 9.0.sp),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          width: 30.0.wp,
                                          height: 8.0.sp,
                                          color: Colors.black),
                                      ThemeGradContainer(
                                          theWith: 6.0.hp,
                                          theHeight: 4.0.hp,
                                          thePadding: 4.0.sp,
                                          theLinearGradient: yellowFadeGradient,
                                          theContent: SvgPicture.asset(
                                            "assets/icons/arrow_right.svg",
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                              Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                  width: 87.0.wp,
                                  height: 4.0.hp,
                                  padding: EdgeInsets.only(
                                      left: 9.0.sp,
                                      right: 15.0.wp,
                                      top: 1.2.hp,
                                      bottom: 1.2.hp),
                                  child: Container(
                                    width: 50.0.wp,
                                    height: 1.0.hp,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Shimmer.fromColors(
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[100]!,
                                child: Container(
                                    width: 87.0.wp,
                                    height: 4.0.hp,
                                    padding: EdgeInsets.only(
                                        left: 9.0.sp,
                                        right: 25.0.wp,
                                        top: 1.2.hp,
                                        bottom: 1.2.hp),
                                    child: Container(
                                      width: 50.0.wp,
                                      height: 1.0.hp,
                                      color: Colors.black,
                                    )),
                              ),
                              SizedBox(height: 1.0.hp),
                            ]),
                          ),
                        ],
                      );
                    }),
              ),
              SizedBox(height: 10.0.sp)
            ],
          ),
        ),
      ),
    );
  }
}
