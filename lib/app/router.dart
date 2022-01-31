import 'package:NewsApp/UI/dashBoard/dash_board_view.dart';
import 'package:NewsApp/UI/login/login.dart';
import 'package:NewsApp/UI/my_home/my_home.dart';

import '/constants/app_constants.dart';
import '/ui/splash/splash_view.dart';
import 'package:flutter/material.dart';

class PageRouter {
  static Route<Object> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.splash:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case RoutePaths.dashBoard:
        return MaterialPageRoute(builder: (_) =>  DashBoardView());
      case RoutePaths.login:
        return MaterialPageRoute(builder: (_) =>  LogIn());
      case RoutePaths.home:
        return MaterialPageRoute(builder: (_) => const MyHome());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for page ${settings.name}'),
            ),
          ),
        );
    }
  }
}


