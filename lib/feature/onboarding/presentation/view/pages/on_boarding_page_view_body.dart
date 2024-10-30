import 'package:flutter/material.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/feature/onboarding/data/onboarding_image.dart';
import 'package:weisro/feature/onboarding/presentation/manager/onboarding_controller.dart';
import 'package:weisro/feature/onboarding/presentation/view/pages/selected_account_type_view.dart';
import 'package:weisro/feature/onboarding/presentation/view/widgets/gallery_3d_widget.dart';
import 'package:weisro/feature/onboarding/presentation/view/widgets/page_indicator_widget.dart';

import '../../../../../core/widgets/logo_image_widget.dart';
import '../widgets/bottom_button.dart';
import 'package:weisro/feature/onboarding/data/onboarding_sentences.dart';
import 'package:weisro/core/styles/app_style.dart';

class OnBoardingPageViewBody extends StatefulWidget {
  const OnBoardingPageViewBody({super.key});

  @override
  State<OnBoardingPageViewBody> createState() => _OnBoardingPageViewBodyState();
}

class _OnBoardingPageViewBodyState extends State<OnBoardingPageViewBody>
    with SingleTickerProviderStateMixin {
  late final OnboardingController _onboardingController;

  @override
  void initState() {
    super.initState();
    _onboardingController = OnboardingController(
      vsync: this,
      itemCount: OnBoardingImage.imageList.length,
      onItemChanged: (index) {
        _onboardingController.currentIndexNotifier.value = index;
      },
      onLastIndexReached: _navigateToHomePage,
    );
  }

  @override
  void dispose() {
    _onboardingController.dispose();
    super.dispose();
  }

  void _navigateToHomePage() {
    HelperFunctions.navigateToScreen(
      context,
      (context) => const SelectedAccountTypeView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          50.kh,
          AnimatedBuilder(
            animation: _onboardingController.animationController,
            builder: (context, child) {
              return Opacity(
                opacity: _onboardingController.fadeInAnimation.value,
                child: Transform.scale(
                  scale: _onboardingController.scaleAnimation.value,
                  child: child,
                ),
              );
            },
            child: const LogoImageWidget(),
          ),
          28.kh,
          Center(
            child: ValueListenableBuilder<int>(
              valueListenable: _onboardingController.currentIndexNotifier,
              builder: (context, value, _) {
                return Padding(
                  padding: const EdgeInsetsDirectional.symmetric(horizontal: 5),
                  child: Text(
                    OnboardingSentences.onboardingSentences(context)[value],
                    style: AppStyles.style16w400Grey(context),
                    textAlign: TextAlign.center,
                  ),
                );
              },
            ),
          ),
          71.kh,
          Gallery3DWidget(
            controller: _onboardingController.gallery3DController,
            imageUrlList: OnBoardingImage.imageList,
            onItemChanged: (index) {
              _onboardingController.currentIndexNotifier.value = index;
            },
          ),
          ValueListenableBuilder<int>(
            valueListenable: _onboardingController.currentIndexNotifier,
            builder: (context, currentIndex, _) {
              return PageIndicatorWidget(
                controller: PageController(initialPage: currentIndex),
                count: OnBoardingImage.imageList.length,
              );
            },
          ),
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
            child: BottomButton(
              currentIndexNotifier: _onboardingController.currentIndexNotifier,
              onPressedOnSkip: _navigateToHomePage,
            ),
          ),
          20.kh,
        ],
      ),
    );
  }
}
