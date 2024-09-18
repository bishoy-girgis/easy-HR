import 'package:dartz/dartz.dart';
import 'package:easy_hr/Domain/entity/financial/financial_data_entity.dart';

import '../../../Core/error/failure.dart';
import '../../repositories/financial/financial_repository.dart';

class FinancialUseCase{
  final FinancialRepository financialRepository;

  FinancialUseCase(this.financialRepository);

  Future<Either<Failure, List<FinancialDataEntity>>> execute() async {
    return await financialRepository.getFinancials();
  }
}