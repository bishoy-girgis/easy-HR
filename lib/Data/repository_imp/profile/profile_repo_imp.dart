
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_hr/Core/error/faliure.dart';
import 'package:easy_hr/Data/data_source/profile/profile_data_source.dart';
import 'package:easy_hr/Data/models/profile/ProfileModel.dart';
import 'package:easy_hr/Domain/entity/profile/profile_data_entity.dart';
import 'package:flutter/cupertino.dart';

import '../../../Domain/repositories/profile/profile_repository.dart';

class ProfileRepositoryImp implements ProfileRepository {
  ProfileDataSource profileDataSource;

  ProfileRepositoryImp(this.profileDataSource);

  @override
  Future<Either<Failure, ProfileDataEntity>> profileData() async {
    try {
      var result = await profileDataSource.profileData();
      ProfileModel profile = ProfileModel.fromJson(result.data);
      return Right(profile);
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
          message: error.response?.data["Message"],
        ));
      }
    }
  }


}
