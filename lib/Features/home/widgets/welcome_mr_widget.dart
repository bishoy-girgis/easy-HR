import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/widgets/text_builder.dart';
import '../../../Core/constants/app_colors.dart';

class WelcomeMrWidget extends StatelessWidget {
  const WelcomeMrWidget({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextBuilder(
          "${AppLocalizations.of(context)!.welcome} ...",
          color: AppColors.secondColorBlue,
          fontSize: 17,
          isHeader: true,
        ),
        TextBuilder(
          name,
          isHeader: true,
          color: Colors.blueGrey,
          fontSize: 19,
          textAlign: TextAlign.end,
        ),
      ],
    );
  }
}
