import 'package:easy_hr/Core/constants/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:easy_hr/Core/widgets/text_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class ClockWidget extends StatelessWidget {
  const ClockWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;

    return StreamBuilder(
      stream: Stream.periodic(const Duration(seconds: 1)),
      builder: (context, snapshot) {
        return Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: AppColors.blackColor, width: 6)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextBuilder(
                  "${local.date}  ${DateFormat("  dd/MM/yyyy").format(DateTime.now())} ",
                  color: AppColors.primaryColorGrey,
                  isHeader: true,
                  fontSize: 18,
                ),
                TextBuilder(
                  "${local.time}  ${DateFormat("  hh:mm:ss").format(DateTime.now())} ",
                  color: AppColors.primaryColorGrey,
                  isHeader: true,
                  fontSize: 18,
                ),
              ],
            ));
      },
    );
  }
}
