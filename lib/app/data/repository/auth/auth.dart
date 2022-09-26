import 'dart:convert';

import '../../../services/api_service.dart';
import '../../../services/http_service.dart';
import '../../model/login/login.dart';


class AuthRepository {
  static final HttpHelper helper = HttpHelper();

  Future<LoginRes> login({required bodyData}) async {
    var res = await helper.post(url: ApiService.login, body: bodyData);
    LoginRes response = LoginRes.fromMap(jsonDecode(res));
    return response;
  }

  Future<LoginRes> register({required bodyData}) async {
    var res = await helper.post(url: ApiService.register, body: bodyData);
    LoginRes response = LoginRes.fromMap(jsonDecode(res));
    return response;
  }

  Future<LoginRes> logout() async {
    var res = await helper.get(url: ApiService.logout, auth: true);
    LoginRes response = LoginRes.fromMap(jsonDecode(res));
    return response;
  }
}