import 'package:dartz/dartz.dart';
import '../../../Core/error/failure.dart';
import '../../entity/profile/profile_data_entity.dart';

abstract class ProfileRepository {
  Future<Either<Failure, ProfileDataEntity>> profileData();
}
