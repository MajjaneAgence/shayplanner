import 'package:shayplanner/components/home_page/home_page_controller.dart';
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
import 'package:url_launcher/url_launcher.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  static const routename = '/home_page';

  @override
  Widget build(BuildContext context) {
    final HomePageController homepageController = Get.put(HomePageController());

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        toolbarHeight: 12.0.hp,
        backgroundColor: Colors.white,
        leading:  Padding( 
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
                      return homepageController.lanuages.map((str) {
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
                        homepageController.selectedLanguage.value == "Fr"
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
                        homepageController.selectedLanguage.value = "Fr";
                        homepageController.selectedLanguage.refresh();
                      } else {
                        homepageController.selectedLanguage.value = "An";
                        homepageController.selectedLanguage.refresh();
                      }
                    },
                  ),
                ),
                SizedBox(width: 3.0.wp,),
                SvgPicture.asset(
                  "assets/icons/bell.svg",
                  width: 20,
                  height: 20,
                ),
            ]
          ),
        ),
        leadingWidth: 30.0.wp,
        title: Image.asset("assets/images/logo2.png",width: 100.0,height: 100.0,),
        centerTitle: true,
        actions: [
          Padding(
            padding: 
              EdgeInsets.only(right: 3.0.wp),
              child: Image.asset("assets/images/usericone.png"),
          ),
        ],
      ),
      body:  // Use Stack to position elements freely
        Container(
          width: 100.0.wp,
          height: 88.0.hp,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 78.0.hp,
                  width: 100.0.wp,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/images/test.png"),fit: BoxFit.cover,alignment: Alignment.topCenter),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0.wp),
                      topRight: Radius.circular(15.0.wp),
                    ),
                  ),
                  child: Opacity(opacity: 0.9,
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 40.0.hp,
                        left: 5.0.wp,
                        bottom: 10.0.hp,
                        right: 5.0.wp,
                      ),
                      padding: EdgeInsets.only(
                        left: 5.0.wp,
                        right: 5.0.wp,
                      ),
                      height: 30.0.hp,
                      width: 100.0.wp,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10.0.wp),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Réservez l'élégance à son apogée",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 15.0.sp,fontWeight: FontWeight.w600,fontFamily: 'Montserrat-bold'),),
                          SizedBox(height: 1.0.hp,),
                          ThemeInput(
                            theLabelText: "Nom du Salon",
                            theHintText: "Nom du salon",
                            theTextEditingController:
                                homepageController.shopNameEditingController,
                            theValidation: homepageController.validateUsername,
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
                          SizedBox(height: 1.0.hp,),
                          ThemeInput(
                            theLabelText: "Adress, ville...",
                            theHintText: "Adress, ville...",
                            theTextEditingController:
                                homepageController.shopNameEditingController,
                            theValidation: homepageController.validateUsername,
                            theContentPadding: 5.0.sp,
                            theIconWidget: ThemeGradContainer(
                              theHeight: 3.0.wp,
                              theWith: 3.0.wp,
                              theMargin: 5.0.sp,
                              theLinearGradient: yellowFadeGradient,
                              theContent: Image.asset(
                                "assets/icons/localization.png",
                                color: Colors.white,
                              ),
                            ),
                            theFloatingLabelBehaviour:
                                FloatingLabelBehavior.never,
                          ),
                        ],
                      ),
                      
                    ),
                  ),
                ),
                Container(
                  width: 100.0.wp,
                  margin: EdgeInsets.only(
                    top: 2.5.hp, 
                    left: 3.0.wp, 
                  ),
                  child: Column(
                    children: [
                      ThemeText(
                        theText: "Catégorie",
                        theColor: black,
                        thefontSize: 14.0.sp,
                        theFontWeight: FontWeight.w600,
                      ),
                      SizedBox(height: 1.0.hp,),
                      SizedBox(
                        height: 12.0.hp,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Image.asset("assets/images/logo2.png"),
                            Image.asset("assets/images/logo2.png"),
                            Image.asset("assets/images/logo2.png"),
                            Image.asset("assets/images/logo2.png"),
                            Image.asset("assets/images/logo2.png"),
                            Image.asset("assets/images/logo2.png"),
                          ],
                        ),
                      )
                    ],)
                )
              ],
            )
          ),
          
        ),
    );
  }
}
