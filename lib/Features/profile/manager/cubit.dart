import 'package:easy_hr/Data/data_source/profile/profile_data_source.dart';
import 'package:easy_hr/Data/repository_imp/profile/profile_repo_imp.dart';
import 'package:easy_hr/Domain/entity/profile/profile_data_entity.dart';
import 'package:easy_hr/Domain/usecase/profile/profile_data_usecase.dart';
import 'package:easy_hr/Features/profile/manager/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Core/services/web_service.dart';
import '../../../../Domain/repositories/profile/profile_repository.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  late ProfileDataSource profileDataSource = ProfileDataSource(WebService().publicDio);
  late ProfileRepository profileRepository = ProfileRepositoryImp(profileDataSource);
  late ProfileDataUseCase profileDataUseCase = ProfileDataUseCase(profileRepository);

  static ProfileCubit get(context) => BlocProvider.of(context);

  late ProfileDataEntity profileData;

  getProfileData() async {
    emit(ProfileLoadingState());
    var result = await profileDataUseCase.execute();
    result.fold((error) {
      debugPrint(error.message);
      emit(ProfileErrorState(error));
    }, (r) async {
      profileData = r;
      emit(ProfileSuccessState(profileDataEntity: profileData));
    });
  }
}
