import '../../../Core/error/failure.dart';
import '../../../Domain/entity/financial/financial_data_entity.dart';

abstract class FinancialState {}

final class FinancialInitial extends FinancialState {}


final class FinancialLoadingState extends FinancialState {}

final class FinancialSuccessState extends FinancialState {
  final List<FinancialDataEntity> financialDataEntity;

  FinancialSuccessState({required this.financialDataEntity});
}

class FinancialErrorState extends FinancialState {
  Failure failure;

  FinancialErrorState(this.failure);
}
