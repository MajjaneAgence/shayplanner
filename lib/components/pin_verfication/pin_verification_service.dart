import 'dart:convert';

import 'package:shayplanner/api/api_helper.dart';
import 'package:http/http.dart' as http;

class PinVerificationService {

  Future apiValidateOtpOnSignUp(telephone, code) async {
    String apiUri = "/signup/validate-otp";
    final loginUrl = Uri.parse(ApiHelper().getUrl() + apiUri);
    final data = {"telephone": telephone, "code": code};
    final response =
        await http.post(loginUrl, body: jsonEncode(data), headers: {
      "Content-Type": "application/json",
    });
    return response;
  }
}
