import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:weisro/core/styles/app_color.dart';

class PageIndicatorWidget extends StatelessWidget {
  final PageController controller;
  final int count;

  const PageIndicatorWidget({
    Key? key,
    required this.controller,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: count,
      effect: const WormEffect(
        dotHeight: 10,
        dotWidth: 10,
        spacing: 8,
        activeDotColor: AppColors.orangeColor,
        dotColor: AppColors.second1Color,
      ),
    );
  }
}
