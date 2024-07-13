import 'package:easy_hr/Core/services/cache_helper.dart';
import 'package:easy_hr/Domain/entity/vacation/vacation_type_entity.dart';
import 'package:easy_hr/Domain/repositories/vacation/vacations_repository.dart';
import 'package:easy_hr/Domain/usecase/vacation/add_vacation_usecase.dart';
import 'package:easy_hr/Domain/usecase/vacation/vacatios_type_usecase.dart';
import 'package:easy_hr/Features/vacations/manager/vacation_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Core/services/web_service.dart';
import '../../../Data/data_source/vacation/vacation_data_source.dart';
import '../../../Data/repository_imp/vacation/vacation_repo_imp.dart';
import '../../../Domain/entity/vacation/vacation_data_entity.dart';
import '../../../Domain/usecase/vacation/vacations_usecase.dart';

class VacationCubit extends Cubit<VacationState> {
  VacationCubit() : super(VacationInitial());
  late VacationDataSource vacationDataSource =
      VacationDataSource(WebService().publicDio);
  late VacationsRepository vacationRepository =
      VacationRepositoryImp(vacationDataSource);

  static VacationCubit get(context) => BlocProvider.of(context);

  List<VacationDataEntity> vacations = [];
  List<VacationTypeEntity> vacationTypes = [];

  DateTime? fromDate;
  DateTime? toDate;

  void setFromDate(DateTime date) {
    fromDate = date;
    emit(VacationDateChanged(fromDate: fromDate, toDate: toDate));
  }

  void setToDate(DateTime date) {
    toDate = date;
    emit(VacationDateChanged(fromDate: fromDate, toDate: toDate));
  }

  getVacations() async {
    emit(VacationLoadingState());
    VacationUseCase vacationUseCase = VacationUseCase(vacationRepository);
    var result = await vacationUseCase.execute();
    result.fold((error) {
      debugPrint(error.message);
      emit(VacationErrorState(error));
    }, (r) async {
      vacations = r;
      emit(VacationSuccessState(vacationDataEntity: vacations));
    });
  }

  getVacationTypes() async {
    emit(VacationTypesLoadingState());
    VacationTypeUseCase vacationTypeUseCase =
        VacationTypeUseCase(vacationRepository);
    var result = await vacationTypeUseCase.execute();
    result.fold((error) {
      debugPrint(error.message);
      emit(VacationTypesErrorState(error));
    }, (r) async {
      vacationTypes = r;
      emit(VacationTypesSuccessState(vacationDataEntity: vacationTypes));
    });
  }

  addVacation() async {
    emit(AddVacationLoadingState());
    AddVacationUseCase vacationUseCase = AddVacationUseCase(vacationRepository);
    var result = await vacationUseCase.execute(
        vacationTypeId: SharedPref.get(key: "vacationTypeID"),
        dateFrom: "$fromDate",
        dateTo: "$toDate",
        notes: SharedPref.get(key: "notesVacation"));
    result.fold((error) {
      debugPrint(error.message);
      emit(VacationErrorState(error));
    }, (r) async {
      print("response :::  $r");
      emit(AddVacationSuccessState(r));
    });
  }
}
