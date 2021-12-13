import 'dart:async';
import 'package:boilerplate/data/network/constants/endpoints.dart';
import 'package:boilerplate/data/network/dio_client.dart';
import 'package:boilerplate/data/network/rest_client.dart';
import 'package:boilerplate/data/sharedpref/shared_preference_helper.dart';

class LoginApi {
  final DioClient _dioClient;
  final RestClient _restClient;

  LoginApi(
    this._dioClient,
    this._restClient,
  );

  Future getLogin(userPhone, password) async {
    try {
      final Map<String, String> data = {
        "phone": userPhone,
        "password": password,
      };
      final res =
          await _dioClient.post(Endpoints.baseUrl + '/auth/login', data: data);

      return res;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}
