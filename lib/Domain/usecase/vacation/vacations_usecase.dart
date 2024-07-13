import 'package:dartz/dartz.dart';
import 'package:easy_hr/Domain/entity/vacation/vacation_data_entity.dart';
import 'package:easy_hr/Domain/repositories/vacation/vacations_repository.dart';

import '../../../Core/error/faliure.dart';

class VacationUseCase{
  final VacationsRepository vacationsRepository;

  VacationUseCase(this.vacationsRepository);

  Future<Either<Failure, List<VacationDataEntity>>> execute() async {
    return await vacationsRepository.getVacations();
  }
}