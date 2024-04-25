import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shayplanner/components/map/map_controller.dart';
import 'package:shayplanner/theme/theme_app_bar.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/theme/theme_grad_container.dart';
import 'package:shayplanner/theme/theme_input.dart';
import 'package:shayplanner/theme/theme_navigation_bottom_bar.dart';
import 'package:shayplanner/tools/extension.dart';

   class MapScreen extends StatelessWidget{
   
   late GoogleMapController mapController;
   
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
        //extendBody: true,
        backgroundColor: biege,
         body:GetBuilder<MapController>(
        init: MapController(),
        builder: (controller) => 
        Stack(children: [
       Padding(padding:  EdgeInsets.only(top:12.0.hp),
    child:ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),
        child:
   GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
         target: _center,
         zoom: 11.0,
      ),
      markers: {
       const Marker(
            markerId: const MarkerId("Sydney"),
            position: LatLng(-33.86, 151.20),
            infoWindow: InfoWindow(
               title: "Sydney",
               snippet: "Capital of New South Wales",
            ), 
      ), 
      }, 
   ),
    )
       ),
                 Container(
                    margin: EdgeInsets.only(top: 3.0.hp, left: 7.0.wp,right:7.0.wp),
                    height: 6.0.hp,
                    width: 100.0.wp,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0.sp),
                      boxShadow: [themeBoxShadowInput],
                    ),
                    child: ThemeInput(
                      theHintText:"test",
                      theLabelText:"test",
                      theTextEditingController:
                          controller.keywordEditingController,
                      theValidation:(){},
                      theContentPadding: 5.0.sp,
                      theIconWidget: ThemeGradContainer(
                        theHeight: 3.0.wp,
                        theWith: 3.0.wp,
                        theMargin: 5.0.sp,
                        theColor: crem,
                        theContent: Icon(Icons.search, color: Colors.white),
                      ),
                      theFloatingLabelBehaviour: FloatingLabelBehavior.never,
                    ),
                  
                  ),
         ],)
         
        
         ),
         bottomNavigationBar: ThemeNavigationBottomBar(),
    ); 
  }
   }