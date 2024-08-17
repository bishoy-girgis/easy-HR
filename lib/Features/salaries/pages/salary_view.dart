import 'package:easy_hr/Core/widgets/gap.dart';
import 'package:easy_hr/Features/salaries/widgets/salary_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/constants/app_colors.dart';
import '../../../Core/widgets/text_builder.dart';

class SalaryView extends StatelessWidget {
  const SalaryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextBuilder(
          "Salary",
          color: AppColors.whiteColor,
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(10.sp),
        margin: EdgeInsets.all(12.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: AppColors.whiteColor,
        ),
        child: SalaryWidget(),
      ),
    );
  }
}
