import 'package:easy_hr/Domain/entity/salary/salary_data_entity.dart';
import 'package:easy_hr/Features/salaries/widgets/salary_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Core/constants/app_colors.dart';
import '../../../Core/widgets/gap.dart';
import '../../../Core/widgets/text_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'header_salary_widgrt.dart';

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
                  "-  ${local.month}",
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
                    text:  local.deductions,
                    value: "${widget.salary.deductions}",
                    color2: Colors.green,
                    text2:  local.net,
                    value2: "${widget.salary.netSalary}"),
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
                      Divider(
                        height: 12.h,
                        color: Colors.black,
                        thickness: 3,
                      ),
                      HeaderSalaryWidget(title: local.awards,color: AppColors.secondColorBlue),
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
                      HeaderSalaryWidget(title: local.rateSalary,color: AppColors.secondColorBlue),
                      SalaryDataWidget(
                          text:  local.daily,
                          value: "${widget.salary.dayRate}",
                          text2:  local.hourly,
                          value2: "${widget.salary.hourRate}"),
                      HeaderSalaryWidget(title: local.overtimeHours,color: AppColors.secondColorBlue),
                      SalaryDataWidget(
                          text: "150%",
                          value: "${widget.salary.oneHalfOverHours}",
                          text2: "200%",
                          value2: "${widget.salary.doubleOverHours}"),
                      HeaderSalaryWidget(title: local.overtimePay,color: AppColors.secondColorBlue),

                      SalaryDataWidget(
                          text: "150%",
                          value: "${widget.salary.oneHalfOverHoursSal}",
                          text2: "200%",
                          value2: "${widget.salary.doubleOverHoursSal}"),
                       Divider(
                        height: 12.h,
                        color: Colors.black,
                         thickness: 3,
                      ),
                      HeaderSalaryWidget(title: local.deductions,color: AppColors.redColor),

                      SalaryDataWidget(
                          text:  local.loans,
                          value: "${widget.salary.loans}",
                          text2:  local.penalty,
                          value2: "${widget.salary.loans}"),
                      HeaderSalaryWidget(title: local.insurance,color: AppColors.redColor),

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
                      HeaderSalaryWidget(title: local.attendanceDeparturePenalties,color: AppColors.redColor),

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
