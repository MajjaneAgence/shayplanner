import 'package:shayplanner/api/api_helper.dart';
import 'package:http/http.dart' as http;

class SalonSheetService {

    Future apiGetSalonGallery(salonId) async {
    final getSalonGalleryUrl =
        Uri.parse(ApiHelper().getUrl() + '/get_gallery_salon/$salonId');
    final response = await http.get(getSalonGalleryUrl, headers: {
      "Content-Type": "application/json",
    });
    return response;
  }

    Future apiGetCategories() async {
    final getCategoriesUrl =
        Uri.parse(ApiHelper().getUrl() + "/get-categories");
    final response = await http.get(getCategoriesUrl);
    return response;
  }
}
