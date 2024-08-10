import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:easy_hr/Core/widgets/gap.dart';
import 'package:easy_hr/Core/widgets/text_builder.dart';
import 'package:easy_hr/Features/vacations/manager/vacation_cubit.dart';
import 'package:easy_hr/Features/vacations/widgets/date_diffrence_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Core/services/cache_helper.dart';
import '../../../Core/widgets/custom_text_form_field.dart';

class SelectDateVacation extends StatefulWidget {
  const SelectDateVacation({super.key});

  @override
  _SelectDateVacationState createState() => _SelectDateVacationState();
}

class _SelectDateVacationState extends State<SelectDateVacation> {
  DateTime? fromDate = DateTime.now();
  DateTime? toDate = DateTime.now();
  int differenceInDays = 1;
  TextEditingController notes = TextEditingController();
  DateTime initialFromDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    initialFromDate = fromDate!;
  }

  void _onFromDateSelected(DateTime date) {
    setState(() {
      fromDate = date;
      _calculateDifference();
      context.read<VacationCubit>().setFromDate(date);
    });
  }

  void _onToDateSelected(DateTime date) {
    setState(() {
      toDate = date;
      _calculateDifference();
      context.read<VacationCubit>().setToDate(date);
    });
  }

  void _calculateDifference() {
    if (fromDate != null && toDate != null) {
      setState(() {
        if (fromDate == initialFromDate) {
          differenceInDays = toDate!.difference(fromDate!).inDays + 2;
        } else {
          differenceInDays = toDate!.difference(fromDate!).inDays + 1;
        }
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    return Container(
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color.fromRGBO(227, 227, 227, 1),
            ),
            child: Row(
              children: [
                 TextBuilder(local.from,),
                const GapW(w: 3),
                Flexible(
                  child: DateDiffrenceWidget(onDateSelected: _onFromDateSelected),
                ),
              ],
            ),
          ),
          const GapH(h: 1),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color.fromRGBO(227, 227, 227, 1),
            ),
            child: Row(
              children: [
                 TextBuilder(local.to),
                const GapW(w: 3),
                Flexible(
                  child: DateDiffrenceWidget(onDateSelected: _onToDateSelected),
                ),
              ],
            ),
          ),
          const GapH(h: 1),
          Container(
            margin: const EdgeInsets.all(5),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color.fromRGBO(227, 227, 227, 1),
            ),
            child: Row(
              children: [
                 TextBuilder(local.daysBalance),
                const Spacer(),
                TextBuilder("$differenceInDays"),
                const Spacer(),
                 TextBuilder(local.dayss),
              ],
            ),
          ),
          const GapH(h: 1),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextBuilder(
                AppLocalizations.of(context)!.notes,
                isHeader: true,
              ),
              const GapW(w: 2),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                  ),
                  child: CustomTextFormField(
                    controller: notes,
                    labelText: AppLocalizations.of(context)!.notes,
                    maxLines: 3,
                    onChange: (value) {
                      notes.text = value;
                      SharedPref.set(key: "notesVacation", value: value);
                      debugPrint('sharedddd NOTES ' +
                          SharedPref.get(key: 'notesVacation'));
                      setState(() {});
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
