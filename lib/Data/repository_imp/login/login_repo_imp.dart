import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../../../Core/error/failure.dart';
import '../../../Domain/entity/user/user_entity.dart';
import '../../../Domain/repositories/login/login_repository.dart';
import '../../data_source/login/login_data_source.dart';
import '../../models/user/user_model.dart';

class LoginRepositoryImp implements LoginRepository {
  LoginDataSource loginDataSource;

  LoginRepositoryImp(this.loginDataSource);

  @override
  Future<Either<Failure, UserEntity>> userLogin(
      {required String userName, required String password}) async {
    try {
      var result = await loginDataSource.login(userName, password);
      UserModel user = UserModel.fromJson(result.data);
      return Right(user);
    } catch (e) {
      DioException error = e as DioException;
      debugPrint("${error.response}");

      if (error.response?.statusCode == 401) {
        return left(
          Failure(
            statusCode: error.response?.statusCode.toString() ?? "",
            message: error.response?.data["error"],
          ),
        );
      } else {
        return left(Failure(
          statusCode: error.response?.statusCode.toString() ?? "",
          message: error.response?.data["error_description"],
        ));
      }
    }
  }
}
