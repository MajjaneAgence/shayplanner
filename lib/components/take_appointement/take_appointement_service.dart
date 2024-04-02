import 'package:shayplanner/api/api_helper.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class TakeAppointmentService {
  String apiUri = "/login";

  Future apiGetSpecialite(salonId) async {
    final getSpecialiteUrl = Uri.parse(ApiHelper().getUrl()+'/get-specialites-by-salon/$salonId');
    final response =
        await http.get(getSpecialiteUrl, headers: {
      "Content-Type": "application/json",
    });
    return response;
  }
}


