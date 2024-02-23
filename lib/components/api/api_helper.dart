import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiHelper{
  final String _url = 'https://shayplanner.majjane.agency/api';

   getToken() async {
    FlutterSecureStorage secureStorage =FlutterSecureStorage();
    var token = await secureStorage.read(key: "token");
    print("token : $token");
    return token;
  }
  
   getUrl(){
    return _url;
  }
  // authData(data, apiUrl) async {
  //   var fullUrl = _url + apiUrl;
  //   return await http.post(
  //       Uri.parse(fullUrl),
  //       body: jsonEncode(data),
  //       headers: _setHeaders()
  //   );
  // }

  // getData(apiUrl) async {
  //   var fullUrl = _url + apiUrl;
  //   await _getToken();
  //   return await http.get(
  //        Uri.parse(fullUrl),
  //       headers: _setHeaders()
  //   );
  // }

Map<String, String> getHeaders(String token) {
  return {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token'
  };
}

}