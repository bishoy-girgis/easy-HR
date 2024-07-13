import 'dart:developer';
import 'package:easy_hr/Core/constants/app_constants.dart';
import 'package:easy_hr/Features/login/manager/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Core/services/cache_helper.dart';
import '../../../Core/services/web_service.dart';
import '../../../Data/data_source/login/login_data_source.dart';
import '../../../Data/repository_imp/login/login_repo_imp.dart';
import '../../../Domain/entity/user/user_entity.dart';
import '../../../Domain/repositories/login/login_repository.dart';
import '../../../Domain/usecase/login/login_usecase.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  late LoginDataSource loginDataSource =
      LoginDataSource(WebService().publicDio);
  late LoginRepository loginRepository = LoginRepositoryImp(loginDataSource);
  late LoginUseCase loginUseCase = LoginUseCase(loginRepository);

  static LoginCubit get(context) => BlocProvider.of(context);
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = true;
  late UserEntity user;

  void changeVisibility() {
    emit(LoginInitial());
    isPasswordVisible = !isPasswordVisible;
    emit(ChangePasswordVisibility());
  }

  userLogin() async {
    emit(LoginLoadingState());
    var result = await loginUseCase.execute(
        userName: userNameController.text, password: passwordController.text);
    result.fold((error) {
      debugPrint(error.message);
      emit(LoginErrorState(error));
    }, (r) async {
      user = r;
      SharedPref.set(key: 'accessToken', value: user.accessToken!);
      log("🎄🎄***${user.userName!}🎄🎄${user.accessToken!}");
      SharedPref.set(key: 'VATType', value: user.vatType);
      SharedPref.set(key: 'userName', value: user.userName!);
      SharedPref.set(key: 'whId', value: user.whId);
      SharedPref.set(key: 'empId', value: user.empId);
      SharedPref.set(key: 'vat', value: user.vat);
      SharedPref.set(key: 'ccid', value: user.ccId);
      SharedPref.set(key: 'branchID', value: user.branchId);
      SharedPref.set(key: 'companyID', value: user.companyId);
      AppConstants.updateValues();
      WebService().setToken(user.accessToken!);
      log("emp idd ${SharedPref.get(key: "empId")}");
      AppConstants.accessToken = user.accessToken!;
      log("ACCESS TOKEN  ${AppConstants.accessToken}");
      emit(LoginSuccessState(userEntity: r));
      return user;
    });
  }
}
