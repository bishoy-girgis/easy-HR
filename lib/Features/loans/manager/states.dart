import '../../../Core/error/failure.dart';
import '../../../Domain/entity/loan/loans_data_entity.dart';

abstract class LoanState {}

final class LoanInitial extends LoanState {}


final class LoanLoadingState extends LoanState {}

final class LoanSuccessState extends LoanState {
  final List<LoanDataEntity> loanDataEntity;

  LoanSuccessState({required this.loanDataEntity});
}

class LoanErrorState extends LoanState {
  Failure failure;

  LoanErrorState(this.failure);
}
