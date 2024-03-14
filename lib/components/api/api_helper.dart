import 'dart:convert';
import 'dart:developer';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shayplanner/components/login/login_screen.dart';

class ApiHelper {
  final String _url = 'https://shayplanner.majjane.agency/api';

  getToken() async {
    FlutterSecureStorage secureStorage = const FlutterSecureStorage();
    var token = await secureStorage.read(key: "token");
    return token;
  }

  checkTokenValidity() async {
    final check = Uri.parse('$_url/check-token-validity');
    final response =
        await http.get(check, headers: ApiHelper().getHeaders(getToken()));
    var body = jsonDecode(response.body);
    print(body);
    if (body['message'] == "validToken") {
      return true;
    } else {
      return false;
    }
  }

  getUrl() {
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

  Map<String, String> getHeaders(token) {
    return {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
  }
}
