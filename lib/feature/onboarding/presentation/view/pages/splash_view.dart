import 'package:flutter/material.dart';
import 'package:weisro/core/assets_path/image_path.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/feature/onboarding/presentation/view/pages/onboarding_page_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  double _opacity = 0.0; // Initial opacity for animation

  @override
  void initState() {
    super.initState();

    // Start the fade-in animation
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _opacity = 1.0;
      });
    });

    Future.delayed(const Duration(seconds: 2), () {
      Future.delayed(const Duration(seconds: 2), () {
        if (!mounted) {
          return;
        }
        HelperFunctions.navigateToScreen(
          context,
          (context) => const OnBoardingPageView(),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeIn,
          opacity: _opacity,
          child: Image.asset(ImagePath.imagesLogo),
        ),
      ),
    );
  }
}
