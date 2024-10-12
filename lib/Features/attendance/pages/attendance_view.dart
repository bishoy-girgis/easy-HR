import 'package:easy_hr/Core/widgets/gap.dart';
import 'package:easy_hr/Features/attendance/manager/cubit.dart';
import 'package:easy_hr/Features/attendance/manager/states.dart';
import 'package:easy_hr/Features/attendance/widgets/attendance_in_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../Core/constants/app_colors.dart';
import '../../../Core/services/global_methods.dart';
import '../../../Core/widgets/text_builder.dart';

class AttendanceView extends StatelessWidget {
  const AttendanceView({super.key});

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: TextBuilder(
          local.attendance,
          color: AppColors.whiteColor,
        ),
      ),
      body: BlocConsumer<AttendanceCubit, AttendanceState>(
          listener: (context, state) {
        if (state is LoadingOSFingerPrintState || state is AttendanceLoading) {
          EasyLoading.show();
        }else if (state is AttendanceError ) {
          EasyLoading.dismiss();
          GlobalMethods.buildFlutterToast(
              message: state.message ?? " ", state: ToastStates.ERROR);
        }else if (state is AttendanceSuccess ) {
          EasyLoading.dismiss();
          GlobalMethods.buildFlutterToast(
              message: state.message ?? " ", state: ToastStates.SUCCESS);
        } else if (state is ErrorOSFingerPrintState ) {
          EasyLoading.dismiss();
          GlobalMethods.buildFlutterToast(
              message: state.message ?? " ", state: ToastStates.ERROR);
        } else if (state is SuccessOSFingerPrintState) {
          EasyLoading.dismiss();
          AttendanceCubit.get(context).addAttendance();
        }
      }, builder: (context, state) {
        return Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.all(10.sp),
          margin: EdgeInsets.all(12.sp),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: AppColors.whiteColor,
          ),
          child: Column(
            children: [
              const AttendanceInWidget(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
              ),
              InkWell(
                onTap: () => AttendanceCubit.get(context).osFingerPrint(),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 28.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: AppColors.primaryColorGrey,
                      border: Border.all(color: AppColors.primaryColorGrey)),
                  child: ImageIcon(
                    const AssetImage("assets/images/fingerprint.png"),
                    color: AppColors.whiteColor,
                    size: 50.sp,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
