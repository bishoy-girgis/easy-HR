import 'package:dartz/dartz.dart';

import '../../../Core/error/faliure.dart';
import '../../entity/vacation/vacation_type_entity.dart';
import '../../repositories/vacation/vacations_repository.dart';

class VacationTypeUseCase{

  final VacationsRepository vacationsRepository;

  VacationTypeUseCase(this.vacationsRepository);

  Future<Either<Failure, List<VacationTypeEntity>>> execute() async {
    return await vacationsRepository.getVacationTypes();
  }
}