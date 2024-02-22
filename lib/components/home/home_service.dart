import 'package:shayplanner/components/api/api_helper.dart';
import 'package:http/http.dart' as http;

class HomeService {
  String apiUri = "/get-categories";

  Future apiGetCategories() async {
    final loginUrl = Uri.parse(ApiHelper().getUrl()+apiUri);
    final response =
        await http.get(loginUrl,headers: ApiHelper().getHeaders("1|xesudvlGZvfwWMqJgzOw9gxZYQ5XT6I6vi6GFwz8"));
    return response;
  }
}
