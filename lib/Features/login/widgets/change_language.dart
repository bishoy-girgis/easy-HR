import 'package:easy_hr/Core/widgets/text_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../Core/constants/app_colors.dart';
import '../../../Core/services/localization_provider.dart';

class ChangeLanguagesSection extends StatelessWidget {
  const ChangeLanguagesSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 8.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.whiteColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
                Provider.of<LanguageProvider>(context, listen: false)
                    .setLocale('en');
              },
              child: TextBuilder(
                AppLocalizations.of(context)!.enLanguage,
                color: AppColors.blackColor,
                fontSize: 10,
              ),
            ),
            Container(
              padding: EdgeInsets.all(4.sp),
              margin: EdgeInsets.all(5.sp),
              height: 16.h,
              width: 1.w,
              color: AppColors.primaryColorGrey,
            ),
            InkWell(
              onTap: () {
                Provider.of<LanguageProvider>(context, listen: false)
                    .setLocale('ar');
              },
              child: TextBuilder(
                AppLocalizations.of(context)!.arLanguage,
                color: AppColors.blackColor,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
