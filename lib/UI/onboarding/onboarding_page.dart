import 'dart:io';

import 'package:NewsApp/UI/onboarding/slider_layout_view.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: onBordingBody(),
    );
  }

  Widget onBordingBody() => Container(
    height: 690,
    child: SliderLayoutView(),
  );
}