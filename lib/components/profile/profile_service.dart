import 'dart:convert';

import 'package:shayplanner/components/api/api_helper.dart';
import 'package:http/http.dart' as http;

class profileService {
  Future apiGetCurrentUser() async {
    final getCurrentUserUrl = Uri.parse(ApiHelper().getUrl() + '/profile/user');
    final response = await http.get(getCurrentUserUrl,
        headers: ApiHelper().getHeaders(await ApiHelper().getToken()));
    return response;
  }

  Future apiUploadProfilePicture(picture) async {
    final uploadProfilePictureUrl =
        Uri.parse(ApiHelper().getUrl() + '/profile/upload-picture');

    http.MultipartRequest request =
        http.MultipartRequest("POST", uploadProfilePictureUrl);
    request.headers['Authorization'] = 'Bearer ${await ApiHelper().getToken()}';
    request.headers['Content-Type'] = 'application/json';
    request.files.add(await http.MultipartFile.fromPath(
      'image',
      picture.path,
      filename: picture.path.split('/').last,
    ));
    var response = await http.Response.fromStream(await request.send());
    return response;
  }

  Future apiUpdateProfileInfos(
      firstname, lastname, email, mobile, address) async {
    final updatePersonalInfos =
        Uri.parse(ApiHelper().getUrl() + '/profile/update-profile-infos');
    final data = {
      "firstname": firstname,
      "lastname": lastname,
      "email": email,
      "mobile": mobile,
      "address":address
    };
    print(jsonEncode(data));
    final response = await http.post(updatePersonalInfos,
        body: jsonEncode(data),
        headers: ApiHelper().getHeaders(await ApiHelper().getToken()));
    return response;
  }

 

   Future apiChangePassword(oldPassword,newPassword,newPasswordConfirmation) async {
    final changePassword =
        Uri.parse(ApiHelper().getUrl() + '/profile/change-password');
    final data = {
      "old_password": oldPassword,
      "new_password": newPassword,
      "new_password_confirmation": newPasswordConfirmation,
    };
    print(jsonEncode(data));
    final response = await http.post(changePassword,
        body: jsonEncode(data),
        headers: ApiHelper().getHeaders(await ApiHelper().getToken()));
    return response;
  }
}
