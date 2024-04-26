// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:shayplanner/theme/theme_colors.dart';
// import 'package:uuid/uuid.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// //Model classes that will be used for auto complete
// class Suggestion {
//   final String placeId;
//   final String description;
//   final String title;

//   Suggestion(this.placeId, this.description, this.title);
// }

// class PlaceDetail {
//   String? address;
//   double? latitude;
//   double? longitude;
//   String? name;

//   PlaceDetail({
//     this.address,
//     this.latitude,
//     this.longitude,
//     this.name,
//   });
// }

// class LocationSearchScreen extends StatefulWidget {
//   final title;
//   final StreamSink<PlaceDetail> sink;

//   const LocationSearchScreen({Key? key, required this.title, required this.sink}) : super(key: key);

//   @override
//   _LocationSearchScreenState createState() => _LocationSearchScreenState();
// }

// class _LocationSearchScreenState extends State<LocationSearchScreen> {
//   final _controller = TextEditingController();
//   final sessionToken = Uuid().v4();
//   final provider = PlaceApiProvider(Uuid().v4());
//   List<Suggestion> suggestion = [];

//   @override
//   void initState() {
//     super.initState();
//     _controller.addListener(() async {
//       print("in init state");
//       print(sessionToken);
//       print(widget.title);
//       if (_controller.text.length > 1){ 
//         print("fetching sufggestions");
//         suggestion = await provider.fetchSuggestions(_controller.text);

//       }
//       else {
//                 print("notinh");
//         suggestion.clear();
//       }
//       setState(() {});
//     });
//   }

