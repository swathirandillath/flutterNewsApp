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
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // Replace with actual values
    options: const FirebaseOptions(
      apiKey: "AIzaSyBhpAT0eO479_VjIat7NvQFDCzX2C32Cp0",
      appId: "1:848038666101:android:052074739011c37e60fd3c",
      messagingSenderId: "848038666101",
      projectId: "fir-4b5d1",
    ),
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
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
