import 'dart:async';
import 'dart:convert';

//import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:shayplanner/components/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class MapController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();

  TextEditingController usernameEditingController = TextEditingController();
  TextEditingController keywordEditingController = TextEditingController();
   double? originLatitude=34.011503;
   double? originLongitude= -6.85879;
   double? destinationLatitude=0;
   double? destinationLongitude=0;
  bool currentPositionLoaded=false;
  bool isSearching=false;
  final sessionToken = Uuid().v4();
  final provider = PlaceApiProvider(Uuid().v4());
  List<Suggestion> suggestion = [];
    final pickUpLocationSC = StreamController<PlaceDetail>.broadcast();
  StreamSink<PlaceDetail> get pickUpLocationSink => pickUpLocationSC.sink;
  bool aSalonIsSelected=false;
  Map<MarkerId, Marker> markers = {}; 
  PolylinePoints polylinePoints = PolylinePoints();
Map<PolylineId, Polyline> polylines = {};
List<LatLng> polylineCoordinates = [];
  @override
  void onInit() async {
     super.onInit();
     Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
        originLongitude=position.longitude;
        originLatitude=position.latitude;
        print("this is latitude : $originLatitude");
        print("this is longitude: $originLongitude");
      addMarker(
      LatLng(originLatitude ?? 0 ,originLongitude ?? 0),
      "origin",
      BitmapDescriptor.defaultMarker,
    );
     addMarker(
      LatLng(destinationLatitude ?? 0, destinationLongitude ?? 0),
      "destination",
      BitmapDescriptor.defaultMarkerWithHue(90),
    );
    currentPositionLoaded=true;
    getPolyline();
    update();
  }

  

addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      points: polylineCoordinates,
      width: 1,
    );
    polylines[id] = polyline;
    update();
  }

void getPolyline() async {
    List<LatLng> polylineCoordinates = [];

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyARF8feb-tLDqkP9AKd0dmLi4NhrU7_548",
      PointLatLng(originLatitude ?? 0, originLongitude ?? 0),
      PointLatLng(33.589886,-7.603869), 
      travelMode: TravelMode.driving,
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }
    addPolyLine(polylineCoordinates);
  }
 // This method will add markers to the map based on the LatLng position
  addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
    MarkerId markerId = MarkerId(id);
    Marker marker =
        Marker(markerId: markerId, icon: descriptor, position: position);
    markers[markerId] = marker;
  }
  
  search(value )async {
     if (keywordEditingController.text.length > 1) {
        suggestion = await provider.fetchSuggestions(keywordEditingController.text);
      } else {
        suggestion.clear();
      }
  }

  goToRegister() {
    Get.toNamed(RegisterScreen.routename);
  }
  
  selectSalon(placeId) async{
     final placeDetail = await provider.getPlaceDetailFromId(placeId);
                                        //super.sink.add(placeDetail);
                                        //onBackPressed(context);
                                        MapController mapController =
                                            Get.find<MapController>();
                                        mapController.originLatitude =
                                            placeDetail.latitude;
                                        mapController.originLongitude =
                                            placeDetail.longitude;
                                        isSearching = false;
                                       aSalonIsSelected = true;
                                        update();
  }
}

// We will use this util class to fetch the auto complete result and get the details of the place.
class PlaceApiProvider {
  PlaceApiProvider(this.sessionToken);

  final String sessionToken;
  final apiKey = "AIzaSyARF8feb-tLDqkP9AKd0dmLi4NhrU7_548";

  http.Request createGetRequest(String url) =>
      http.Request('GET', Uri.parse(url));

  Future<List<Suggestion>> fetchSuggestions(String input) async {
    final url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&components=country:ma&key=$apiKey&sessiontoken=$sessionToken';
    var request = createGetRequest(url);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final data = await response.stream.bytesToString();
      final result = json.decode(data);

      print(result);

      if (result['status'] == 'OK') {
        return result['predictions']
            .map<Suggestion>((p) => Suggestion(p['place_id'], p['description'],
                p['structured_formatting']['main_text']))
            .toList();
      }
      if (result['status'] == 'ZERO_RESULTS') {
        return [];
      }
      throw Exception(result['error_message']);
    } else {
      throw Exception('Failed to fetch suggestion');
    }
  }

  Future<PlaceDetail> getPlaceDetailFromId(String placeId) async {
    final url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&fields=formatted_address,name,geometry/location&key=$apiKey&sessiontoken=$sessionToken';
    var request = createGetRequest(url);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final data = await response.stream.bytesToString();
      final result = json.decode(data);
      print(result);

      if (result['status'] == 'OK') {
        // build result
        final place = PlaceDetail();
        place.address = result['result']['formatted_address'];
        place.latitude = result['result']['geometry']['location']['lat'];
        place.longitude = result['result']['geometry']['location']['lng'];
        place.name = result['result']['geometry']['name'];
        return place;
      }
      throw Exception(result['error_message']);
    } else {
      throw Exception('Failed to fetch suggestion');
    }
  }
}


class PlaceDetail {
  String? address;
  double? latitude;
  double? longitude;
  String? name;

  PlaceDetail({
    this.address,
    this.latitude,
    this.longitude,
    this.name,
  });
}

class Suggestion {
  final String placeId;
  final String description;
  final String title;

  Suggestion(this.placeId, this.description, this.title);
}
