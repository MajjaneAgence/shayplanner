import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shayplanner/components/map/map_controller.dart';
import 'package:shayplanner/components/map/map_search_screen.dart';
import 'package:shayplanner/theme/theme_app_bar.dart';
import 'package:shayplanner/theme/theme_button.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/theme/theme_grad_container.dart';
import 'package:shayplanner/theme/theme_input.dart';
import 'package:shayplanner/theme/theme_navigation_bottom_bar.dart';
import 'package:shayplanner/theme/theme_text.dart';
import 'package:shayplanner/tools/extension.dart';

class MapScreen extends StatelessWidget {
  late GoogleMapController mapController;
  static const routename = '/map';

  final LatLng _center = const LatLng(34.020882, -6.841650);
  static const MAP_STYLE =
      "[{\"featureType\":\"all\",\"elementType\":\"geometry.fill\",\"stylers\":[{\"weight\":\"2.00\"}]},{\"featureType\":\"all\",\"elementType\":\"geometry.stroke\",\"stylers\":[{\"color\":\"#9c9c9c\"}]},{\"featureType\":\"all\",\"elementType\":\"labels.text\",\"stylers\":[{\"visibility\":\"on\"}]},{\"featureType\":\"landscape\",\"elementType\":\"all\",\"stylers\":[{\"color\":\"#f2f2f2\"}]},{\"featureType\":\"landscape\",\"elementType\":\"geometry.fill\",\"stylers\":[{\"color\":\"#ffffff\"}]},{\"featureType\":\"landscape.man_made\",\"elementType\":\"geometry.fill\",\"stylers\":[{\"color\":\"#ffffff\"}]},{\"featureType\":\"poi\",\"elementType\":\"all\",\"stylers\":[{\"visibility\":\"off\"}]},{\"featureType\":\"road\",\"elementType\":\"all\",\"stylers\":[{\"saturation\":-100},{\"lightness\":45}]},{\"featureType\":\"road\",\"elementType\":\"geometry.fill\",\"stylers\":[{\"color\":\"#eeeeee\"}]},{\"featureType\":\"road\",\"elementType\":\"labels.text.fill\",\"stylers\":[{\"color\":\"#7b7b7b\"}]},{\"featureType\":\"road\",\"elementType\":\"labels.text.stroke\",\"stylers\":[{\"color\":\"#ffffff\"}]},{\"featureType\":\"road.highway\",\"elementType\":\"all\",\"stylers\":[{\"visibility\":\"simplified\"}]},{\"featureType\":\"road.arterial\",\"elementType\":\"labels.icon\",\"stylers\":[{\"visibility\":\"off\"}]},{\"featureType\":\"transit\",\"elementType\":\"all\",\"stylers\":[{\"visibility\":\"off\"}]},{\"featureType\":\"water\",\"elementType\":\"all\",\"stylers\":[{\"color\":\"#46bcec\"},{\"visibility\":\"on\"}]},{\"featureType\":\"water\",\"elementType\":\"geometry.fill\",\"stylers\":[{\"color\":\"#c8d7d4\"}]},{\"featureType\":\"water\",\"elementType\":\"labels.text.fill\",\"stylers\":[{\"color\":\"#070707\"}]},{\"featureType\":\"water\",\"elementType\":\"labels.text.stroke\",\"stylers\":[{\"color\":\"#ffffff\"}]}]";

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    //mapController.setMapStyle(MAP_STYLE);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ThemeAppBar(),
      extendBody: true,
      backgroundColor: biege,
      body: GetBuilder<MapController>(
        init: MapController(),
        builder: (controller) => controller.currentPositionLoaded
            ? Stack(
                children: [
                  controller.isSearching
                      ? Column(
                          children: [
                            Expanded(
                              child: Container(
                                  width: 100.0.wp,
                                  margin: EdgeInsets.only(top: 12.0.hp),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.0.wp, vertical: 2.0.hp),
                                  decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(8.5.wp),
                                      topRight: Radius.circular(8.5.wp),
                                    ),
                                  ),
                                  child: ListView.builder(
                                    itemBuilder: (context, index) => InkWell(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                                top: 8, bottom: 4),
                                            child: Text(
                                              (controller.suggestion[index])
                                                  .title,
                                              style: GoogleFonts.poppins(
                                                fontSize: 13.0.sp,
                                                color: black,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 10,
                                                child: Container(
                                                  margin: const EdgeInsets.only(
                                                      top: 4, bottom: 8),
                                                  child: Text(
                                                    (controller
                                                            .suggestion[index])
                                                        .description,
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 14,
                                                      color: black,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Container(
                                                  child: Icon(
                                                    Icons.place_outlined,
                                                    color: Colors.black,
                                                    size: 32,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Divider()
                                        ],
                                      ),
                                      onTap: () async {
                                        final placeDetail = await controller
                                            .provider
                                            .getPlaceDetailFromId(controller
                                                .suggestion[index].placeId);
                                        //super.sink.add(placeDetail);
                                        //onBackPressed(context);
                                        MapController mapController =
                                            Get.find<MapController>();
                                        mapController.latitude =
                                            placeDetail.latitude;
                                        mapController.longitude =
                                            placeDetail.longitude;
                                        controller.isSearching = false;
                                        controller.aSalonIsSelected = true;
                                        controller.update();
                                      },
                                    ),
                                    itemCount: controller.suggestion.length,
                                  )),
                            )
                          ],
                        )
                      : Padding(
                          padding: EdgeInsets.only(top: 12.0.hp),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8.5.wp),
                              topRight: Radius.circular(8.5.wp),
                            ),
                            child: GoogleMap(
                              onMapCreated: _onMapCreated,
                              initialCameraPosition: CameraPosition(
                                target: LatLng(controller.latitude ?? 0,
                                    controller.longitude ?? 0),
                                zoom: 10,
                              ),
                              markers: {
                                const Marker(
                                  markerId: const MarkerId("Home"),
                                  position: LatLng(34.020882, -6.841650),
                                  infoWindow: InfoWindow(
                                    title: "Home",
                                    snippet: "",
                                  ),
                                ), 
                              },
                            ),
                          ),
                        ),
                  Container(
                    margin: EdgeInsets.only(
                        top: 3.0.hp,
                        bottom: 2.0.hp,
                        left: 6.0.wp,
                        right: 6.0.wp),
                    height: 6.0.hp,
                    width: 100.0.wp,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0.sp),
                      boxShadow: [themeBoxShadowInput],
                    ),
                    child: SizedBox(
                      height: 5.0.hp,
                      child: TextFormField(
                        controller: controller.keywordEditingController,
                        keyboardType: TextInputType.text,
                        onChanged: (value) async {
                          controller.isSearching = true;
                          controller.update();
                          if (value.length > 1) {
                            controller.suggestion = await controller.provider
                                .fetchSuggestions(value);
                          } else {
                            controller.isSearching = false;
                            controller.suggestion.clear();
                          }
                        },
                        style: TextStyle(fontSize: 10.0.sp),
                        decoration: InputDecoration(
                          labelText: "Nom du salon",
                          hintText: "Nom du salon",
                          counterText: "",
                          fillColor: verylightGrey,
                          errorStyle: TextStyle(height: 0.1, fontSize: 8.0.sp),
                          hintStyle: TextStyle(fontSize: 10.0.sp),
                          labelStyle: TextStyle(fontSize: 10.0.sp),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          contentPadding: EdgeInsets.all(10.0.sp),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          suffixIcon: controller.isSearching
                              ? Icon(Icons.clear, color: Colors.black)
                              : ThemeGradContainer(
                                  theHeight: 3.0.wp,
                                  theWith: 3.0.wp,
                                  theMargin: 5.0.sp,
                                  theColor: crem,
                                  theContent:
                                      Icon(Icons.search, color: Colors.white),
                                ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  controller.aSalonIsSelected
                      ? Positioned(
                          bottom: 0,
                          child: Container(
                            width: 100.0.wp,
                            height: 34.0.hp,
                            // margin: EdgeInsets.only(top: 12.0.hp),
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.0.wp, vertical: 2.0.hp),
                            decoration: BoxDecoration(
                              color: white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(
                                    0.0,
                                    -2.0,
                                  ),
                                  blurRadius: 8.0,
                                  spreadRadius: -1,
                                )
                              ],
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8.5.wp),
                                topRight: Radius.circular(8.5.wp),
                              ),
                            ),
                            child: SingleChildScrollView(
                              child: Column(children: [
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 10,
                                        child: ThemeText(
                                          theText: "Lorem ipsum ",
                                          thefontSize: 20.0.sp,
                                          theColor: Colors.black,
                                          theFontWeight: FontWeight.bold,
                                          theMaxOfLines: 1,
                                        )),
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                        width: 10.0.wp,
                                        height: 10.0.wp,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 8.0.wp),
                                        padding: EdgeInsets.all(2.0.sp),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(8.0.sp),
                                            ),
                                            border: Border.all(color: black)),
                                        child: SvgPicture.asset(
                                            "assets/icons/map/heart.svg"),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 0.5.hp),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: SvgPicture.asset(
                                        "assets/icons/map/localization.svg",
                                        color: grey,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 9,
                                      child: ThemeText(
                                        theText: "Lorem ipsum ",
                                        thefontSize: 10.0.sp,
                                        theColor: Colors.black,
                                        theMaxOfLines: 1,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: ThemeText(
                                        theText: "tr_add_to_favorite".tr,
                                        thefontSize: 8.0.sp,
                                        theColor: Colors.black,
                                        theMaxOfLines: 2,
                                      ),
                                    ),
                                  ],
                                ),
                               // SizedBox(height: 0.5.hp),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: SvgPicture.asset(
                                        "assets/icons/map/star.svg",
                                        color: grey,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 16,
                                      child: ThemeText(
                                        theText: "4,9 (317 avis)",
                                        thefontSize: 10.0.sp,
                                        theColor: Colors.black,
                                        theMaxOfLines: 1,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 1.5.hp),
                                Row(
                                  children: [
                                    SizedBox(width: 10.0.wp),
                                    Column(children: [
                                    ThemeButton(
                                      theColor: crem,
                                      theWidth: 15.0.wp,
                                      theHeight: 15.0.wp,
                                      theLoadingStatus: false,
                                      theHorizontalPadding: 2.0.sp,
                                      theVerticalPadding: 2.0.sp,
                                      theBorderRadius: 5.0.sp,
                                      theElevation: 0,
                                      theAction: () {},
                                      theContent: SvgPicture.asset(
                                          "assets/icons/map/call.svg",
                                          width: 12.0.wp,
                                          height: 12.0.wp),
                                    ),
                                    ThemeText(theText: "tr_call".tr, thefontSize: 12.0.sp, theColor: grey),
                                    ],),
                                    SizedBox(width: 10.0.wp),
                                     Column(children: [
                                    ThemeButton(
                                      theColor: crem,
                                      theWidth: 15.0.wp,
                                      theHeight: 15.0.wp,
                                      theLoadingStatus: false,
                                      theHorizontalPadding: 2.0.sp,
                                      theVerticalPadding: 2.0.sp,
                                      theElevation: 0,
                                      theBorderRadius: 5.0.sp,
                                      theAction: () {},
                                      theContent: SvgPicture.asset(
                                          "assets/icons/map/share.svg",
                                          width: 8.0.wp,
                                          height: 8.0.wp),
                                    ),
                                    ThemeText(theText: "tr_share".tr, thefontSize: 12.0.sp, theColor: grey),
                                    ],),
                                  ],
                                ),
                              ]),
                            ),
                          ),
                        )
                      : SizedBox()
                ],
              )
            : Center(child: CircularProgressIndicator()),
      ),
      bottomNavigationBar: ThemeNavigationBottomBar(),
    );
  }
}