//  @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: <Widget>[
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 IconButton(
//                   onPressed: (){},
//                   icon: const Icon(Icons.arrow_back_rounded),
//                   iconSize: 32,
//                   padding: EdgeInsets.only(left: 16, top: 8),
//                 ),
//                 Container(
//                   margin: const EdgeInsets.only(left: 16, top: 16, bottom: 4),
//                   child: Text(
//                     widget.title,
//                     style: GoogleFonts.poppins(
//                       fontSize: 22,
//                       color: black,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Container(
//               margin: const EdgeInsets.only(left: 18, top: 8, right: 18),
//               height: 48,
//               decoration: BoxDecoration(
//                 color: lightGrey,
//                 borderRadius: BorderRadius.circular(24),
//               ),
//               child: TextField(
//                 controller: _controller,
//                 textAlign: TextAlign.start,
//                 autocorrect: false,
//                 autofocus: true,
//                 style: GoogleFonts.poppins(
//                   fontSize: 16,
//                   color: black,
//                 ),
//                 decoration: InputDecoration(
//                   icon: Container(
//                     margin: EdgeInsets.only(left: 12),
//                     width: 32,
//                     child: Icon(
//                       Icons.search_rounded,
//                       color: Colors.black,
//                       size: 32,
//                     ),
//                   ),
//                   hintText: "Enter location",
//                   border: InputBorder.none,
//                 ),
//               ),
//             ),
//             SizedBox(height: 8),
//             Expanded(
//               child: ListView.builder(
//                 itemBuilder: (context, index) => ListTile(
//                   title: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         margin: const EdgeInsets.only(top: 8, bottom: 4),
//                         child: Text(
//                           (suggestion[index]).title,
//                           style: GoogleFonts.poppins(
//                             fontSize: 16,
//                             color: black,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                       ),
//                       Container(
//                         margin: const EdgeInsets.only(top: 4, bottom: 8),
//                         child: Text(
//                           (suggestion[index]).description,
//                           style: GoogleFonts.poppins(
//                             fontSize: 14,
//                             color: black,
//                             fontWeight: FontWeight.w300,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   leading: Container(
//                     child: Icon(
//                       Icons.place_rounded,
//                       color: crem,
//                       size: 32,
//                     ),
//                   ),
//                   onTap: () async {
//                     final placeDetail =
//                         await provider.getPlaceDetailFromId(suggestion[index].placeId);
//                     widget.sink.add(placeDetail);
//                     onBackPressed(context);
//                   },
//                 ),
//                 itemCount: suggestion.length,
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// onBackPressed(BuildContext context) => Navigator.of(context).pop();




// // We will use this util class to fetch the auto complete result and get the details of the place.
// class PlaceApiProvider {
//   PlaceApiProvider(this.sessionToken);

//   final String sessionToken;
//   final apiKey = "AIzaSyARF8feb-tLDqkP9AKd0dmLi4NhrU7_548";

//   http.Request createGetRequest(String url) => http.Request('GET', Uri.parse(url));

//   Future<List<Suggestion>> fetchSuggestions(String input) async {
//     final url =
//         'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&components=country:ma&key=$apiKey&sessiontoken=$sessionToken';
//     var request = createGetRequest(url);
//     http.StreamedResponse response = await request.send();

//     if (response.statusCode == 200) {
//       final data = await response.stream.bytesToString();
//       final result = json.decode(data);

//       print(result);

//       if (result['status'] == 'OK') {
//         return result['predictions']
//             .map<Suggestion>((p) => Suggestion(
//                 p['place_id'], p['description'], p['structured_formatting']['main_text']))
//             .toList();
//       }
//       if (result['status'] == 'ZERO_RESULTS') {
//         return [];
//       }
//       throw Exception(result['error_message']);
//     } else {
//       throw Exception('Failed to fetch suggestion');
//     }
//   }

//   Future<PlaceDetail> getPlaceDetailFromId(String placeId) async {
//     final url =
//         'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&fields=formatted_address,name,geometry/location&key=$apiKey&sessiontoken=$sessionToken';
//     var request = createGetRequest(url);
//     http.StreamedResponse response = await request.send();

//     if (response.statusCode == 200) {
//       final data = await response.stream.bytesToString();
//       final result = json.decode(data);
//       print(result);

//       if (result['status'] == 'OK') {
//         // build result
//         final place = PlaceDetail();
//         place.address = result['result']['formatted_address'];
//         place.latitude = result['result']['geometry']['location']['lat'];
//         place.longitude = result['result']['geometry']['location']['lng'];
//         place.name = result['result']['geometry']['name'];
//         return place;
//       }
//       throw Exception(result['error_message']);
//     } else {
//       throw Exception('Failed to fetch suggestion');
//     }
//   }
// }

// class Home1Screen extends StatefulWidget {
//   static const id = "HOME_SCREEN";

//   const Home1Screen({Key? key}) : super(key: key);

//   @override
//   _Home1ScreenState createState() => _Home1ScreenState();
// }

// class _Home1ScreenState extends State<Home1Screen> {

//   //We will pass the sink to the places auto complete widget to get the selected address by user
//   final _pickUpLocationSC = StreamController<PlaceDetail>.broadcast();
//   StreamSink<PlaceDetail> get pickUpLocationSink => _pickUpLocationSC.sink;
//   Stream<PlaceDetail> get pickUpLocationStream => _pickUpLocationSC.stream;

//   final _dropUpLocationSC = StreamController<PlaceDetail>.broadcast();
//   StreamSink<PlaceDetail> get dropLocationSink => _dropUpLocationSC.sink;
//   Stream<PlaceDetail> get dropLocationStream => _dropUpLocationSC.stream;
//   var currentLocationCamera = CameraPosition(
//   target: LatLng(37.42796133580664, -122.085749655962),
//   zoom: 14.4746,
// );
// late GoogleMapController _controller;

//      void _onMapCreated(GoogleMapController controller) {
//       _controller = controller;
//       //mapController.setMapStyle(MAP_STYLE);
//    }
//   @override
//   Widget build(BuildContext context) {
    
//     final googleMapWidget =  GoogleMap(
//       mapType: MapType.normal,
//       initialCameraPosition: currentLocationCamera,
//       onMapCreated: _onMapCreated,
//       rotateGesturesEnabled: false,
//       tiltGesturesEnabled: false,
//       mapToolbarEnabled: false,
//       myLocationEnabled: true,
//       myLocationButtonEnabled: true,
//       padding: const EdgeInsets.only(top: 300),
//     );
//     final pickupDropIconWidget = Column(
//       children: [
//         SizedBox(height: 8),
//         const Icon(
//           Icons.trip_origin_rounded,
//           color: Colors.red,
//           size: 28,
//         ),
//         Container(
//           height: 54,
//           child: CustomPaint(size: Size(1, double.infinity), painter: DashedLineVerticalPainter()),
//         ),
//         const Icon(
//           Icons.place_rounded,
//           color: Colors.red,
//           size: 32,
//         ),
//       ],
//     );

//     final tvPickupAddress = ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         onPrimary: black,
//         primary: lightGrey,
//         fixedSize: Size(getScreenWidth(context) - 88, 42),
//         textStyle: GoogleFonts.poppins(
//           fontSize: 16,
//           color: black,
//         ),
//         shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(21))),
//       ),
//       child: Row(
//         children: [
//           Expanded(
//             child: StreamBuilder<PlaceDetail>(
//                 stream: pickUpLocationStream,
//                 builder: (context, snapshot) {
//                   final address = snapshot.data == null
//                       ? "Enter pickup location"
//                       : snapshot.data!.address ?? "Enter pickup location";
//                   return Text(
//                     address,
//                     maxLines: 1,
//                     textAlign: TextAlign.start,
//                   );
//                 }),
//           ),
//         ],
//       ),
//       onPressed: () {
//                 print("hello");

       
//             Navigator.of(context).push(
//   MaterialPageRoute(
//     builder: (context) => LocationSearchScreen(
//       title: "Imm 42 Appt1 Rabat, 10050, Rue Capitaine Ouaarab, Rabat",
//       sink: pickUpLocationSink,
//     ),
//   ),
// );
//       },
//     );

//     final tvDropAddress = ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         onPrimary: black,
//         primary: lightGrey,
//         fixedSize: Size(getScreenWidth(context) - 88, 42),
//         textStyle: GoogleFonts.poppins(
//           fontSize: 16,
//           color: black,
//         ),
//         shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(21))),
//       ),
//       child: Row(
//         children: [
//           Expanded(
//             child: StreamBuilder<PlaceDetail>(
//                 stream: dropLocationStream,
//                 builder: (context, snapshot) {
//                   final address = snapshot.data == null
//                       ? "Enter drop location"
//                       : snapshot.data!.address ?? "Enter drop location";
//                   return Text(
//                     address,
//                     maxLines: 1,
//                     textAlign: TextAlign.start,
//                   );
//                 }),
//           ),
//         ],
//       ),
//       onPressed: () {
//         print("hello");

//             Navigator.of(context).push(
//   MaterialPageRoute(
//     builder: (context) => LocationSearchScreen(
//       title: "rabat",
//       sink: pickUpLocationSink,
//     ),
//   ),
// );
//       },
//     );

//     final pickupDropWidget = Container(
//       height: 300,
//       width: getScreenWidth(context),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             offset: Offset(0, 8),
//             color: Colors.black12,
//             blurRadius: 10,
//           ),
//         ],
//       ),
//       padding: const EdgeInsets.only(top: 32),
//       child: Stack(
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 padding: const EdgeInsets.only(left: 18, top: 48, bottom: 4),
//                 child: Text(
//                   "Where would you like to go?",
//                   style: GoogleFonts.poppins(
//                     fontSize: 20,
//                     color: black,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(width: 16),
//                   pickupDropIconWidget,
//                   SizedBox(width: 16),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.only(left: 0, top: 8, bottom: 4),
//                         child: Text(
//                           "From",
//                           style: GoogleFonts.poppins(
//                             fontSize: 16,
//                             color: black,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                       tvPickupAddress,
//                       Container(
//                         padding: const EdgeInsets.only(left: 0, top: 8, bottom: 4),
//                         child: Text(
//                           "To",
//                           style: GoogleFonts.poppins(
//                             fontSize: 16,
//                             color: black,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                       tvDropAddress,
//                     ],
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//     return Scaffold(
//       body: Stack(
//         children: [
//           googleMapWidget,
//           pickupDropWidget,
//         ],
//       ),
//     );
//   }
// }
// class DashedLineVerticalPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     double dashHeight = 5, dashSpace = 3, startY = 0;
//     final paint = Paint()
//       ..color = lightGrey
//       ..strokeWidth = 1;
//     while (startY < size.height) {
//       canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
//       startY += dashHeight + dashSpace;
//     }
//   }
  
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }
// double getScreenWidth(BuildContext context) {
//   return MediaQuery.of(context).size.width;
// }