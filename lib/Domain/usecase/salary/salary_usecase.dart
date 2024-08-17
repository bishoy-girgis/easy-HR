import 'package:dartz/dartz.dart';
import 'package:easy_hr/Domain/entity/salary/salary_data_entity.dart';
import 'package:easy_hr/Domain/repositories/salary/salary_repository.dart';

import '../../../Core/error/failure.dart';

class SalaryUseCase{
  final SalaryRepository salaryRepository;

  SalaryUseCase(this.salaryRepository);

  Future<Either<Failure, List<SalaryDataEntity>>> execute() async {
    return await salaryRepository.getSalary();
  }
}