import 'package:easy_hr/Core/config/page_route_name.dart';
import 'package:easy_hr/Features/home/pages/home_view.dart';
import 'package:easy_hr/Features/setting/pages/settings_view.dart';
import 'package:easy_hr/Features/vacations/pages/create_vacation.dart';
import 'package:easy_hr/Features/vacations/pages/vacations_view.dart';
import 'package:flutter/material.dart';
import '../../Features/login/pages/login_view.dart';
import '../../Features/profile/pages/profile_view.dart';
import '../../Features/splash/splash_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case PageRouteName.initial:
        return MaterialPageRoute<dynamic>(
            builder: (context) => const SplashView(), settings: routeSettings);
      case PageRouteName.login:
        return MaterialPageRoute(
            builder: (context) => const LoginView(), settings: routeSettings);
      case PageRouteName.home:
        return MaterialPageRoute(
            builder: (context) => const HomeView(), settings: routeSettings);
      case PageRouteName.settings:
        return MaterialPageRoute(
            builder: (context) => const SettingsView(), settings: routeSettings);
      case PageRouteName.profile:
        return MaterialPageRoute(
            builder: (context) =>  ProfileView(), settings: routeSettings);
      case PageRouteName.vacations:
        return MaterialPageRoute(
            builder: (context) =>  const VacationsView(), settings: routeSettings);
      case PageRouteName.createVacations:
        return MaterialPageRoute(
            builder: (context) =>  const CreateVacation(), settings: routeSettings);
      default:
        return MaterialPageRoute<dynamic>(
            builder: (context) => const SplashView(), settings: routeSettings);
    }
  }
}
