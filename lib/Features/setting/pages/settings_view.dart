import 'package:easy_hr/Core/config/page_route_name.dart';
import 'package:flutter/material.dart';
import '../../../Core/constants/app_constants.dart';
import '../../../Core/services/cache_helper.dart';
import '../../../Core/widgets/text_builder.dart';
import '../../../main.dart';
import '../widgets/host_url_section.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  TextBuilder(
          AppLocalizations.of(context)!.settings,
          color: Colors.white,
          isHeader: true,
        ),
        actions: [
          IconButton(
            onPressed: () {
              AppConstants.updateSettingValues();
              debugPrint(AppConstants.baseUrl);
              SharedPref.remove(key: "accessToken");
              navigatorKey.currentState!.pushNamedAndRemoveUntil(
                  PageRouteName.login, (route) => false);
            },
            icon: const Icon(Icons.done),
          )
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: HostUrlSection(),
          ),
        ),
      ),
    );
  }
}
