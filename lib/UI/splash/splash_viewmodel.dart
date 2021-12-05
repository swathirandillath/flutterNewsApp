import 'dart:async';

import 'package:adarsh/constants/app_constants.dart';
import 'package:adarsh/services/navigation_service.dart';
import 'package:adarsh/widgets/tools/base_view_models.dart';


class SplashViewModel extends BaseViewModel {


  Timer? _timer;

  void startTimer() async {

    _timer = Timer(const Duration(seconds: 1), () {
      navigationService.pushReplacementNamed(RoutePaths.dashBoard);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
