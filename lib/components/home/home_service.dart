import 'package:shayplanner/components/api/api_helper.dart';
import 'package:http/http.dart' as http;

class HomeService {
  String apiUri = "/get-categories";

  Future apiGetCategories() async {
    final loginUrl = Uri.parse(ApiHelper().getUrl()+apiUri);
    final response =
        await http.get(loginUrl,headers: ApiHelper().getHeaders("7|zfnl91aC7GGKPx67YMxotkubp51swtWTPZLPEm7i"));
    return response;
  }
}
