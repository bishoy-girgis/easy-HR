import 'package:dartz/dartz.dart';
import 'package:easy_hr/Domain/entity/salary/salary_data_entity.dart';

import '../../../Core/error/failure.dart';

abstract class SalaryRepository {
  Future<Either<Failure, List<SalaryDataEntity>>> getSalary();

}
