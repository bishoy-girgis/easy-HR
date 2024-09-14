import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/widgets/text_builder.dart';

class HeaderSalaryWidget extends StatelessWidget {
  Color? color = Colors.black54;
  String title;
   HeaderSalaryWidget({super.key,required this.title,this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: 2.w, vertical: 4.h),
      padding: EdgeInsets.all(4.r),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color:color),
      child: TextBuilder(
        title,
        fontSize: 12,
        color: Colors.white.withOpacity(0.9),
      ),
    );
  }
}
