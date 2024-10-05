import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/constants/app_colors.dart';
import '../../../Core/widgets/gap.dart';
import '../../../Core/widgets/text_builder.dart';
import '../manager/cubit.dart';
import '../manager/states.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AttendanceInWidget extends StatelessWidget {
  const AttendanceInWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;

    return BlocBuilder<AttendanceCubit, AttendanceState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 14.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () => AttendanceCubit.get(context).changeAttendance(),
                  child: Container(
                    height: 50.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: AttendanceCubit.get(context).attendanceIn == true
                            ? AppColors.primaryColorGrey
                            : AppColors.whiteColor,
                        border: Border.all(color: AppColors.primaryColorGrey)),
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ImageIcon(
                          const AssetImage("assets/images/in.png"),
                          color:
                              AttendanceCubit.get(context).attendanceIn == true
                                  ? AppColors.whiteColor
                                  : AppColors.blackColor,
                          size: 22.sp,
                        ),
                        TextBuilder(
                          local.attendance_in,
                          color:
                              AttendanceCubit.get(context).attendanceIn == true
                                  ? AppColors.whiteColor
                                  : AppColors.blackColor,
                        ),
                      ],
                    )),
                  ),
                ),
              ),
              const GapW(w: 2),
              Expanded(
                child: InkWell(
                  onTap: () => AttendanceCubit.get(context).changeAttendance(),
                  child: Container(
                    height: 50.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: AttendanceCubit.get(context).attendanceIn == true
                            ? AppColors.whiteColor
                            : AppColors.primaryColorGrey,
                        border: Border.all(color: AppColors.primaryColorGrey)),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ImageIcon(
                            const AssetImage("assets/images/out.png"),
                            color: AttendanceCubit.get(context).attendanceIn ==
                                    true
                                ? AppColors.blackColor
                                : AppColors.whiteColor,
                            size: 16.sp,
                          ),
                          TextBuilder(
                            local.attendance_out,
                            color: AttendanceCubit.get(context).attendanceIn ==
                                    true
                                ? AppColors.blackColor
                                : AppColors.whiteColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
