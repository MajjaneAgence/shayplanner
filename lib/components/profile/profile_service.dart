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
    request.headers['Authorization'] = 'Bearer 21|B62BtwgWzNoUpe46uvYI5Q05Zswrzuyr8TMxwQke';
    request.headers['Content-Type'] = 'application/json';
    request.files.add(await http.MultipartFile.fromPath(
      'image',
      picture.path,
      filename: picture.path.split('/').last,
    ));
    var response = await http.Response.fromStream(await request.send());
    return response;
  }
}
