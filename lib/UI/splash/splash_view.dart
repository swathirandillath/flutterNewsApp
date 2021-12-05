import 'package:adarsh/widgets/tools/view_model_builder.dart';

import 'package:flutter/material.dart';

import 'splash_viewmodel.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
      onModelReady: (model) => model.startTimer(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Image.asset(
            'assets/images/news_logo.png',
            width: 250,
            height: 250,
          ),
        ),
      ),
      viewModelBuilder: () => SplashViewModel(),
    );
  }
}
