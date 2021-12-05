import 'dart:async';

import 'package:NewsApp/constants/app_constants.dart';
import 'package:NewsApp/services/navigation_service.dart';
import 'package:NewsApp/widgets/tools/base_view_models.dart';


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
