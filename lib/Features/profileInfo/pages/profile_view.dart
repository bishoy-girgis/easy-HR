import 'package:easy_hr/Features/profileInfo/widgets/profile_item_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/constants/app_colors.dart';
import '../../../../Core/widgets/gap.dart';
import '../../../../Core/widgets/text_builder.dart';
import '../../../Core/constants/app_constants.dart';
import '../manager/cubit.dart';
import '../manager/states.dart';
import '../widgets/profile_info_widget.dart';
import '../widgets/profile_shimmer_widget.dart';
import '../widgets/title_profile_widget.dart';
import '../widgets/vacation_balance_widget.dart';
import '../widgets/work_hours_widget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: TextBuilder(
          local.profile.toLowerCase(),
          color: AppColors.whiteColor,
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10.sp),
        margin: EdgeInsets.all(12.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: AppColors.whiteColor,
        ),
        child: BlocProvider(
          create: (context) => ProfileCubit()..getProfileData(),
          child: BlocConsumer<ProfileCubit, ProfileState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is ProfileSuccessState) {
                var profileData = state.profileDataEntity;
                return ProfileItemData(profileData: profileData);
              } else if (state is ProfileErrorState) {
                return Center(
                  child: TextBuilder("Sorry ${state.failure.message}"),
                );
              } else if (state is ProfileLoadingState) {
                return Column(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: AppColors.whiteColor,
                        ),
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return const ProfileShimmerWidget();
                          },
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }


}
