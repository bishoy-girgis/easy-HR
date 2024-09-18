
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_hr/Domain/entity/financial/financial_data_entity.dart';
import 'package:flutter/cupertino.dart';

import '../../../Core/error/failure.dart';
import '../../../Domain/repositories/financial/financial_repository.dart';
import '../../data_source/financial/financial_data_source.dart';

class FinancialRepositoryImp implements FinancialRepository {
  FinancialDataSource financialDataSource;

  FinancialRepositoryImp(this.financialDataSource);

  @override
  Future<Either<Failure, List<FinancialDataEntity>>> getFinancials() async {
    try {
      var result = await financialDataSource.financialsData();
      if (result.data is List) {
        List<FinancialDataEntity> financial = (result.data as List)
            .map((item) => FinancialDataEntity.fromJson(item as Map<String, dynamic>))
            .toList();
        return Right(financial);
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
