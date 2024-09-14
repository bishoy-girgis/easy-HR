import 'package:dartz/dartz.dart';

import '../../../Core/error/failure.dart';
import '../../entity/loan/loans_data_entity.dart';

abstract class LoanRepository {
  Future<Either<Failure, List<LoanDataEntity>>> getLoans();

}
