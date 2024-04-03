import 'package:shayplanner/api/api_helper.dart';
import 'package:http/http.dart' as http;

class SalonsService {
  //String apiUri = "/get-categories";

  Future apiSalonDetails(id) async {
    final getSalonDeatilsUrl =
        Uri.parse(ApiHelper().getUrl() + "/get-salon-details/$id");
    final response = await http.get(getSalonDeatilsUrl);
    return response;
  }
Future apiSalonsByCategory(id) async {
    final getSalonsByCategoryUrl =
        Uri.parse(ApiHelper().getUrl() + "/get_salon_by_categorie/$id");
    final response = await http.get(getSalonsByCategoryUrl);
    return response;
  }

  Future apiSalonsBySpecialite(id) async {
    final getSalonsBySpecialiteUrl =
        Uri.parse(ApiHelper().getUrl() + "/get-salon-by-specialites/$id");
    final response = await http.get(getSalonsBySpecialiteUrl);
    return response;
  }
}
