import 'package:shayplanner/components/api/api_helper.dart';
import 'package:http/http.dart' as http;

class RegisterService {
  String apiUri = "/register";

  Future apiRegister(firstname, lastname, email, password,passwordConfirmation, mobile) async {
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
}
