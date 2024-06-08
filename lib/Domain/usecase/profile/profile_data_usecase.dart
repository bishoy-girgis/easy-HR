import 'package:dartz/dartz.dart';

import '../../../Core/error/faliure.dart';
import '../../entity/profile/profile_data_entity.dart';
import '../../repositories/profile/profile_repository.dart';

class ProfileDataUseCase {
  final ProfileRepository profileRepository;

  ProfileDataUseCase(this.profileRepository);

  Future<Either<Failure, ProfileDataEntity>> execute() async {
    return await profileRepository.profileData();
  }
}
