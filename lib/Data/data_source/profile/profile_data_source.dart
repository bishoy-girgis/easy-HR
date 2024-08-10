import 'package:dio/dio.dart';

import '../../../Core/constants/end_points.dart';
import '../../../Core/services/cache_helper.dart';

class ProfileDataSource {
  final Dio dio;

  ProfileDataSource(this.dio);

  Future<Response> profileData() {
    int empId =SharedPref.get(key: "empId") ;
    return dio.get(EndPoints.profileData,queryParameters:{
      "empid":empId
    });
  }
}
