import 'package:shayplanner/components/api/api_helper.dart';
import 'package:http/http.dart' as http;

class HomeService {
  String apiUri = "/get-categories";

  Future apiGetCategories() async {
    
    final getCategoriesUrl = Uri.parse(ApiHelper().getUrl()+apiUri);
    final response =
        await http.get(getCategoriesUrl);
    return response;
  }
}
