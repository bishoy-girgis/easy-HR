import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/constants/app_colors.dart';
import '../../../../Core/widgets/text_builder.dart';

class TitleProfileWidget extends StatelessWidget {
  String title;

  TitleProfileWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 4.h),
          padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 6.h),
          decoration: BoxDecoration(
            color: AppColors.primaryColorGrey.withOpacity(0.85),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextBuilder(
            title,
            isHeader: true,
            fontSize: 15,
            color: AppColors.whiteColor,
          ),
        ),
      ],
    );
  }
}
