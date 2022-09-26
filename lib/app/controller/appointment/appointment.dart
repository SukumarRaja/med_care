import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/doctor/doctor_res.dart';

class AppointmentController extends GetxController {
  static AppointmentController get to => Get.put(AppointmentController());

  DateTime focusedDay = DateTime.now();
  DateTime selectedDay = DateTime.now();
  TextEditingController remarks = TextEditingController();



  var _selectedDoctor = DoctorRes().obs;

  get selectedDoctor => _selectedDoctor.value;

  set selectedDoctor(value) {
    _selectedDoctor.value = value;
  }

  late List<DropdownMenuItem<DoctorRes>> dropdownDoctorItems;




}
