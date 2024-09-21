import 'package:easy_hr/Core/widgets/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/text_builder.dart';
import '../../../Core/constants/app_colors.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({
    super.key,
    this.imageIcon,
    this.image = false,
    required this.categoryName,
    this.icon,
    this.onTap,
  });

  bool image;
  final IconData? icon;
  final ImageProvider<Object>? imageIcon;
  final String categoryName;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 14.w, vertical: 7.h),
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 7.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.whiteColor,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black45,
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(1, 1),
                ),
              ]
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              image == true ?
              Row(
                children: [
                  const Spacer(),
                  ImageIcon(
                    imageIcon,
                    color: AppColors.primaryColorGrey,
                    size: 28.sp,
                  ),
                ],
              ) :
              Row(
                children: [
                  const Spacer(),
                  Icon(
                    icon,
                    size: 32.sp,
                    color: Colors.blueGrey,
                  ),
                ],
              ),

              const GapH(h: 4),
              Row(
                children: [
                  TextBuilder(
                    categoryName,
                    fontSize: 18,
                    isHeader: true,
                    color: AppColors.blackColor,
                    // fontSize: ,
                  ),
                  const Spacer(),
                ],
              ),
            ],
          )),
    );
  }
}
