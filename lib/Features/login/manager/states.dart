import '../../../Core/error/failure.dart';
import '../../../Domain/entity/user/user_entity.dart';

abstract class LoginState {}

final class LoginInitial extends LoginState {}

final class ChangePasswordVisibility extends LoginState {}

final class LoginSuccessState extends LoginState {
  final UserEntity userEntity;

  LoginSuccessState({required this.userEntity});
}

final class LoginLoadingState extends LoginState {}


class LoginErrorState extends LoginState {
  Failure failure;

  LoginErrorState(this.failure);
}
