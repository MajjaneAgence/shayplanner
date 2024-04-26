import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shayplanner/components/map/map_controller.dart';
import 'package:shayplanner/components/map/map_screen.dart';
import 'package:shayplanner/theme/theme_app_bar.dart';
import 'package:shayplanner/theme/theme_colors.dart';
import 'package:shayplanner/theme/theme_input.dart';
import 'package:shayplanner/tools/extension.dart';
import 'package:uuid/uuid.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LocationSearchScreen extends StatefulWidget {
  final title;
  final StreamSink<PlaceDetail> sink;

  const LocationSearchScreen(
      {Key? key, required this.title, required this.sink})
      : super(key: key);

  @override
  _LocationSearchScreenState createState() => _LocationSearchScreenState();
}

class _LocationSearchScreenState extends State<LocationSearchScreen> {
  final _controller = TextEditingController();
  final sessionToken = Uuid().v4();
  final provider = PlaceApiProvider(Uuid().v4());
  List<Suggestion> suggestion = [];

  @override
  void initState() {
    super.initState();
    print(sessionToken);
    _controller.addListener(() async {
      if (_controller.text.length > 1) {
        suggestion = await provider.fetchSuggestions(_controller.text);
      } else {
        suggestion.clear();
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ThemeAppBar(),
      backgroundColor: biege,
      extendBody: true,
      body: SizedBox(
        width: 100.0.wp,
        height: 90.0.hp,
        child: Column(children: [
          Container(
              margin: EdgeInsets.only(top: 3.0.hp, bottom: 2.0.hp),
              height: 6.0.hp,
              width: 87.0.wp,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0.sp),
                boxShadow: [themeBoxShadowInput],
              ),
              child: SizedBox(
                height: 5.0.hp,
                child: TextFormField(
                  controller: _controller,
                  keyboardType: TextInputType.text,
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
                    suffixIcon: Icon(Icons.clear, color: Colors.black),
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
              ),),
          SizedBox(height: 1.0.hp),
          Expanded(
            child: Container(
                width: 100.0.wp,
                padding:
                    EdgeInsets.symmetric(horizontal: 10.0.wp, vertical: 2.0.hp),
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 8, bottom: 4),
                          child: Text(
                            (suggestion[index]).title,
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
                                margin:
                                    const EdgeInsets.only(top: 4, bottom: 8),
                                child: Text(
                                  (suggestion[index]).description,
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: black,
                                    fontWeight: FontWeight.w300,
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
                      final placeDetail = await provider
                          .getPlaceDetailFromId(suggestion[index].placeId);
                      widget.sink.add(placeDetail);
                      //onBackPressed(context);
                      MapController mapController = Get.find<MapController>();
                      mapController.latitude = placeDetail.latitude;
                      mapController.longitude = placeDetail.longitude;
                      Get.toNamed(MapScreen.routename);
                    },
                  ),
                  itemCount: suggestion.length,
                )),
          ),
        ]),
      ),
    );
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

class Suggestion {
  final String placeId;
  final String description;
  final String title;

  Suggestion(this.placeId, this.description, this.title);
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
