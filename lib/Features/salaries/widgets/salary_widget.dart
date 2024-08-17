import 'package:easy_hr/Features/salaries/widgets/salary_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/constants/app_colors.dart';
import '../../../Core/widgets/gap.dart';
import '../../../Core/widgets/text_builder.dart';

class SalaryWidget extends StatefulWidget {
  const SalaryWidget({super.key});

  @override
  State<SalaryWidget> createState() => _SalaryWidgetState();
}

class _SalaryWidgetState extends State<SalaryWidget> {
  bool moreInfo = false;

  @override
  Widget build(BuildContext context) {
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
                const TextBuilder(
                  "-  Date",
                  color: Colors.white,
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.38),
                const TextBuilder(
                  "10/2024",
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
                    text: "Basic",
                    value: "1200",
                    text2: "Benefits",
                    value2: "200"),
                const GapH(h: 1),
                SalaryDataWidget(
                    text: "Net",
                    value: "1100",
                    text2: "Deducted",
                    value2: "100"),
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
                          "Benefits ",
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                      SalaryDataWidget(
                          text: "Basic",
                          value: "1200",
                          text2: "Insurance",
                          value2: "200"),
                      SalaryDataWidget(
                          text: "Allowances",
                          value: "00",
                          text2: "Bonuses",
                          value2: "00"),
                      SalaryDataWidget(
                          text: "Vacation Days",
                          value: "00",
                          text2: "Regular Hours",
                          value2: "00"),
                      SalaryDataWidget(
                          text: "Working Hours",
                          value: "180",
                          text2: "Working Days",
                          value2: "22"),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 2.w, vertical: 4.h),
                        padding: EdgeInsets.all(4.r),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            color: Colors.black54),
                        child: TextBuilder(
                          "Rate Salary :",
                          fontSize: 12,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                      SalaryDataWidget(
                          text: "Daily",
                          value: "1200",
                          text2: "Hourly",
                          value2: "200"),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 2.w, vertical: 4.h),
                        padding: EdgeInsets.all(4.r),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            color: Colors.black54),
                        child: TextBuilder(
                          "Overtime Hours :",
                          fontSize: 12,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                      SalaryDataWidget(
                          text: "150%",
                          value: "00",
                          text2: "200%",
                          value2: "00"),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 2.w, vertical: 4.h),
                        padding: EdgeInsets.all(4.r),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            color: Colors.black54),
                        child: TextBuilder(
                          "Overtime Pay :",
                          fontSize: 12,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                      SalaryDataWidget(
                          text: "150%",
                          value: "00",
                          text2: "200%",
                          value2: "00"),
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
                          "Deductions ",
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                      SalaryDataWidget(
                          text: "Loans",
                          value: "00",
                          text2: "Penalty",
                          value2: "00"),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 2.w, vertical: 4.h),
                        padding: EdgeInsets.all(4.r),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            color: Colors.black54),
                        child: TextBuilder(
                          "Insurance :",
                          fontSize: 12,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                      SalaryDataWidget(
                          text: "Social",
                          value: "00",
                          text2: "Injury",
                          value2: "00"),
                      SalaryDataWidget(
                          text: "Medical",
                          value: "00",
                          text2: "Social",
                          value2: "00"),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 2.w, vertical: 4.h),
                        padding: EdgeInsets.all(4.r),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            color: Colors.black54),
                        child: TextBuilder(
                          "Attendance and Departure Penalties :",
                          fontSize: 12,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                      SalaryDataWidget(
                          text: "Balance",
                          value: "00",
                          text2: "Days",
                          value2: "00"),
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
                        const TextBuilder(
                          "less.",
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
                        const TextBuilder(
                          "more info.",
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
