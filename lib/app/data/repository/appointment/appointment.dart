import 'dart:convert';
import 'package:med_care/app/services/api_service.dart';
import 'package:med_care/app/services/http_service.dart';

class AppointmentRepository {
  static HttpHelper http = HttpHelper();

  Future<dynamic> getTodayAppointment({required page}) async {
    var res = await http.get(url: "${ApiService.getTodayAppointment}$page");
    var response = jsonDecode(res);
    return response;
  }
}
