import 'package:dartz/dartz.dart';
import '../../../Core/error/faliure.dart';
import '../../entity/profile/profile_data_entity.dart';

abstract class ProfileRepository {
  Future<Either<Failure, ProfileDataEntity>> profileData();
}
