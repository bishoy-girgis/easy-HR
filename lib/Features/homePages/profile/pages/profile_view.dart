import 'package:easy_hr/Features/homePages/profile/widgets/profile_info_widget.dart';
import 'package:easy_hr/Features/homePages/profile/widgets/title_profile_widget.dart';
import 'package:easy_hr/Features/homePages/profile/widgets/vacation_balance_widget.dart';
import 'package:easy_hr/Features/homePages/profile/widgets/work_hours_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../../Core/constants/app_colors.dart';
import '../../../../Core/widgets/gap.dart';
import '../../../../Core/widgets/text_builder.dart';

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
        // child: ListView.builder(
        //   itemBuilder: (context, index) {
        //     return const ProfileShimmerWidget();
        //   },
        //   itemCount: 5,
        // )
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TextBuilder(
                    "Tarek el sayed",
                    isHeader: true,
                    fontSize: 17,
                    color: AppColors.primaryColorGrey,
                  ),
                  const GapW(w: 20),
                  TextBuilder(
                    "${local.employeeCode} : 336",
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
                value: "${2031568402213214}",
                text2: local.dateOfBirth,
                value2: formatDate("2000-03-03"),
              ),
              ProfileInfoWidget(
                  text: local.mobileNo,
                  value: "01280835258",
                  text2: local.address,
                  value2: "el wehda st. , geda"),
              ProfileInfoWidget(
                  text: local.qualification,
                  value: "Bachelor's Degree",
                  text2: local.job,
                  value2: "Employee Catcher"),
              ProfileInfoWidget(
                  text: local.nationality,
                  value: "Saudi",
                  text2: local.email,
                  value2: "tareqelsayed@gmail.com"),
              Divider(
                color: AppColors.primaryColorGrey,
                thickness: 2,
                height: 15.h,
              ),
              TitleProfileWidget(title: local.workHours),
              WorkHoursWidget(
                  shiftNo: "${local.shift} 1", from: "9:00 AM", to: "1:00 PM"),
              WorkHoursWidget(
                  shiftNo: "${local.shift} 2", from: "4:00 PM", to: "8:00 PM"),
              Divider(
                color: AppColors.primaryColorGrey,
                thickness: 2,
                height: 15.h,
              ),
              TitleProfileWidget(title: local.vacationsBalance),
              VacationBalanceWidget(
                  typeVacation: local.annualBalance, dayNo: "22 ${local.days}"),
              VacationBalanceWidget(
                  typeVacation: local.compensatoryBalance,
                  dayNo: "13 ${local.days}"),
              Divider(
                color: AppColors.primaryColorGrey,
                thickness: 2,
                height: 15.h,
              ),
              TitleProfileWidget(title: local.salary),
              VacationBalanceWidget(
                  typeVacation: local.basicSalary, dayNo: "2000 ${local.sar}"),
              VacationBalanceWidget(
                  typeVacation: local.salaryDeductions,
                  dayNo: "230 ${local.sar}"),
              VacationBalanceWidget(
                  typeVacation: local.accountNumber, dayNo: "235681047"),
            ],
          ),
        ),
      ),
    );
  }

  String formatDate(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    return dateFormat.format(dateTime);
  }
}
