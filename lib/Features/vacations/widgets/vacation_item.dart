import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../Core/constants/app_colors.dart';
import '../../../Core/constants/app_constants.dart';
import '../../../Core/widgets/gap.dart';
import '../../../Core/widgets/text_builder.dart';
import '../../../Domain/entity/vacation/vacation_data_entity.dart';

class VacationItem extends StatelessWidget {
  VacationDataEntity vacation ;
   VacationItem({super.key,required this.vacation});

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: 10.h, horizontal: 12.w),
      margin: EdgeInsets.symmetric(
          horizontal: 10.w, vertical: 6.h),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black45,
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ImageIcon(
                const AssetImage(
                    "assets/images/beach.png"),
                color: AppColors.primaryColorGrey,
                size: 24.sp,
              ),
              const GapW(w: 4),
              TextBuilder(
                  vacation.vacationNumber ?? "")
            ],
          ),
          const GapH(h: 1),
          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              const TextBuilder("Vacation request"),
              const GapW(w: 4),
              TextBuilder(
                AppConstants.formatDate(
                    vacation.vacationDate ??
                        "1990-10-01T00:00:00"),
              )
            ],
          ),
          Row(
            children: [
              const GapW(w: 4),
              TextBuilder(
                  vacation.approved
                      ? "Approved"
                      : "in review",
                  color: vacation.approved
                      ? Colors.green.withOpacity(0.7)
                      : Colors.black
                      .withOpacity(0.7)),
            ],
          ),
          const GapH(h: 2),
          Row(
            children: [
              TextBuilder("vacation type",
                  color:
                  Colors.black.withOpacity(0.5)),
              const GapW(w: 22),
              const TextBuilder(" : year")
            ],
          ),
          const GapH(h: 1),
          Row(
            children: [
              TextBuilder("Days count",
                  color:
                  Colors.black.withOpacity(0.5)),
              const GapW(w: 27),
              TextBuilder(": ${vacation.days}"),
              const GapW(w: 1),
              TextBuilder("Day/s",
                  color:
                  Colors.black.withOpacity(0.5)),
            ],
          ),
          const GapH(h: 1),
          Row(
            children: [
              TextBuilder("From   ",
                  color:
                  Colors.black.withOpacity(0.5)),
              TextBuilder(
                AppConstants.formatDate(
                    vacation.dateFrom ??
                        "1990-10-01T00:00:00"),
              ),
              TextBuilder("   To   ",
                  color:
                  Colors.black.withOpacity(0.5)),
              TextBuilder(
                AppConstants.formatDate(
                    vacation.dateTo ??
                        "1990-10-01T00:00:00"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
