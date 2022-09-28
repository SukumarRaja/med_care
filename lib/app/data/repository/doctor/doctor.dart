import 'dart:convert';

import 'package:med_care/app/services/api_service.dart';
import 'package:med_care/app/services/http_service.dart';

import '../../model/doctor/doctor_full_res.dart';

class DoctorRepository {
  final HttpHelper http = HttpHelper();

  Future<dynamic> getDoctorList({required ionId}) async {
    var res = await http.get(url: "${ApiService.getDoctorList}id=$ionId");
    var response = jsonDecode(res);
    print("response $res");
    return response;
  }
}
