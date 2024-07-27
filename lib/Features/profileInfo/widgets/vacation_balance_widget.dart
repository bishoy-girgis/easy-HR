import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/constants/app_colors.dart';
import '../../../../Core/widgets/gap.dart';
import '../../../../Core/widgets/text_builder.dart';

class VacationBalanceWidget extends StatelessWidget {
  String typeVacation;
  String dayNo;
   VacationBalanceWidget({super.key,required this.dayNo,required this.typeVacation});

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.black,
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 4.h),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: EdgeInsets.all(8.sp),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.whiteColor.withOpacity(0.85),
        ),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                 TextBuilder(
                  "$typeVacation :",
                  isHeader: true,
                  fontSize: 16,
                  color: AppColors.primaryColorGrey,
                ),
                const GapW(w: 1),
                Flexible(
                  child: Center(
                    child: TextBuilder(
                      dayNo,
                      fontSize: 15,
                      color: AppColors.primaryColorGrey,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
