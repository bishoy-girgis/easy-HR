import 'package:easy_hr/Domain/entity/loan/loans_data_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../Core/constants/app_constants.dart';
import '../../../Core/widgets/gap.dart';
import '../../../Core/widgets/text_builder.dart';

class LoanItem extends StatelessWidget {
  LoanDataEntity loan;
   LoanItem({super.key,required this.loan});

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
          Row(
            children: [ Icon(Icons.money,size: 24.sp), const GapW(w: 4), TextBuilder("${loan.loanNumber}")],
          ),
          const GapH(h: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextBuilder(local.loanRequest),
              const GapW(w: 4),
              TextBuilder(
                AppConstants.formatDate(loan.loanDate ?? "1990-10-01T00:00:00"),
              )
            ],
          ),
          const GapH(h: 2),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child:
                    TextBuilder(local.loanValue, color: Colors.black.withOpacity(0.5)),
              ),
              TextBuilder("    : ${loan.loanValue}")
            ],
          ),
          const GapH(h: 1),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child:
                TextBuilder(local.paid, color: Colors.black.withOpacity(0.5)),
              ),
              TextBuilder("    : ${loan.paid}")
            ],
          ),
          const GapH(h: 1),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: TextBuilder(local.remains,
                    color: Colors.black.withOpacity(0.5)),
              ),
              TextBuilder("    : ${loan.balance}")
            ],
          ),
          const GapH(h: 2),

        ],
      ),
    );
  }
}
