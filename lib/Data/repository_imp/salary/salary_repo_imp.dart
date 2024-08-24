import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:easy_hr/Core/error/failure.dart';
import 'package:easy_hr/Data/models/salary/salary_model.dart';

import 'package:easy_hr/Domain/entity/salary/salary_data_entity.dart';
import 'package:flutter/cupertino.dart';

import '../../../Domain/repositories/salary/salary_repository.dart';
import '../../data_source/salary/salary_data_source.dart';

class SalaryRepositoryImp implements SalaryRepository {
  SalaryDataSource salaryDataSource;

  SalaryRepositoryImp(this.salaryDataSource);

  @override
  Future<Either<Failure, List<SalaryDataEntity>>> getSalary() async {
    try {
      var result = await salaryDataSource.salaryData();
      if (result.data is List) {
        List<SalaryDataEntity> salary = (result.data as List)
            .map((item) => SalaryModel.fromJson(item as Map<String, dynamic>))
            .toList();
        return Right(salary);
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
