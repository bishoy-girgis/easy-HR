import 'package:dio/dio.dart';
import 'package:easy_hr/Core/constants/end_points.dart';

class LoginDataSource {
  final Dio dio;

  LoginDataSource(this.dio);

  Future<Response> login(String userName, String password) {
    var body = {
      'username': userName,
      'password': password,
      'grant_type': "password",
    };
    return dio.post(EndPoints.loginToken,
        data: body.keys
            .map((key) => "$key=${Uri.encodeComponent(body[key]!)}")
            .join("&"));
  }
}
