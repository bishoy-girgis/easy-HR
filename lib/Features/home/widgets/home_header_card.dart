import 'package:easy_hr/Features/home/widgets/welcome_mr_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/constants/app_colors.dart';
import 'appname_and_menubutton.dart';
import 'menu_bar_widget.dart';


class HomeViewHeaderCard extends StatefulWidget {
  const HomeViewHeaderCard({
    super.key,
    required this.name,
  });
  final String name;

  @override
  State<HomeViewHeaderCard> createState() => _HomeViewHeaderCardState();
}

class _HomeViewHeaderCardState extends State<HomeViewHeaderCard> {
  bool isMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.all(10.sp),
      margin:  EdgeInsets.symmetric(horizontal: 6.w,vertical: 8.h),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          color: AppColors.whiteColor,
          boxShadow: const [
            BoxShadow(
              color: Colors.black45,
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, 0),
            ),
          ]),
      child: Row(
        children: [
          Flexible(
            child: Column(
              children: [
                AppNameAndMenuButton(
                  onMenuPressed: () {
                    setState(() {
                      isMenuOpen = !isMenuOpen;
                    });
                  },
                ),
                const Divider(
                  thickness: 3,
                  // color: AppColors.primaryColorBlue,
                ),
                WelcomeMrWidget(
                  name: widget.name,
                )
              ],
            ),
          ),
          MenuBarWidget(isMenuOpen: isMenuOpen),
        ],
      ),
    );
  }
}
