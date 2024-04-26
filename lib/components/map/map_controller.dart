import 'dart:async';
import 'dart:convert';

//import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shayplanner/components/forgot_password/forgot_password_screen.dart';
import 'package:shayplanner/components/home/home_screen.dart';
import 'package:shayplanner/components/login/login_service.dart';
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
   double? latitude=0;
   double? longitude=0;
  bool currentPositionLoaded=false;
  bool isSearching=false;
   final _controller = TextEditingController();
  final sessionToken = Uuid().v4();
  final provider = PlaceApiProvider(Uuid().v4());
  List<Suggestion> suggestion = [];
    final pickUpLocationSC = StreamController<PlaceDetail>.broadcast();
  StreamSink<PlaceDetail> get pickUpLocationSink => pickUpLocationSC.sink;
  bool aSalonIsSelected=false;
  @override
  void onInit() async {
     super.onInit();
     Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
        longitude=position.longitude;
        latitude=position.latitude;
        print("this is latitude : $latitude");
        print("this is longitude: $longitude");
      currentPositionLoaded=true;
    update();
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

  loginWithGoogle() async {
     SharedPreferences preferences = await SharedPreferences.getInstance();
    //Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      await GoogleSignIn().signOut();
    } else {
      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

          print(googleAuth.accessToken);
    }
    // }
    // Create a new credential
    // final credential = GoogleAuthProvider.credential(
    //   accessToken: googleAuth.accessToken,
    //   idToken: googleAuth.idToken,
    // );

    // // Once signed in, return the UserCredential
    // return await FirebaseAuth.instance
    //     .signInWithCredential(credential)
    //     .then((value) {
    //   userProvider
    //       .loginSocial(value.additionalUserInfo!.profile!['email'])
    //       .then((result) async {
    //     var responseDecode = jsonDecode(result.body);
    //     if (responseDecode['success'] == 1) {
    //       await flutterSecureStorage.write(
    //           key: "token", value: responseDecode['data']['customer_token']);
    //       preferences.setString("id", responseDecode['data']['customer_id']);
    //       preferences.setBool("isSocial", true);
    //       Get.offAllNamed(MainApp.routename);
    //     } else {
    //       preferences.setBool("isSocial", true);
    //       Get.toNamed(Inscription.routename, arguments: [
    //         value.additionalUserInfo!.profile!['email'],
    //         value.additionalUserInfo!.profile!['given_name'],
    //         value.additionalUserInfo!.profile!['family_name']
    //       ]);
    //     }
    //   });
    // });

    //   return value;
    // });
  }

  loginWithApple() {}

  // loginWithFacebook() async{

  //       // Trigger the sign-in flow
  //   final LoginResult loginResult = await FacebookAuth.instance.login();
  //   // Create a credential from the access token
  //   final OAuthCredential facebookAuthCredential =
  //       FacebookAuthProvider.credential(loginResult.accessToken!.token);

  //   // Once signed in, return the UserCredential
  //   //check if firebase user is already created with different provider
  //   // UserCredential userCredential =
  //   await FirebaseAuth.instance
  //       .signInWithCredential(facebookAuthCredential)
  //       .then((value) async {
  //     var graphResponse = await http.get(Uri.parse(
  //         'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${loginResult.accessToken!.token}'));
  // });
  // }


  gotohome() {
    Get.toNamed(HomeScreen.routename);
  }

  continueLoggedOut() {
    Get.offAndToNamed(HomeScreen.routename);
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
