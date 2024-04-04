import 'package:shayplanner/api/api_helper.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class FutureAppointementService {
  
   apiGetFutureAppointment() async {
    final getAvailabilityUrl = Uri.parse(ApiHelper().getUrl() + "/future_rdv");
    final response =
        await http.get(getAvailabilityUrl,  headers: ApiHelper().getHeaders(await ApiHelper().getToken()));
    return response;
  }
}
