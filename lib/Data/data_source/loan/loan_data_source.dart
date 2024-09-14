import 'package:dio/dio.dart';

import '../../../Core/constants/end_points.dart';
import '../../../Core/services/cache_helper.dart';

class LoanDataSource {
  final Dio dio;

  LoanDataSource(this.dio);

  Future<Response> loansData() {
    int empId =SharedPref.get(key: "empId") ;
    return dio.get(EndPoints.loan,queryParameters:{
      "EmpID":empId
    });
  }
}
