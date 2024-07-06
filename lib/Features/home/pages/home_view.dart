import 'package:easy_hr/Core/config/page_route_name.dart';
import 'package:easy_hr/Core/extentions/extentions.dart';
import 'package:easy_hr/main.dart';
import 'package:flutter/material.dart';
import '../../../Core/constants/app_constants.dart';
import '../../../Core/widgets/gap.dart';
import '../../login/widgets/change_language.dart';
import '../widgets/category_widget.dart';
import '../widgets/home_header_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeViewHeaderCard(name: AppConstants.userName),
                const GapH(h: 1),
                CategoryWidget(
                  onTap: () {
                    navigatorKey.currentState?.pushNamed(PageRouteName.profile);
                  },
                  categoryName: local!.profile,
                  image: true,
                  imageIcon: const AssetImage("assets/images/contact-info.png"),
                ),
                CategoryWidget(
                  onTap: () {
                    navigatorKey.currentState?.pushNamed(PageRouteName.vacations);
                  },
                  categoryName: local.vacations,
                  image: true,
                  imageIcon: const AssetImage("assets/images/beach.png"),
                ),
                CategoryWidget(
                  categoryName: local.loans,
                  image: true,
                  imageIcon: const AssetImage("assets/images/loan.png"),
                ),
                CategoryWidget(
                  categoryName: local.financialDues,
                  image: true,
                  imageIcon: const AssetImage("assets/images/recipient.png"),
                ),
                CategoryWidget(
                  categoryName: local.salaries,
                  image: true,
                  imageIcon: const AssetImage("assets/images/salary.png"),
                ),
                CategoryWidget(
                  categoryName: local.attendance,
                  image: true,
                  imageIcon:
                      const AssetImage("assets/images/attendance-list.png"),
                ),
                const GapH(h: 2),
                const ChangeLanguagesSection(),
              ],
            ).setOnlyVerticalPadding(context, bottom: 0.02),
          ),
        ),
      ),
    );
  }
}
