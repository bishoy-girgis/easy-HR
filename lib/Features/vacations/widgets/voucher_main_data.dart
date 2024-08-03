import 'package:easy_hr/Features/vacations/manager/vacation_cubit.dart';
import 'package:easy_hr/Features/vacations/manager/vacation_states.dart';
import 'package:easy_hr/Features/vacations/widgets/pick_date_widget.dart';
import 'package:easy_hr/Features/vacations/widgets/vacation_type_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Core/constants/app_colors.dart';
import '../../../Core/widgets/custom_text_form_field.dart';
import '../../../Core/widgets/gap.dart';
import '../../../Core/widgets/text_builder.dart';

class VoucherMainData extends StatelessWidget {
  const VoucherMainData({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              blurRadius: 5,
            )
          ]),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextBuilder(
            "Voucher no",
            isHeader: true,
          ),
          const CustomTextFormField(
            labelText: "AUTO",
            centerContent: true,
            isLabelBold: true,
            isClickable: false,
          ),
          const GapH(h: 1),
          const TextBuilder(
            "Vacation request Date",
            isHeader: true,
          ),
          const Row(
            children: [
              Flexible(child: DatePickerWidget()),
              GapW(w: 1),
              Flexible(child: HoursAndMinutes()),
            ],
          ),
          const GapH(h: 1),

          BlocProvider(
            create: (context) => VacationCubit()..getVacationTypes(),
            child: BlocBuilder<VacationCubit,VacationState>(
              builder: (context, state) {
                var cubit = VacationCubit.get(context);
                return VacationTypeWidget(vacationTypes: cubit.vacationTypes);

            },),
          )
        ],
      ),
    );
  }
}