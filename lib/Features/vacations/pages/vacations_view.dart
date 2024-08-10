import 'package:easy_hr/Domain/entity/vacation/vacation_data_entity.dart';
import 'package:easy_hr/Features/vacations/manager/vacation_cubit.dart';
import 'package:easy_hr/Features/vacations/manager/vacation_states.dart';
import 'package:easy_hr/Features/vacations/widgets/vacation_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../Core/config/page_route_name.dart';
import '../../../Core/constants/app_colors.dart';
import '../../../Core/widgets/custom_text_form_field.dart';
import '../../../Core/widgets/gap.dart';
import '../../../Core/widgets/text_builder.dart';
import '../../../main.dart';
import '../../profileInfo/widgets/profile_shimmer_widget.dart';

class VacationsView extends StatefulWidget {
  const VacationsView({super.key});

  @override
  State<VacationsView> createState() => _VacationsViewState();
}

class _VacationsViewState extends State<VacationsView> {
  List<VacationDataEntity> vacations = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColorGrey,
        onPressed: () {
          navigatorKey.currentState?.pushNamed(PageRouteName.createVacations);
        },
        elevation: 10,
        child: const Icon(Icons.add, color: AppColors.whiteColor),
      ),
      appBar: AppBar(
        title: TextBuilder(
          AppLocalizations.of(context)!.vacations.toLowerCase(),
          isHeader: true,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            CustomTextFormField(
              labelText: AppLocalizations.of(context)!.search,
              hintText: AppLocalizations.of(context)!.search,
              suffixIcon: Icons.search,
              backgroundOfTextFeild: Colors.white,
              onChange: (v) {},
            ),
            const GapH(h: 1),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.whiteColor,
                ),
                child: BlocProvider<VacationCubit>(
                  create: (context) => VacationCubit()..getVacations(),
                  child: BlocConsumer<VacationCubit, VacationState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      var cubit = VacationCubit.get(context);
                      vacations = cubit.vacations;
                      if (state is VacationSuccessState) {
                        return ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          itemCount: vacations.length,
                          itemBuilder: (context, index) {
                            var vacation = vacations[index];
                            return VacationItem(vacation: vacation);
                          },
                        );
                      } else if (state is VacationErrorState) {
                        debugPrint(state.failure.message);
                        return Center(
                          child: TextBuilder("Sorry ${state.failure.message}"),
                        );
                      } else if (state is VacationLoadingState) {
                        return ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return const ProfileShimmerWidget();
                          },
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
