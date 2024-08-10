import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_hr/Core/error/failure.dart';
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
      List<dynamic> profiles = result.data.map((item) => ProfileModel.fromJson(item as Map<String, dynamic>)).toList();
      return Right(profiles[0]);
    } catch (e) {
      if(e is DioException){
        DioException error = e;
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
      } else {
        return left(Failure(
          statusCode:  "",
          message: e.toString()
          ,
        ));
      }

    }
  }
}
