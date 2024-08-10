import 'package:easy_hr/Domain/entity/vacation/vacation_type_entity.dart';

import '../../../Core/error/failure.dart';
import '../../../Domain/entity/vacation/vacation_data_entity.dart';

abstract class VacationState {}

final class VacationInitial extends VacationState {}

final class VacationSuccessState extends VacationState {
  final List<VacationDataEntity> vacationDataEntity;

  VacationSuccessState({required this.vacationDataEntity});
}

final class VacationLoadingState extends VacationState {}

class VacationErrorState extends VacationState {
  Failure failure;

  VacationErrorState(this.failure);
}

final class VacationTypesSuccessState extends VacationState {
  final List<VacationTypeEntity> vacationDataEntity;

  VacationTypesSuccessState({required this.vacationDataEntity});
}

final class VacationTypesLoadingState extends VacationState {}

class VacationTypesErrorState extends VacationState {
  Failure failure;

  VacationTypesErrorState(this.failure);
}

class VacationDateChanged extends VacationState {
  final DateTime? fromDate;
  final DateTime? toDate;

  VacationDateChanged({this.fromDate, this.toDate});
}

final class AddVacationSuccessState extends VacationState {
  String message;
  AddVacationSuccessState(this.message);
}

final class AddVacationLoadingState extends VacationState {}

class AddVacationErrorState extends VacationState {
  Failure failure;

  AddVacationErrorState(this.failure);
}
