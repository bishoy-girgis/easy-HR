import 'package:dartz/dartz.dart';

import '../../../Core/error/faliure.dart';
import '../../entity/vacation/vacation_data_entity.dart';
import '../../repositories/vacation/vacations_repository.dart';

class AddVacationUseCase {
  final VacationsRepository vacationsRepository;

  AddVacationUseCase(this.vacationsRepository);

  Future<Either<Failure, String>> execute({
    required int vacationTypeId,
    required DateTime dateFrom,
    required DateTime dateTo,
    required String notes,
  }) async {
    return await vacationsRepository.addVacation(
        dateFrom: dateFrom,
        dateTo: dateTo,
        notes: notes,
        vacationTypeId: vacationTypeId);
  }
}
