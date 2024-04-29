import 'package:dartz/dartz.dart';
import '../../../Core/error/faliure.dart';
import '../../entity/user/user_entity.dart';

abstract class LoginRepository {
  Future<Either<Failure, UserEntity>> userLogin(
      {required String userName, required String password});
}
