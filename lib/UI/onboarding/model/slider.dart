import 'package:NewsApp/util/constants.dart';

class Slider {
  final String sliderImageUrl;
  final String sliderHeading;
  final String sliderSubHeading;

  Slider(
      {required this.sliderImageUrl,
      required this.sliderHeading,
      required this.sliderSubHeading});
}

final sliderArrayList = [
    Slider(
        sliderImageUrl: 'assets/images/onBoarding_01.png',
        sliderHeading: Constants.SLIDER_HEADING_1,
        sliderSubHeading: Constants.SLIDER_DESC),
    Slider(
        sliderImageUrl: 'assets/images/onBoarding_02.png',
        sliderHeading: Constants.SLIDER_HEADING_2,
        sliderSubHeading: Constants.SLIDER_DESC),
    Slider(
        sliderImageUrl: 'assets/images/onBoarding_01.png',
        sliderHeading: Constants.SLIDER_HEADING_3,
        sliderSubHeading: Constants.SLIDER_DESC),
  ];
