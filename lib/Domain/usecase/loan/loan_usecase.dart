import 'package:dartz/dartz.dart';
import '../../../Core/error/failure.dart';
import '../../entity/loan/loans_data_entity.dart';
import '../../repositories/loan/loan_repository.dart';

class LoanUseCase{
  final LoanRepository loanRepository;

  LoanUseCase(this.loanRepository);

  Future<Either<Failure, List<LoanDataEntity>>> execute() async {
    return await loanRepository.getLoans();
  }
}