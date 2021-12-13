import 'package:boilerplate/models/login/register.dart';

class Login {
  int? status;
  String? message;
  LoginRes? data;

  Login({this.status, this.message, this.data});

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      status: json["status"],
      message: json["message"],
      data: LoginRes.fromJson(json["data"]),
    );
  }
}
