import 'dart:async';
import 'package:boilerplate/data/network/constants/endpoints.dart';
import 'package:boilerplate/data/network/dio_client.dart';
import 'package:boilerplate/data/network/rest_client.dart';

class RegisterApi {
  // dio instance
  final DioClient _dioClient;

  // rest-client instance
  final RestClient _restClient;

  // injecting dio instance
  RegisterApi(this._dioClient, this._restClient);

  /// Returns list of post in response
  Future getRegister(userName, userPhone, password) async {
    try {
      final Map<String, String> data = {
        "name": userName,
        "phone": userPhone,
        "password": password,
      };
      final res = await _dioClient.post(Endpoints.baseUrl + '/auth/register',
          data: data);
      return res;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  /// sample api call with default rest client
//  Future<PostsList> getPosts() {
//
//    return _restClient
//        .get(Endpoints.getPosts)
//        .then((dynamic res) => PostsList.fromJson(res))
//        .catchError((error) => throw NetworkException(message: error));
//  }

}
