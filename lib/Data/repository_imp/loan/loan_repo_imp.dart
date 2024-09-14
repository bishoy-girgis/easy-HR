
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../Core/error/failure.dart';
import '../../../Domain/entity/loan/loans_data_entity.dart';
import '../../../Domain/repositories/loan/loan_repository.dart';
import '../../data_source/loan/loan_data_source.dart';

class LoanRepositoryImp implements LoanRepository {
  LoanDataSource loanDataSource;

  LoanRepositoryImp(this.loanDataSource);

  @override
  Future<Either<Failure, List<LoanDataEntity>>> getLoans() async {
    try {
      var result = await loanDataSource.loansData();
      if (result.data is List) {
        List<LoanDataEntity> salary = (result.data as List)
            .map((item) => LoanDataEntity.fromJson(item as Map<String, dynamic>))
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
