import 'package:easy_hr/Features/financial/widgets/financial_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../Core/constants/app_colors.dart';
import '../../../Core/widgets/text_builder.dart';
import '../../profileInfo/widgets/profile_shimmer_widget.dart';
import '../manger/cubit.dart';
import '../manger/states.dart';

class FinancialView extends StatelessWidget {
  const FinancialView({super.key});


  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: TextBuilder(
          local.financialDues,
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
          create: (context) => FinancialCubit()..getFinancial(),
          child: BlocConsumer<FinancialCubit, FinancialState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is FinancialSuccessState) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(5.sp),
                      child: FinancialItem(
                        financial: state.financialDataEntity[index],
                      ),
                    );
                  },
                  itemCount: state.financialDataEntity.length,
                );
              } else if (state is FinancialErrorState) {
                debugPrint(state.failure.message);
                return Center(
                  child: TextBuilder("Sorry ${state.failure.message}"),
                );
              } else if (state is FinancialLoadingState) {
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
