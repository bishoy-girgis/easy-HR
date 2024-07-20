import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

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
    required DateTime dateFrom,
    required DateTime dateTo,
    required String notes,
  }) async {
    String user = SharedPref.get(key: "userName");
    int companyId = SharedPref.get(key: "companyID");
    var body = {
      "EmpId": empId,
      "VacationTypeId": vacationTypeId,
      "DateFrom": DateFormat('dd/MM/yyyy').format(dateFrom),
      "DateTo": DateFormat('dd/MM/yyyy').format(dateTo),
      "notes": notes ?? "",
      "user": user,
      "companyid": companyId,
    };

    final response = await dio.post(
      EndPoints.addVacation,
      data: body,
        options: Options(contentType: Headers.formUrlEncodedContentType)
    );

    return response;
  }
}
