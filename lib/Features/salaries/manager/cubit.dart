import 'package:bloc/bloc.dart';
import 'package:easy_hr/Features/salaries/manager/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Core/services/web_service.dart';
import '../../../Data/data_source/salary/salary_data_source.dart';
import '../../../Data/repository_imp/salary/salary_repo_imp.dart';
import '../../../Domain/entity/salary/salary_data_entity.dart';
import '../../../Domain/repositories/salary/salary_repository.dart';
import '../../../Domain/usecase/salary/salary_usecase.dart';

class SalaryCubit extends Cubit<SalaryState> {
  SalaryCubit() : super(SalaryInitial());
  late SalaryDataSource salaryDataSource =
      SalaryDataSource(WebService().publicDio);
  late SalaryRepository salaryRepository =
      SalaryRepositoryImp(salaryDataSource);
  late SalaryUseCase salaryUseCase = SalaryUseCase(salaryRepository);

  static SalaryCubit get(context) => BlocProvider.of(context);

  late List<SalaryDataEntity> salary;

  getSalary() async {
    emit(SalaryLoadingState());
    var result = await salaryUseCase.execute();
    result.fold((error) {
      debugPrint(error.message);
      emit(SalaryErrorState(error));
    }, (r) async {
      salary = r;
      emit(SalarySuccessState(salaryDataEntity: r));
    });
  }
}
