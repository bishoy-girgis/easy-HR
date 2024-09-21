import 'package:easy_hr/Core/constants/app_colors.dart';
import 'package:easy_hr/Domain/entity/financial/financial_data_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/constants/app_constants.dart';
import '../../../Core/widgets/gap.dart';
import '../../../Core/widgets/text_builder.dart';

class FinancialItem extends StatelessWidget {
  FinancialDataEntity financial;

  FinancialItem({super.key, required this.financial});

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black45,
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(6.sp),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r),color:
            financial.fType == 2 ? Colors.red[900] : Colors.green[900],),
            
            child: Row(
              children: [
                Icon(Icons.money, size: 24.sp,color: AppColors.whiteColor,),
                const GapW(w: 4),
                TextBuilder("${financial.financeId}",color: AppColors.whiteColor,)
              ],
            ),
          ),
          const GapH(h: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextBuilder(financial.fType == 2 ? local.deduction : local.eligibility,color:
              financial.fType == 2 ? Colors.red[900] : Colors.green[900],),
              const GapW(w: 4),
              TextBuilder(
                AppConstants.formatDate(
                    financial.calcDate ?? "1990-10-01T00:00:00"),
              )
            ],
          ),
          const GapH(h: 2),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.35,
                child: TextBuilder(local.name,
                    color: Colors.black.withOpacity(0.5)),
              ),
              TextBuilder(
                ": ${financial.fName}",
              )
            ],
          ),
          const GapH(h: 1),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.35,
                child: TextBuilder(local.value,
                    color: Colors.black.withOpacity(0.5)),
              ),
              TextBuilder(
                ": ${financial.amountVal}",
                color:
                    financial.fType == 2 ? Colors.red[900] : Colors.green[900],
              )
            ],
          ),
          const GapH(h: 1),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.35,
                child: TextBuilder(local.allowPeriod,
                    color: Colors.black.withOpacity(0.5)),
              ),
              TextBuilder(": ${financial.allowPeriod}")
            ],
          ),
          const GapH(h: 1),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.35,
                child: TextBuilder(local.payment,
                    color: Colors.black.withOpacity(0.5)),
              ),
              TextBuilder(
                  ": ${financial.manualPaid == true ? local.manually : local.cashSalary}")
            ],
          ),
          const GapH(h: 2),
        ],
      ),
    );
  }
}
