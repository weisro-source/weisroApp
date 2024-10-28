import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_color.dart';

import 'on_boarding_page_view_body.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: OnBoardingPageViewBody(),
    );
  }
}
