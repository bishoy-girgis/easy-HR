import 'package:dartz/dartz.dart';
import 'package:easy_hr/Domain/entity/vacation/vacation_data_entity.dart';
import '../../../Core/error/failure.dart';
import '../../entity/vacation/vacation_type_entity.dart';

abstract class VacationsRepository {
  Future<Either<Failure, List<VacationDataEntity>>> getVacations();

  Future<Either<Failure, List<VacationTypeEntity>>> getVacationTypes();

  Future<Either<Failure, String>> addVacation({
    required int vacationTypeId,
    required DateTime dateFrom,
    required DateTime dateTo,
    required String notes,
  });
}
