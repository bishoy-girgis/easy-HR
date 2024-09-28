import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../Core/constants/app_colors.dart';
import '../../../../Core/widgets/gap.dart';
import '../../../../Core/widgets/text_builder.dart';

class WorkHoursWidget extends StatelessWidget {
  String shiftNo;
  String from;
  String to;
   WorkHoursWidget({super.key,required this.shiftNo,required this.from,required this.to});

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.black,
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 4.h),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)),
      child: Container(
        padding: EdgeInsets.all(8.sp),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.whiteColor.withOpacity(0.4),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 3.h,horizontal: 5.w),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: AppColors.primaryColorGrey,
                          width: 2),
                      borderRadius: BorderRadius.circular(8)),
                  child:  TextBuilder(
                    shiftNo,
                    fontSize: 16,
                    color: AppColors.primaryColorGrey,
                  ),
                ),
                const GapW(w: 1),
                 Flexible(
                  child: Center(
                    child: TextBuilder(
                      from,
                      fontSize: 15,
                      color: AppColors.primaryColorGrey,
                    ),
                  ),
                ),
                 TextBuilder(
                  AppLocalizations.of(context)!.to,
                  fontSize: 11,
                  color: AppColors.primaryColorGrey,
                ),
                 Flexible(
                  child: Center(
                    child: TextBuilder(
                      to,
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
