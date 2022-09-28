import 'package:flutter/material.dart';
import '../ui/themes/colors.dart';

Color getAppointmentColors({required String status}) {
  if (status == "Pending Confirmation") {
    return Colors.purple;
  }
  if (status == "Treated") {
    return Colors.blue;
  }
  if (status == "Confirmed") {
    return Colors.green;
  }
  if (status == "Cancelled") {
    return Colors.red;
  }
  if (status == "declined") {
    return Colors.red;
  }
  if (status == "Requested") {
    return AppColors.primaryColor;
  }
  return AppColors.primaryColor;
}
