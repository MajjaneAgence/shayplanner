import 'package:shayplanner/components/api/api_helper.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SalonSheetService {
  String apiUri = "/login";

  Future apiLogin(email, password) async {
    final loginUrl = Uri.parse(ApiHelper().getUrl()+apiUri);
    final data = {"email": email, "password": password};
    final response =
        await http.post(loginUrl, body: jsonEncode(data), headers: {
      "Content-Type": "application/json",
    });
    return response;
  }
}
