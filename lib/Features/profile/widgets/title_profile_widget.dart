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
          padding: EdgeInsets.all(3.sp),
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
