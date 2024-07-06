import 'package:easy_hr/Core/widgets/gap.dart';
import 'package:easy_hr/Features/vacations/widgets/select_date_vacation.dart';
import 'package:easy_hr/Features/vacations/widgets/voucher_main_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/constants/app_colors.dart';
import '../../../Core/widgets/text_builder.dart';

class CreateVacation extends StatelessWidget {
  const CreateVacation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextBuilder(
          "create Vacation",
          isHeader: true,
          color: AppColors.whiteColor,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(12.sp),
          child: const Column(
            children: [
              VoucherMainData(),
         GapH(h: 2),
              SelectDateVacation()
            ],
          ),
        ),
      ),
    );
  }
}
