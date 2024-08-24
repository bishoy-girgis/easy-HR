import 'package:easy_hr/Domain/entity/salary/salary_data_entity.dart';
import 'package:easy_hr/Features/salaries/widgets/salary_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Core/constants/app_colors.dart';
import '../../../Core/widgets/gap.dart';
import '../../../Core/widgets/text_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SalaryWidget extends StatefulWidget {
  SalaryDataEntity salary;
   SalaryWidget({super.key,required this.salary});

  @override
  State<SalaryWidget> createState() => _SalaryWidgetState();
}

class _SalaryWidgetState extends State<SalaryWidget> {
  bool moreInfo = false;

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
            decoration: BoxDecoration(
              color: AppColors.blackColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18.r),
                  topRight: Radius.circular(18.r)),
            ),
            child: Row(
              children: [
                 TextBuilder(
                  "-  ${local.date}",
                  color: Colors.white,
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.38),
                 TextBuilder(
                  "${widget.salary.monthYear}",
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 8.w),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.8),
            ),
            child: Column(
              children: [
                SalaryDataWidget(
                    text: local.basic,
                    value: "${widget.salary.basicSal}",
                    text2:  local.awards,
                    value2: "${widget.salary.awards}"),
                const GapH(h: 1),
                SalaryDataWidget(
                    text:  local.net,
                    value: "${widget.salary.netSalary}",
                    text2:  local.deductions,
                    value2: "${widget.salary.deductions}"),
              ],
            ),
          ),
          moreInfo
              ? Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(
                        color: Colors.black,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 4.h),
                        padding: EdgeInsets.all(7.r),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            color: AppColors.secondColorBlue),
                        child: TextBuilder(
                          local.awards,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                      SalaryDataWidget(
                          text:  local.basic,
                          value: "${widget.salary.basicSal}",
                          text2:  local.insurance,
                          value2: "${widget.salary.insurSalary}"),
                      SalaryDataWidget(
                          text:  local.allowances,
                          value: "${widget.salary.allowances}",
                          text2:  local.bonuses,
                          value2: "${widget.salary.awards}"),
                      SalaryDataWidget(
                          text:  local.vacationDays,
                          value: "${widget.salary.holidayNum}",
                          text2:  local.regularHours,
                          value2: "${widget.salary.hourRate}"),
                      SalaryDataWidget(
                          text:  local.workingHours,
                          value: "${widget.salary.workHours}",
                          text2:  local.workingDays,
                          value2: "${widget.salary.workHours}"),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 2.w, vertical: 4.h),
                        padding: EdgeInsets.all(4.r),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            color: Colors.black54),
                        child: TextBuilder(
                          local.rateSalary,
                          fontSize: 12,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                      SalaryDataWidget(
                          text:  local.daily,
                          value: "${widget.salary.dayRate}",
                          text2:  local.hourly,
                          value2: "${widget.salary.hourRate}"),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 2.w, vertical: 4.h),
                        padding: EdgeInsets.all(4.r),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            color: Colors.black54),
                        child: TextBuilder(
                          local.overtimeHours,
                          fontSize: 12,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                      SalaryDataWidget(
                          text: "150%",
                          value: "${widget.salary.oneHalfOverHours}",
                          text2: "200%",
                          value2: "${widget.salary.doubleOverHours}"),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 2.w, vertical: 4.h),
                        padding: EdgeInsets.all(4.r),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            color: Colors.black54),
                        child: TextBuilder(
                          local.overtimePay,
                          fontSize: 12,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                      SalaryDataWidget(
                          text: "150%",
                          value: "${widget.salary.oneHalfOverHoursSal}",
                          text2: "200%",
                          value2: "${widget.salary.doubleOverHoursSal}"),
                       Divider(
                        height: 8.h,
                        color: Colors.black,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 4.h),
                        padding: EdgeInsets.all(7.r),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            color: const Color(0xFF461111)),
                        child: TextBuilder(
                          local.deductions,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                      SalaryDataWidget(
                          text:  local.loans,
                          value: "${widget.salary.loans}",
                          text2:  local.penalty,
                          value2: "${widget.salary.loans}"),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 2.w, vertical: 4.h),
                        padding: EdgeInsets.all(4.r),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            color: Colors.black54),
                        child: TextBuilder(
                          local.insurance,
                          fontSize: 12,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                      SalaryDataWidget(
                          text:  local.social,
                          value: "${widget.salary.socialInsurSal}",
                          text2:  local.injury,
                          value2: "${widget.salary.workInjurSal}"),
                      SalaryDataWidget(
                          text:  local.medical,
                          value: "${widget.salary.healthInsurance}",
                          text2:  local.social,
                          value2: "${widget.salary.socialInsurSal}"),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 2.w, vertical: 4.h),
                        padding: EdgeInsets.all(4.r),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            color: Colors.black54),
                        child: TextBuilder(
                          local.attendanceDeparturePenalties,
                          fontSize: 12,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                      SalaryDataWidget(
                          text:  local.balance,
                          value: "${widget.salary.attendDeductsV}",
                          text2:  local.days,
                          value2: "${widget.salary.attendDeductsD}"),
                      const GapH(h: 1),
                    ],
                  ),
                )
              : Container(),
          InkWell(
            onTap: () {
              setState(() {
                moreInfo = !moreInfo;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              decoration: BoxDecoration(
                color: AppColors.blackColor.withOpacity(0.82),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(18.r),
                    bottomRight: Radius.circular(18.r)),
              ),
              child: moreInfo
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.arrow_drop_up_outlined,
                            color: Colors.white, size: 20.r),
                        const GapW(w: 1),
                         TextBuilder(
                          local.less,
                          color: Colors.white,
                          fontSize: 11,
                        )
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.arrow_drop_down,
                            color: Colors.white, size: 20.r),
                        const GapW(w: 1),
                         TextBuilder(
                          local.moreInfo,
                          color: Colors.white,
                          fontSize: 11,
                        )
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
