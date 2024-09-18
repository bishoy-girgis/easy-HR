import 'package:dartz/dartz.dart';

import '../../../Core/error/failure.dart';
import '../../entity/financial/financial_data_entity.dart';

abstract class FinancialRepository {
  Future<Either<Failure, List<FinancialDataEntity>>> getFinancials();

}
