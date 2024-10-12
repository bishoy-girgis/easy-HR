import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../Core/error/failure.dart';
import '../../../Domain/repositories/attendance/attendance_repository.dart';
import '../../data_source/attendance/attendance_data_source.dart';

class AttendanceRepositoryImp implements AttendanceRepository {
  AttendanceDataSource attendanceDataSource;

  AttendanceRepositoryImp(this.attendanceDataSource);

  @override
  Future<Either<Failure, String>> attend({
    required int attendType,
    required String date,
  }) async {
    try {
      var result = await attendanceDataSource.attend(attendType: attendType, date: date);
      if (result.data is String) {
        return Right(result.data);
      } else {
        return Left(Failure(
          statusCode: "",
          message: "Unexpected data format",
        ));
      }
    } catch (e) {
      if (e is DioException) {
        DioException error = e;
        debugPrint("${error.response}");

        if (error.response?.statusCode == 401) {
          return left(
            Failure(
              statusCode: error.response?.statusCode.toString() ?? "",
              message: error.response?.data["error"],
            ),
          );
        } else {
          return left(Failure(
            statusCode: error.response?.statusCode.toString() ?? "",
            message: error.response?.data["Message"],
          ));
        }
      } else {
        return left(Failure(
          statusCode: "",
          message: e.toString(),
        ));
      }
    }
  }
}
