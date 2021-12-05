import 'package:NewsApp/UI/dashBoard/dash_board_view.dart';

import '/constants/app_constants.dart';
import '/ui/splash/splash_view.dart';
import 'package:flutter/material.dart';

class PageRouter {
  static Route<Object> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.splash:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case RoutePaths.dashBoard:
        return MaterialPageRoute(builder: (_) => const DashBoardView());

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

