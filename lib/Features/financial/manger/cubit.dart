import 'package:bloc/bloc.dart';
import 'package:easy_hr/Features/financial/manger/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Core/services/web_service.dart';
import '../../../Data/data_source/financial/financial_data_source.dart';
import '../../../Data/repository_imp/financial/financial_repo_imp.dart';
import '../../../Domain/entity/financial/financial_data_entity.dart';
import '../../../Domain/repositories/financial/financial_repository.dart';
import '../../../Domain/usecase/financial/financial_usecase.dart';

class FinancialCubit extends Cubit<FinancialState> {
  FinancialCubit() : super(FinancialInitial());
  late FinancialDataSource financialDataSource =
      FinancialDataSource(WebService().publicDio);
  late FinancialRepository financialRepository =
      FinancialRepositoryImp(financialDataSource);
  late FinancialUseCase financialUseCase =
      FinancialUseCase(financialRepository);

  static FinancialCubit get(context) => BlocProvider.of(context);

  late List<FinancialDataEntity> financials;

  getFinancial() async {
    emit(FinancialLoadingState());
    var result = await financialUseCase.execute();
    result.fold((error) {
      debugPrint(error.message);
      emit(FinancialErrorState(error));
    }, (r) async {
      financials = r;
      emit(FinancialSuccessState(financialDataEntity: r));
    });
  }
}
