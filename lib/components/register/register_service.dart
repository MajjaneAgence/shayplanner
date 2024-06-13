import 'dart:convert';

import 'package:shayplanner/api/api_helper.dart';
import 'package:http/http.dart' as http;

class RegisterService {
  Future apiRegister(firstname, lastname, email, password, passwordConfirmation,
      mobile) async {
    String apiUri = "/register";
    http.MultipartRequest request = http.MultipartRequest(
      "POST",
      Uri.parse(ApiHelper().getUrl() + apiUri),
    )
      ..fields['firstname'] = firstname
      ..fields['lastname'] = lastname
      ..fields['email'] = email
      ..fields['password'] = password
      ..fields['password_confirmation'] = passwordConfirmation
      ..fields['mobile'] = mobile;

    // request.files.add(await http.MultipartFile.fromPath(
    //   'picture',
    //   picture.path,
    //   filename: picture.path.split('/').last,
    // ));

    var response = await http.Response.fromStream(await request.send());

    return response;
  }

  Future apiSendOtpOnSignUp(telephone) async {
    String apiUri = "/signup/send-otp";
    final loginUrl = Uri.parse(ApiHelper().getUrl() + apiUri);
    final data = {"telephone": telephone};
    final response =
        await http.post(loginUrl, body: jsonEncode(data), headers: {
      "Content-Type": "application/json",
    });
    return response;
  }

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
