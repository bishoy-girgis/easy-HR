import 'package:easy_hr/Features/salaries/manager/cubit.dart';
import 'package:easy_hr/Features/salaries/widgets/salary_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../Core/constants/app_colors.dart';
import '../../../Core/widgets/text_builder.dart';
import '../../profileInfo/widgets/profile_shimmer_widget.dart';
import '../manager/states.dart';

class SalaryView extends StatelessWidget {
  const SalaryView({super.key});

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title:  TextBuilder(
          local.salary,
          color: AppColors.whiteColor,
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(10.sp),
        margin: EdgeInsets.all(12.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: AppColors.whiteColor,
        ),
        child: BlocProvider(
          create: (context) => SalaryCubit()..getSalary(),
          child: BlocConsumer<SalaryCubit, SalaryState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is SalarySuccessState) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(5.sp),
                      child: SalaryWidget(
                        salary: state.salaryDataEntity[index],
                      ),
                    );
                  },
                  itemCount: state.salaryDataEntity.length,
                );
              } else if (state is SalaryErrorState) {
                debugPrint(state.failure.message);
                return Center(
                  child: TextBuilder("Sorry ${state.failure.message}"),
                );
              } else if (state is SalaryLoadingState) {
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const ProfileShimmerWidget();
                  },
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
