import 'package:easy_hr/Core/constants/app_colors.dart';
import 'package:easy_hr/Core/widgets/gap.dart';
import 'package:easy_hr/Core/widgets/text_builder.dart';
import 'package:easy_hr/Features/vacations/widgets/date_diffrence_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectDateVacation extends StatefulWidget {
  const SelectDateVacation({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SelectDateVacationState createState() => _SelectDateVacationState();
}

class _SelectDateVacationState extends State<SelectDateVacation> {
  DateTime? fromDate;
  DateTime? toDate;
  int differenceInDays = 0;

  void _onFromDateSelected(DateTime date) {
    setState(() {
      fromDate = date;
      _calculateDifference();
    });
  }

  void _onToDateSelected(DateTime date) {
    setState(() {
      toDate = date;
      _calculateDifference();
    });
  }

  void _calculateDifference() {
    if (fromDate != null && toDate != null) {
      setState(() {
        differenceInDays = toDate!.difference(fromDate!).inDays;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.whiteColor,
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              const TextBuilder("From"),
              const GapW(w: 3),
              Flexible(
                child: DateDiffrenceWidget(onDateSelected: _onFromDateSelected),
              ),
            ],
          ),
          Row(
            children: [
              const TextBuilder("To     "),
              const GapW(w: 3),
              Flexible(
                child: DateDiffrenceWidget(onDateSelected: _onToDateSelected),
              ),
            ],
          ),
          Container(),
          Container(
            margin: const EdgeInsets.all(5),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
                vertical: 8.0, horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color.fromRGBO(227, 227, 227, 1),
            ),
            child: Row(
              children: [
                const TextBuilder("Days"),
                const Spacer(),
                TextBuilder("$differenceInDays"),
                const Spacer(),
                const TextBuilder("day/s"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
