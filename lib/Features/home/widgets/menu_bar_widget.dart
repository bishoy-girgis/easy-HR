
import 'package:easy_hr/Core/config/page_route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/constants/app_colors.dart';
import '../../../Core/services/cache_helper.dart';
import '../../../Core/services/global_methods.dart';
import '../../../main.dart';


class MenuBarWidget extends StatelessWidget {
  const MenuBarWidget({
    super.key,
    required this.isMenuOpen,
  });

  final bool isMenuOpen;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: isMenuOpen ? 55.w : 0,

      duration: const Duration(milliseconds: 200),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(16),
        ),
        child: isMenuOpen
            ? Column(
                children: [
                  IconButton(
                    onPressed: () {
                      GlobalMethods.goRouterNavigateTOAndReplacement(
                        context: context,
                        router: PageRouteName.settings,
                      );
                    },
                    icon: const Icon(
                      Icons.settings,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      SharedPref.remove(
                        key: 'accessToken',
                      );
                      SharedPref.remove(
                        key: 'userName',
                      );
                      navigatorKey.currentState!.pushNamedAndRemoveUntil(
                          PageRouteName.login, (route) => false);
                    },
                    icon: const Icon(
                      Icons.logout,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ],
              )
            : null,
      ),
    );
  }
}
