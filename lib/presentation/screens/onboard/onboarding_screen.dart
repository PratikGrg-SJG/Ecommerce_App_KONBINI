import 'package:flutter/material.dart';
import 'package:konbini/data/onboard_screen_data/onboard_data.dart';
import 'package:konbini/presentation/screens/onboard/onboard_content.dart';

import 'components/page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();

  //keep track of if we're on the last page
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          onPageChanged: (index) {
            setState(() {
              onLastPage = (index == 2); //returns true if condition met
            });
          },
          controller: _controller,
          itemCount: onboardData.length,
          itemBuilder: (context, index) {
            return OnboardContent(
              image: onboardData[index].image,
              title: onboardData[index].title,
              description: onboardData[index].description,
              controller: _controller,
              onLastPage: onLastPage,
            );
          },
        ),
        PageIndicator(controller: _controller)
      ],
    );
  }
}
