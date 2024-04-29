import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/text_builder.dart';
import '../../../Core/constants/app_colors.dart';
import '../../../Core/constants/app_constants.dart';
import '../../../Core/services/cache_helper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HostUrlSection extends StatelessWidget {
  HostUrlSection({
    super.key,
  });

  final TextEditingController baseUrlController =
      TextEditingController(text: AppConstants.baseUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
           TextBuilder(
            AppLocalizations.of(context)!.hostUrl,
            isHeader: true,
          ),
          const Divider(),
          CustomTextFormField(
            labelText: AppConstants.baseUrl,
            controller: baseUrlController,
            onChange: (value) {
              baseUrlController.text = value;
              SharedPref.set(key: "baseUrl", value: value);
              debugPrint(AppConstants.baseUrl);
              debugPrint('😘😘${baseUrlController.text}');
              debugPrint('😘😘😘😘${SharedPref.get(key: 'baseUrl')}');
            },
            onSubmit: (value) {
              baseUrlController.text = value;
              debugPrint('😘😘😘${baseUrlController.text}');
              debugPrint('😘${SharedPref.get(key: 'baseUrl')}');
              debugPrint(AppConstants.baseUrl);
            },
          ),
           TextBuilder(
            AppLocalizations.of(context)!.hostDesc,
            isHeader: true,
            maxLines: 2,
            fontSize: 12,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
