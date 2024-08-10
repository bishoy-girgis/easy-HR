import 'package:easy_hr/Domain/entity/vacation/vacation_type_entity.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../Core/constants/app_colors.dart';
import '../../../Core/services/cache_helper.dart';
import '../../../Core/widgets/text_builder.dart';

class VacationTypeWidget extends StatelessWidget {
  VacationTypeWidget({
    super.key,
    required this.vacationTypes,
  });

  final List<VacationTypeEntity> vacationTypes;

  final TextEditingController _controller = TextEditingController();
  double price = 0;

  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Flexible(
          child: DropdownSearch<VacationTypeEntity>(
            items: vacationTypes,
            itemAsString: (VacationTypeEntity vacationType) =>
                vacationType.vacationTypeName ??
                vacationType.vacationTypeEName ??
                "",
            popupProps: PopupProps.dialog(
              fit: FlexFit.loose, // << change this
              itemBuilder: (context, item, isSelected) {
                return Container(
                    padding: const EdgeInsets.all(10),
                    // alignment: Alignment.center,
                    child: TextBuilder(
                      item.vacationTypeName ?? item.vacationTypeEName ?? "",
                      textAlign: TextAlign.center,
                      color: isSelected
                          ? AppColors.secondColorBlue
                          : AppColors.primaryColorGrey,
                    ));
              },
            ),
            dropdownButtonProps: const DropdownButtonProps(
              color: AppColors.secondColorBlue,
            ),

            dropdownDecoratorProps: DropDownDecoratorProps(
              textAlign: TextAlign.center,
              baseStyle: TextStyle(
                fontFamily: 'Cairo',
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
              textAlignVertical: TextAlignVertical.center,
              dropdownSearchDecoration: InputDecoration(
                  label:  TextBuilder(
                    local.vacationTypes,
                    fontSize: 14,
                    maxLines: 2,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  )),
            ),
            onChanged: (VacationTypeEntity? data) {
              SharedPref.set(
                  key: "vacationTypeID", value: data?.vacationTypeId ?? 0);
              debugPrint("${SharedPref.get(key: "vacationTypeID")}");
            },
            // selectedItem: itemSelected,
          ),
        ),
      ],
    );
  }
}
