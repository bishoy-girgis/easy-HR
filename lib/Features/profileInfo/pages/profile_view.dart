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
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextBuilder(
                            profileData.empname ?? profileData.empename ?? "",
                            isHeader: true,
                            fontSize: 17,
                            color: AppColors.primaryColorGrey,
                          ),
                          const GapW(w: 20),
                          TextBuilder(
                            "${local.employeeCode} : ${profileData.empcode}",
                            isHeader: true,
                            fontSize: 17,
                            color: AppColors.primaryColorGrey,
                          ),
                        ],
                      ),
                      Divider(
                        color: AppColors.primaryColorGrey,
                        thickness: 2,
                        height: 15.h,
                      ),
                      TitleProfileWidget(title: local.profileInfo),
                      ProfileInfoWidget(
                        text: local.nationalId,
                        value: "${profileData.id}",
                        text2: local.dateOfBirth,
                        value2: AppConstants.formatDate(
                            profileData.birthdate ?? "1990-10-01T00:00:00"),
                      ),
                      ProfileInfoWidget(
                          text: local.mobileNo,
                          value: profileData.empMobile??"0000",
                          text2: local.address,
                          value2: profileData.address ?? ""),
                      ProfileInfoWidget(
                          text: local.qualification,
                          value: profileData.educationname ??
                              profileData.educationename ??
                              "",
                          text2: local.job,
                          value2: profileData.jobname ?? ""),
                      ProfileInfoWidget(
                          text: local.nationality,
                          value: profileData.nationname ??
                              profileData.nationename ??
                              "",
                          text2: local.email,
                          value2: profileData.email ?? ""),
                      Divider(
                        color: AppColors.primaryColorGrey,
                        thickness: 2,
                        height: 15.h,
                      ),
                      TitleProfileWidget(title: local.workHours),
                      WorkHoursWidget(
                          shiftNo: "${local.shift} 1",
                          from: profileData.normalworkhoursfrom ?? "0",
                          to: profileData.normalworkhoursto ?? "0"),
                      WorkHoursWidget(
                          shiftNo: "${local.shift} 2",
                          from: profileData.weekendworkhoursfrom ?? "0",
                          to: profileData.weekendworkhoursto ?? "0"),
                      Divider(
                        color: AppColors.primaryColorGrey,
                        thickness: 2,
                        height: 15.h,
                      ),
                      TitleProfileWidget(title: local.vacationsBalance),
                      VacationBalanceWidget(
                          typeVacation: local.annualBalance,
                          dayNo: "${profileData.balancenormal} ${local.days}"),
                      VacationBalanceWidget(
                          typeVacation: local.compensatoryBalance,
                          dayNo: "${profileData.balancearda} ${local.days}"),
                      Divider(
                        color: AppColors.primaryColorGrey,
                        thickness: 2,
                        height: 15.h,
                      ),
                      TitleProfileWidget(title: local.salary),
                      VacationBalanceWidget(
                          typeVacation: local.basicSalary,
                          dayNo: "${profileData.basicsalary} ${local.sar}"),
                      VacationBalanceWidget(
                          typeVacation: local.salaryDeductions,
                          dayNo: "${profileData.paymenttype}"),
                      VacationBalanceWidget(
                          typeVacation: local.accountNumber,
                          dayNo: "${profileData.empBank}"),
                    ],
                  ),
                );
              } else if (state is ProfileErrorState) {
                debugPrint(state.failure.message);
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
