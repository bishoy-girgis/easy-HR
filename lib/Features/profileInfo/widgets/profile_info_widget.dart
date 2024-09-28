import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/constants/app_colors.dart';
import '../../../../Core/widgets/gap.dart';
import '../../../../Core/widgets/text_builder.dart';

class ProfileInfoWidget extends StatelessWidget {
  String text;
  String value;
  String text2;
  String value2;

  ProfileInfoWidget({
    super.key,
    required this.text,
    required this.value,
    required this.text2,
    required this.value2,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.black,
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 7.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        padding: EdgeInsets.all(8.sp),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.whiteColor.withOpacity(0.4),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                TextBuilder(
                  "$text :",
                  fontSize: 16,
                  color: AppColors.primaryColorGrey,
                ),
                const GapW(w: 1),
                Flexible(
                  child: Center(
                    child: TextBuilder(
                      value,
                      fontSize: 15,
                      color: AppColors.primaryColorGrey,
                    ),
                  ),
                ),
              ],
            ),
            const GapH(h: 1),
            Row(
              children: [
                TextBuilder(
                  "$text2 :",
                  fontSize: 16,
                  color: AppColors.primaryColorGrey,
                ),
                const GapW(w: 1),
                Flexible(
                  child: Center(
                    child: TextBuilder(
                      value2,
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
