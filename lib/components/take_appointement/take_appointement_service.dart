import 'package:shayplanner/api/api_helper.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class TakeAppointmentService {
  String apiUri = "/login";

  Future apiGetSpecialite(salonId) async {
    final getSpecialiteUrl =
        Uri.parse(ApiHelper().getUrl() + '/get-specialites-by-salon/$salonId');
    final response = await http.get(getSpecialiteUrl, headers: {
      "Content-Type": "application/json",
    });
    return response;
  }

  Future apiGetAvailability(date, salonId, specialiteIds) async {
    final getAvailabilityUrl =
        Uri.parse(ApiHelper().getUrl() + "/get_dispo_emp");
    final data = {
      "date": date,
      "salon_id": salonId,
      "specialite_id": specialiteIds
    };
    final response =
        await http.post(getAvailabilityUrl, body: jsonEncode(data), headers: {
      "Content-Type": "application/json",
    });
    return response;
  }

  Future apiBookAppointement(
      date, hour, specialiteIds, salonId, comment) async {
    final getAvailabilityUrl = Uri.parse(ApiHelper().getUrl() + "/add_rdv");
    final data = {
      "Date": date,
      "temps": hour,
      "specialitie_id": specialiteIds,
      "salon_id": salonId,
      "comment": comment
    };
    final response =
        await http.post(getAvailabilityUrl, body: jsonEncode(data),  headers: ApiHelper().getHeaders(await ApiHelper().getToken()));
    return response;
  }
}
