import '../../../Core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../../entity/user/user_entity.dart';
import '../../repositories/login/login_repository.dart';

class LoginUseCase {
  final LoginRepository loginRepository;

  LoginUseCase(this.loginRepository);

  Future<Either<Failure, UserEntity>> execute(
      {required String userName, required String password}) async {
    return await loginRepository.userLogin(
        userName: userName, password: password);
  }
}
