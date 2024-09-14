import 'package:easy_hr/Features/loans/manager/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Core/services/web_service.dart';
import '../../../Data/data_source/loan/loan_data_source.dart';
import '../../../Data/repository_imp/loan/loan_repo_imp.dart';
import '../../../Domain/entity/loan/loans_data_entity.dart';
import '../../../Domain/repositories/loan/loan_repository.dart';
import '../../../Domain/usecase/loan/loan_usecase.dart';

class LoanCubit extends Cubit<LoanState> {
  LoanCubit() : super(LoanInitial());
  late LoanDataSource loanDataSource = LoanDataSource(WebService().publicDio);
  late LoanRepository loanRepository = LoanRepositoryImp(loanDataSource);
  late LoanUseCase loanUseCase = LoanUseCase(loanRepository);

  static LoanCubit get(context) => BlocProvider.of(context);

  late List<LoanDataEntity> loans;

  getLoan() async {
    emit(LoanLoadingState());
    var result = await loanUseCase.execute();
    result.fold((error) {
      debugPrint(error.message);
      emit(LoanErrorState(error));
    }, (r) async {
      loans = r;
      emit(LoanSuccessState(loanDataEntity: r));
    });
  }
}
