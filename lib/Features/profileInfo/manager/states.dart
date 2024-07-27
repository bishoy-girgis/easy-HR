import 'package:easy_hr/Domain/entity/profile/profile_data_entity.dart';
import '../../../../Core/error/faliure.dart';

abstract class ProfileState {}

final class ProfileInitial extends ProfileState {}


final class ProfileSuccessState extends ProfileState {
  final ProfileDataEntity profileDataEntity;

  ProfileSuccessState({required this.profileDataEntity});
}

final class ProfileLoadingState extends ProfileState {}


class ProfileErrorState extends ProfileState {
  Failure failure;

  ProfileErrorState(this.failure);
}
