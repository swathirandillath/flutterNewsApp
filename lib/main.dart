import 'package:NewsApp/services/navigation_service.dart';
import 'package:NewsApp/widgets/tools/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'app/provider.dart';
import 'app/router.dart';
import 'constants/app_colors.dart';
import 'constants/app_constants.dart';
import 'constants/app_strings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: () => MultiProvider(
        providers: providers,
        child: MaterialApp(
          title: AppStrings.appName,
          theme: ThemeData(
            primarySwatch: generateMaterialColor(Palette.primary),
            primaryColor: Palette.primary,
            fontFamily: FontFamily.Barlow,
          ),
          builder: (context, child) {
            ScreenSize.init(context);
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.1),
              child: child!,
            );
          },
          initialRoute: RoutePaths.splash,
          onGenerateRoute: PageRouter.generateRoute,
          navigatorKey: NavigationService.navigationKey,
        ),
      ),
    );
  }
}
