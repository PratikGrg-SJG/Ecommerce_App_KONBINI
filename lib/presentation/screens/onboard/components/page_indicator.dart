import 'package:flutter/material.dart';
import 'package:konbini/config/theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required PageController controller,
  }) : _controller = controller;

  final PageController _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: const Alignment(0, 0.4),
        child: SmoothPageIndicator(
          controller: _controller,
          count: 3,
          effect: WormEffect(
            dotHeight: 8,
            dotWidth: 8,
            activeDotColor: primaryColor,
            dotColor: secondaryColor4,
          ),
        ));
  }
}
