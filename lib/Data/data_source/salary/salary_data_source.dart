import 'package:dio/dio.dart';

import '../../../Core/constants/end_points.dart';
import '../../../Core/services/cache_helper.dart';

class SalaryDataSource {
  final Dio dio;

  SalaryDataSource(this.dio);

  Future<Response> salaryData() {
    int empId =SharedPref.get(key: "empId") ;
    return dio.get(EndPoints.profileData,queryParameters:{
      "empid":empId
    });
  }
}
