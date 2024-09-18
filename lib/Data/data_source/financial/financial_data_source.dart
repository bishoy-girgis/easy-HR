import 'package:dio/dio.dart';
import '../../../Core/constants/end_points.dart';
import '../../../Core/services/cache_helper.dart';

class FinancialDataSource {
  final Dio dio;

  FinancialDataSource(this.dio);

  Future<Response> financialsData() {
    int empId =SharedPref.get(key: "empId") ;
    return dio.get(EndPoints.financial,queryParameters:{
      "EmpID":empId
    });
  }
}
