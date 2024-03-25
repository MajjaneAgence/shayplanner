import 'package:shayplanner/components/api/api_helper.dart';
import 'package:http/http.dart' as http;

class SalonsService {
  //String apiUri = "/get-categories";

  Future apiSalonDetails(id) async {
    final getSalonDeatilsUrl =
        Uri.parse(ApiHelper().getUrl() + "/get-salon-details/$id");
    final response = await http.get(getSalonDeatilsUrl);
    return response;
  }

}
