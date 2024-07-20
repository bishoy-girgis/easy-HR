import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_hr/Data/data_source/vacation/vacation_data_source.dart';
import 'package:easy_hr/Data/models/vacation/vacation_model.dart';
import 'package:easy_hr/Data/models/vacation/vacation_type_model.dart';
import 'package:easy_hr/Domain/entity/vacation/vacation_type_entity.dart';
import 'package:easy_hr/Domain/repositories/vacation/vacations_repository.dart';
import 'package:flutter/cupertino.dart';

import '../../../Core/error/faliure.dart';

class VacationRepositoryImp implements VacationsRepository {
  final VacationDataSource vacationDataSource;

  VacationRepositoryImp(this.vacationDataSource);

  @override
  Future<Either<Failure, List<VacationModel>>> getVacations() async {
    try {
      var result = await vacationDataSource.getVacations();
      if (result.data is List) {
        List<VacationModel> vacations = (result.data as List)
            .map((item) => VacationModel.fromJson(item as Map<String, dynamic>))
            .toList();
        return Right(vacations);
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
          return Left(
            Failure(
              statusCode: error.response?.statusCode.toString() ?? "",
              message: error.response?.data["error"],
            ),
          );
        } else {
          return Left(Failure(
            statusCode: error.response?.statusCode.toString() ?? "",
            message: error.response?.data["Message"],
          ));
        }
      } else {
        return Left(Failure(
          statusCode: "",
          message: e.toString(),
        ));
      }
    }
  }

  @override
  Future<Either<Failure, List<VacationTypeEntity>>> getVacationTypes() async {
    try {
      var result = await vacationDataSource.getVacationTypes();
      if (result.data is List) {
        List<VacationTypeModel> vacations = (result.data as List)
            .map((item) =>
                VacationTypeModel.fromJson(item as Map<String, dynamic>))
            .toList();
        return Right(vacations);
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
          return Left(
            Failure(
              statusCode: error.response?.statusCode.toString() ?? "",
              message: error.response?.data["error"],
            ),
          );
        } else {
          return Left(Failure(
            statusCode: error.response?.statusCode.toString() ?? "",
            message: error.response?.data["Message"],
          ));
        }
      } else {
        return Left(Failure(
          statusCode: "",
          message: e.toString(),
        ));
      }
    }
  }

  @override
  Future<Either<Failure, String>> addVacation({
    required int vacationTypeId,
    required DateTime dateFrom,
    required DateTime dateTo,
    required String notes,
  }) async {
    try {
      var result = await vacationDataSource.addVacation(
          vacationTypeId: vacationTypeId,
          dateFrom: dateFrom,
          dateTo: dateTo,
          notes: notes);
      String response = result.data;
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        DioException error = e;
        debugPrint("${error.response}");

        if (error.response?.statusCode == 401) {
          return Left(
            Failure(
              statusCode: error.response?.statusCode.toString() ?? "",
              message: error.response?.data["error"],
            ),
          );
        } else {
          return Left(Failure(
            statusCode: error.response?.statusCode.toString() ?? "",
            message: error.response?.data["Message"],
          ));
        }
      } else {
        return Left(Failure(
          statusCode: "",
          message: e.toString(),
        ));
      }
    }
  }
}
