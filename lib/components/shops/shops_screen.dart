import 'dart:math';

import 'package:shayplanner/components/home/home_screen.dart';
import 'package:shayplanner/components/shops/shops_controller.dart';
import 'package:shayplanner/theme/theme_button.dart';
import 'package:shayplanner/theme/theme_button.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/theme/theme_grad_container.dart';
import 'package:shayplanner/theme/theme_input.dart';
import 'package:shayplanner/theme/theme_text.dart';
import 'package:shayplanner/tools/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ShopsScreen extends StatelessWidget {
  ShopsScreen({
    Key? key,
  }) : super(key: key);
  static const routename = '/shops';
  ShopsController shopsController = Get.put(ShopsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // for the appBar we're going to give it 10% of the height
      backgroundColor: lightYellow,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that
        // was created by the App.build method, and use it to set
        // our appbar title.
        ///tresse
        backgroundColor: Colors.white,
        leading: InkWell(
            onTap: () {
              Get.toNamed(HomeScreen.routename);
            },
            child: Container(
              padding: EdgeInsets.only(left: 2.0.sp),
              margin:
                  EdgeInsets.symmetric(horizontal: 6.0.sp, vertical: 8.0.sp),
              child: SvgPicture.asset(
                "assets/icons/arrow_left.svg",
              ),
            )),
        leadingWidth: 10.0.wp,
        title: (Image.asset(
          "assets/images/logo.png",
          width: 9.0.hp,
          height: 9.0.hp,
        )),
        centerTitle: true,
        actions: [],
        toolbarHeight: 10.0.hp,
      ),
      // first we're going to add a container that will occupy the whole width and 90% of the height
      body: SizedBox(
        //we're going to add some padding horizontally for the container in order
        //that the content will not stick to the edge of the screen
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
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 3.0.hp, bottom: 3.0.hp),
                  height: 6.0.hp,
                  width: 87.0.wp,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0.sp),
                    boxShadow: [themeBoxShadowInput],
                  ),
                  child: ThemeInput(
                    theHintText: "Nom du salon",
                    theLabelText: "Nom du salon",
                    theTextEditingController:
                        shopsController.keywordEditingController,
                    theValidation: shopsController.dontValidate,
                    theContentPadding: 5.0.sp,
                    theIconWidget: ThemeGradContainer(
                      theHeight: 3.0.wp,
                      theWith: 3.0.wp,
                      theMargin: 5.0.sp,
                      theLinearGradient: yellowFadeGradient,
                      theContent: Icon(Icons.search, color: Colors.white),
                    ),
                    theFloatingLabelBehaviour: FloatingLabelBehavior.never,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 6.0.wp, bottom: 1.0.hp),
                child: ThemeText(
                    theText: "Sélectionner un salon",
                    theColor: black,
                    thefontSize: 14.0.sp,
                    theFontWeight: FontWeight.bold),
              ),
              Container(
                margin: EdgeInsets.only(left: 6.0.wp, bottom: 1.0.hp),
                child: ThemeText(
                  theText:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit,",
                  theColor: black,
                  thefontSize: 11.0.sp,
                ),
              ),
              Container(
                height: 62.0.hp,
                margin: EdgeInsets.symmetric(horizontal: 8.0.sp),
                child: ListView(children: [
                  Column(children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 8.0.sp),
                      decoration: BoxDecoration(
                          boxShadow: themeBoxShadowCard,
                          borderRadius: BorderRadius.circular(25)),
                      child: Column(children: [
                        Container(
                          height: 25.0.hp,
                          width: 97.0.wp,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25)),
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/images/model_on_mirror.png",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          width: 92.0.wp,
                          height: 4.0.hp,
                          padding: EdgeInsets.symmetric(
                              horizontal: 9.0.sp, vertical: 4.0.sp),
                          child: ThemeText(
                            theText: "Lorem ipsum",
                            thefontSize: 14.0.sp,
                            theColor: grey,
                            theFontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          width: 92.0.wp,
                          height: 4.0.hp,
                          padding: EdgeInsets.symmetric(horizontal: 9.0.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 5.0.wp,
                                height: 4.0.wp,
                                margin: EdgeInsets.only(right: 2.0.sp),
                                child:
                                    SvgPicture.asset('assets/icons/bell.svg'),
                              ),
                              Container(
                                width: 50.0.wp,
                                margin: EdgeInsets.only(right: 6.0.sp),
                                child: ThemeText( 
                                  theText: "Lorem ipsum dolor sit amet",
                                  thefontSize: 10.0.sp,
                                  theColor: black,
                                  theMaxOfLines: 1,
                                ),
                              ),
                              Container(
                                width: 20.0.wp,
                                child:
                              ThemeButton(
                                  theContent: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 6.0.sp, vertical: 5.0.sp),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      color: grey,
                                    ),
                                    child: ThemeText(
                                      theText: "Fiche du salon",
                                      thefontSize: 9.0.sp,
                                      theColor: white,
                                      theFontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  theAction: shopsController.goToSalonSheet,
                                  theLoadingStatus:
                                      shopsController.isLoading.value))
                            ],
                          ),
                        ),
                        Container(
                            width: 92.0.wp,
                            height: 4.0.hp,
                            padding: EdgeInsets.symmetric(
                                horizontal: 9.0.sp, vertical: 2.0.sp),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 5.0.wp,
                                    height: 4.0.wp,
                                    margin: EdgeInsets.only(right: 6.0.sp),
                                    child: SvgPicture.asset(
                                        'assets/icons/bell.svg'),
                                  ),
                                  Container(
                                    width: 70.0.wp,
                                    margin: EdgeInsets.only(right: 6.0.sp),
                                    child: ThemeText(
                                      theText: "Lorem ipsum dolor sit amet",
                                      thefontSize: 10.0.sp,
                                      theColor: black,
                                      theMaxOfLines: 1,
                                    ),
                                  ),
                                ])),
                        Container(
                          width: 92.0.wp,
                       //   height: 5.0.hp,
                          padding: EdgeInsets.symmetric(horizontal: 9.0.sp),
                          child: Column(
                            children: [
                              Container(
                                width: 92.0.wp,
                                height: 5.0.hp,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: ThemeText(
                                        theText: "Matin",
                                        thefontSize: 10.0.sp,
                                        theColor: grey,
                                        theFontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: ListView(
                                          scrollDirection: Axis.horizontal,
                                          children:
                                              shopsController.buildDaysList()),
                                    ),
                                  ],
                                ),
                              ),
                              Obx(() => shopsController.isShowingWorkHours.value?
                               Container(
                                width: 92.0.wp,
                                height: 5.0.hp,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: ThemeText(
                                        theText: "Matin",
                                        thefontSize: 10.0.sp,
                                        theColor: grey,
                                        theFontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: ListView(
                                          scrollDirection: Axis.horizontal,
                                          children:
                                              shopsController.buildDaysList()),
                                    ),
                                  ],
                                ),
                              ):
                              SizedBox()
                              
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 92.0.wp,
                          height: 5.0.hp,
                          padding: EdgeInsets.symmetric(horizontal: 9.0.sp),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: ThemeText(
                                    theText: "Après-midi",
                                    thefontSize: 10.0.sp,
                                    theColor: grey,
                                    theFontWeight: FontWeight.bold),
                              ),
                              Expanded(
                                flex: 3,
                                child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: shopsController.buildDaysList()),
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ),
                    SizedBox(height: 1.0.hp),
                    ThemeButton(
                        theContent: ThemeGradContainer(
                          theWith: 30.0.wp,
                          theHeight: 5.0.hp,
                          theLinearGradient: greyYellowLinearGradient,
                          theContent: Center(
                              child: ThemeText(
                                  theText: "Prendre Rdv",
                                  thefontSize: 12.0.sp,
                                  theColor: white)),
                        ),
                        theAction: shopsController.book,
                        theLoadingStatus: shopsController.isLoading.value)
                  ]),
                ]),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: ElevatedButton( onPressed:() => {},
      child: Text("hhhhh")),
    );
  }
}
