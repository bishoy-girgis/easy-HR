import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/config/page_route_name.dart';
import '../../../Core/constants/app_colors.dart';
import '../../../Core/widgets/custom_text_form_field.dart';
import '../../../Core/widgets/gap.dart';
import '../../../Core/widgets/text_builder.dart';
import '../../../main.dart';

class VacationsView extends StatelessWidget {
  const VacationsView({super.key});

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
                  color: Colors.white,
                ),
                child: ListView.builder(
                  // reverse: true,
                  physics: const BouncingScrollPhysics(),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: Container(
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
                          children: [
                            Row(
                              children: [
                                ImageIcon(
                                  const AssetImage("assets/images/beach.png"),
                                  color: AppColors.primaryColorGrey,
                                  size: 24.sp,
                                ),
                                const GapW(w: 4),
                                const TextBuilder("700029")
                              ],
                            ),
                            const GapH(h: 1),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextBuilder("Vacation request"),
                                GapW(w: 4),
                                TextBuilder("05-01")
                              ],
                            ),
                            const GapH(h: 3),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextBuilder("vacation type",
                                    color: Colors.black.withOpacity(0.5)),
                                const GapW(w: 22),
                                const TextBuilder(" : year")
                              ],
                            ),
                            const GapH(h: 1),
                            Row(
                              children: [
                                TextBuilder("Days count",
                                    color: Colors.black.withOpacity(0.5)),
                                const GapW(w: 26),
                                const TextBuilder(" : 3"),
                                TextBuilder(" Day/s",
                                    color: Colors.black.withOpacity(0.5)),
                              ],
                            ),
                            const GapH(h: 1),
                            Row(
                              children: [
                                TextBuilder("From   ",
                                    color: Colors.black.withOpacity(0.5)),
                                const TextBuilder("12-31"),
                                TextBuilder("   To   ",
                                    color: Colors.black.withOpacity(0.5)),
                                const TextBuilder("01-03"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
