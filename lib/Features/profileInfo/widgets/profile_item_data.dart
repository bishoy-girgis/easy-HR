import 'package:easy_hr/Features/profileInfo/widgets/profile_info_widget.dart';
import 'package:easy_hr/Features/profileInfo/widgets/title_profile_widget.dart';
import 'package:easy_hr/Features/profileInfo/widgets/vacation_balance_widget.dart';
import 'package:easy_hr/Features/profileInfo/widgets/work_hours_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../Core/constants/app_colors.dart';
import '../../../Core/constants/app_constants.dart';
import '../../../Core/widgets/gap.dart';
import '../../../Core/widgets/text_builder.dart';
import '../../../Domain/entity/profile/profile_data_entity.dart';

class ProfileItemData extends StatelessWidget {
  ProfileDataEntity profileData;
   ProfileItemData({super.key,required this.profileData});

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;

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
                fontSize: 18,
                color: AppColors.primaryColorGrey,
              ),
              const GapW(w: 20),
              TextBuilder(
                "${local.employeeCode} : ${profileData.empcode}",
                isHeader: true,
                fontSize: 18,
                color: AppColors.primaryColorGrey,
              ),
            ],
          ),
          Divider(
            color: AppColors.primaryColorGrey,
            thickness: 2,
            height: 26.h,
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
          dividerProfile(),
          TitleProfileWidget(title: local.workHours),
          WorkHoursWidget(
              shiftNo: "${local.shift} 1",
              from: profileData.normalworkhoursfrom ?? "0",
              to: profileData.normalworkhoursto ?? "0"),
          WorkHoursWidget(
              shiftNo: "${local.shift} 2",
              from: profileData.weekendworkhoursfrom ?? "0",
              to: profileData.weekendworkhoursto ?? "0"),
          dividerProfile(),
          TitleProfileWidget(title: local.vacationsBalance),
          VacationBalanceWidget(
              typeVacation: local.annualBalance,
              dayNo: "${profileData.balancenormal} ${local.days}"),
          VacationBalanceWidget(
              typeVacation: local.compensatoryBalance,
              dayNo: "${profileData.balancearda} ${local.days}"),
          dividerProfile(),
          TitleProfileWidget(title: local.salary),
          VacationBalanceWidget(
              typeVacation: local.basicSalary,
              dayNo: "${profileData.basicsalary} ${local.sar}"),
          VacationBalanceWidget(
              typeVacation: local.salaryDeductions,
              dayNo: "${profileData.paymenttype}"),
          VacationBalanceWidget(
              typeVacation: local.accountNumber,
              dayNo: profileData.empBank ?? "00"),
        ],
      ),
    );
  }
  Widget dividerProfile() {
    return Divider(
      color: AppColors.primaryColorGrey,
      thickness: 1.2,
      height: 10.h,
    );
  }
}
