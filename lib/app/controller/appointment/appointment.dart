import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_care/app/ui/widgets/common_print.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/model/appointment/appointment.dart';
import '../../data/model/doctor/doctor_res.dart';
import '../../data/repository/appointment/appointment.dart';

class AppointmentController extends GetxController {
  static AppointmentController get to => Get.put(AppointmentController());

  final repository = AppointmentRepository();

  DateTime focusedDay = DateTime.now();
  DateTime selectedDay = DateTime.now();
  TextEditingController remarks = TextEditingController();
  TextEditingController searchAppointment = TextEditingController();

  var _selectedDoctor = DoctorRes().obs;

  get selectedDoctor => _selectedDoctor.value;

  set selectedDoctor(value) {
    _selectedDoctor.value = value;
  }

  var _appointmentDetails = <AppointmentRes>[].obs;

  get appointmentDetails => _appointmentDetails.value;

  set appointmentDetails(value) {
    _appointmentDetails.value = value;
  }

  var _appointmentEmpty = false.obs;

  get appointmentEmpty => _appointmentEmpty.value;

  set appointmentEmpty(value) {
    _appointmentEmpty.value = value;
  }

  var _appointmentLoading = false.obs;

  get appointmentLoading => _appointmentLoading.value;

  set appointmentLoading(value) {
    _appointmentLoading.value = value;
  }

  var _getAppointmentError = false.obs;

  get getAppointmentError => _getAppointmentError.value;

  set getAppointmentError(value) {
    _getAppointmentError.value = value;
  }

  late List<DropdownMenuItem<DoctorRes>> dropdownDoctorItems;

  getTodayAppointment() async {
    appointmentLoading = true;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var userId = preferences.getString('user_id');
    print("user is is $userId");
    var page = "group=patient&id=$userId";
    try {
      var res = await repository.getTodayAppointment(page: page);
      print("response is empty ${res.isNotEmpty}");

      if (res.isEmpty) {
        commonPrint(status: "Successfully", msg: "But no data");
        appointmentEmpty = true;
        appointmentLoading = false;
      } else {
        commonPrint(status: "Successfully", msg: "With data");
        appointmentLoading = false;
        for (var u in res) {
          AppointmentRes data = AppointmentRes(
            id: u["id"],
            patientName: u["patient_name"],
            doctorName: u["doctor_name"],
            date: u["date"],
            startTime: u["start_time"],
            endTime: u["end_time"],
            remarks: u["remarks"],
            status: u["status"],
            jitsiLink: u["jitsi_link"],
          );
          appointmentDetails.add(data);
        }
      }
    } catch (e) {
      appointmentLoading = false;
      getAppointmentError = true;
      print("Error from server on getTodayAppointments $e");
    }
  }
}
