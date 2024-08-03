import 'package:easy_hr/Core/widgets/gap.dart';
import 'package:easy_hr/Features/vacations/manager/vacation_cubit.dart';
import 'package:easy_hr/Features/vacations/manager/vacation_states.dart';
import 'package:easy_hr/Features/vacations/widgets/select_date_vacation.dart';
import 'package:easy_hr/Features/vacations/widgets/voucher_main_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Core/config/page_route_name.dart';
import '../../../Core/constants/app_colors.dart';
import '../../../Core/services/cache_helper.dart';
import '../../../Core/services/global_methods.dart';
import '../../../Core/widgets/text_builder.dart';
import '../../../main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class CreateVacation extends StatelessWidget {
  const CreateVacation({super.key});

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title:  TextBuilder(
          local.createVacation,
          isHeader: true,
          color: AppColors.whiteColor,
        ),
        leading: IconButton(
          onPressed: () {
            GlobalMethods.navigatePOP(context);
            SharedPref.remove(key: "notesVacation");
            SharedPref.remove(key: "vacationTypeID");
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          BlocConsumer<VacationCubit, VacationState>(
            listener: (context, state) {
              if (state is AddVacationSuccessState) {
                GlobalMethods.buildFlutterToast(
                    message: state.message, state: ToastStates.SUCCESS);
                navigatorKey.currentState?.pushReplacementNamed(PageRouteName.vacations);
              } else if (state is AddVacationErrorState) {
                GlobalMethods.navigatePOP(context);
                GlobalMethods.buildFlutterToast(
                    message: state.failure.message ?? "",
                    state: ToastStates.ERROR);
              }
            },
            builder: (context, state) {
              return IconButton(
                onPressed: () async {
                  // checkChoosePayer(context) && checkVoucherValue(context)
                  //     ?
                  GlobalMethods.showAlertAddressDialog(
                          context,
                          title: "Are you sure to send vacation request ?",
                          titleButton1: "yes",
                          titleButton2: "no",
                          onPressedButton1: () async {
                            GlobalMethods.navigatePOP(context);
                            await BlocProvider.of<VacationCubit>(context)
                                .addVacation();
                            SharedPref.remove(key: "notesVacation");
                            SharedPref.remove(key: "vacationTypeID");
                          },
                          onPressedButton2: () {
                            GlobalMethods.navigatePOP(context);
                          },
                        );
                      // : Container();
                },
                icon: const Icon(
                  Icons.done,
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12.sp),
          child: const SingleChildScrollView(
            child: Column(
              children: [
                VoucherMainData(),
                GapH(h: 2),
                SelectDateVacation(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
