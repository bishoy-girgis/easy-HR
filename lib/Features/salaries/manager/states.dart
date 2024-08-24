import '../../../Core/error/failure.dart';
import '../../../Domain/entity/salary/salary_data_entity.dart';

abstract class SalaryState {}

final class SalaryInitial extends SalaryState {}

final class SalarySuccessState extends SalaryState {
  final List<SalaryDataEntity> salaryDataEntity;

  SalarySuccessState({required this.salaryDataEntity});
}

final class SalaryLoadingState extends SalaryState {}

class SalaryErrorState extends SalaryState {
  Failure failure;

  SalaryErrorState(this.failure);
}
