import 'package:get/get.dart';
import 'package:med_care/app/data/model/doctor/doctor_full_res.dart';
import 'package:med_care/app/data/repository/doctor/doctor.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../ui/widgets/common_print.dart';

class DoctorController extends GetxController {
  static DoctorController get to => Get.put(DoctorController());

  final repository = DoctorRepository();

  var _doctorLoading = false.obs;

  get doctorLoading => _doctorLoading.value;

  set doctorLoading(value) {
    _doctorLoading.value = value;
  }

  var _doctorListEmpty = false.obs;

  get doctorListEmpty => _doctorListEmpty.value;

  set doctorListEmpty(value) {
    _doctorListEmpty.value = value;
  }

  var _doctorDetails = <dynamic>[].obs;

  get doctorDetails => _doctorDetails.value;

  set doctorDetails(value) {
    _doctorDetails.value = value;
  }

  var _doctorSelectedEmpty = false.obs;

  get doctorSelectedEmpty => _doctorSelectedEmpty.value;

  set doctorSelectedEmpty(value) {
    _doctorSelectedEmpty.value = value;
  }

  var _slotSelectedEmpty = false.obs;

  get slotSelectedEmpty => _slotSelectedEmpty.value;

  set slotSelectedEmpty(value) {
    _slotSelectedEmpty.value = value;
  }

  getDoctorList() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var ionId = preferences.getString('ion_id');
    doctorLoading = true;
    try {
      var res = await repository.getDoctorList(ionId: ionId);
      if (res.isEmpty) {
        commonPrint(status: "Successfully", msg: "But no data");
        doctorLoading = false;
        doctorListEmpty = true;
      } else {
        commonPrint(status: "Successfully", msg: "With data");
        doctorLoading = false;
        for (var u in res) {
          DoctorFullRes data = DoctorFullRes(
            id: u["id"],
            imgUrl: u["img_url"],
            name: u["name"],
            email: u["email"],
            address: u["address"],
            phone: u["phone"],
            department: u["department"],
            profile: u["profile"],
            x: u["x"],
            y: u["y"],
            ionUserId: u["ion_user_id"],
            hospitalId: u["hospital_id"],
            departmentName: u["department_name"],
            appointmentConfirmation: u["appointment_confirmation"],
            signature: u["signature"],
          );
          doctorDetails.add(data);
          print("first value is ${doctorDetails[0].id}");
        }
      }
      print("response is $res");
    } catch (e) {
      doctorLoading = false;
      print("error $e");
    }
  }
}
