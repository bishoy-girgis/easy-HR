import 'package:dio/dio.dart';

import '../../../Core/constants/end_points.dart';
import '../../../Core/services/cache_helper.dart';

class AttendanceDataSource {
  final Dio dio;

  AttendanceDataSource(this.dio);

  Future<Response> attend({
    required int attendType,
    required String date,
  }) {
    int empId = SharedPref.get(key: "empId");
    return dio.post(
      EndPoints.attendance,
      queryParameters: {"EmpID": empId, "Date": date, "AttendType": attendType},
    );
  }
}
