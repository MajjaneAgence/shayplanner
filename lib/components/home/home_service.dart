import 'dart:convert';

import 'package:shayplanner/api/api_helper.dart';
import 'package:http/http.dart' as http;

class HomeService {
  //String apiUri = "/get-categories";

  Future apiGetCategories() async {
    final getCategoriesUrl =
        Uri.parse(ApiHelper().getUrl() + "/get-categories");
    final response = await http.get(getCategoriesUrl);
    return response;
  }

  Future apiGetLatestsSalons() async {
    final getLatestSalonsUrl =
        Uri.parse(ApiHelper().getUrl() + "/get-latests-salons");
    final response = await http.get(getLatestSalonsUrl);
    return response;
  }

   Future apiSearch(keyword) async {
    final searchUrl =
        Uri.parse(ApiHelper().getUrl() + "/search");
    final data = {"searchvalue": keyword};
    final response =
        await http.post(searchUrl, body: jsonEncode(data), headers: {
      "Content-Type": "application/json",
    });
    return response;
  }
}
