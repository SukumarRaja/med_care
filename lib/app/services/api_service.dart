import '../config/config.dart';

class ApiService {
  static const login = AppConfig.baseUrl + "authenticate";
  static const register = AppConfig.baseUrl + "register";
  static const logout = AppConfig.baseUrl + "logout";
  static const getTodayAppointment = AppConfig.baseUrl + "getMyTodaysAppoinmentList?";
  static const getDoctorList = AppConfig.baseUrl + "getDoctorList?";
  static const updateProfile = AppConfig.baseUrl + "profile/update";
}
