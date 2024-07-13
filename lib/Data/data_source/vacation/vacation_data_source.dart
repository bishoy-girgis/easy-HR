import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../Core/constants/end_points.dart';
import '../../../Core/services/cache_helper.dart';

class VacationDataSource {
  final Dio dio;

  VacationDataSource(this.dio);

  int empId = SharedPref.get(key: "empId");

  Future<Response> getVacations() {
    debugPrint("empId ${SharedPref.get(key: "empId")}");
    return dio.get(EndPoints.vacations, queryParameters: {"empid": empId});
  }

  Future<Response> getVacationTypes() {
    return dio.get(
      EndPoints.vacationTypes,
    );
  }

  Future<Response> addVacation({
    required int vacationTypeId,
    required String dateFrom,
    required String dateTo,
    required String notes,
  }) {
    String user = SharedPref.get(key: "userName");
    int companyId = SharedPref.get(key: "companyID");
    return dio.post(EndPoints.addVacation, queryParameters: {
      "EmpId": empId,
      "VacationTypeId": vacationTypeId,
      "DateFrom": dateFrom,
      "DateTo": dateTo,
      "notes": notes,
      "user": user,
      "companyid": companyId,
    });
  }
}
