import 'package:flutter/material.dart';
import 'package:flutter_gallery_3d/gallery3d.dart';

import 'package:weisro/core/assets_path/image_path.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/feature/onboarding/data/onboarding_sentences.dart';
import 'package:weisro/feature/onboarding/presentation/view/pages/selected_account_type_view.dart';
import 'package:weisro/feature/onboarding/presentation/view/widgets/gallery_3d_widget.dart';
import 'package:weisro/feature/onboarding/presentation/view/widgets/page_indicator_widget.dart';

import '../../../../../core/widgets/logo_image_widget.dart';
import '../widgets/bottom_button.dart';

class OnBoardingPageViewBody extends StatefulWidget {
  const OnBoardingPageViewBody({super.key});

  @override
  State<OnBoardingPageViewBody> createState() => _OnBoardingPageViewBodyState();
}

class _OnBoardingPageViewBodyState extends State<OnBoardingPageViewBody>
    with SingleTickerProviderStateMixin {
  final List<String> imageUrlList = [
    ImagePath.imagesOnboardingImage1,
    ImagePath.imagesOnboardingImage2,
    ImagePath.imagesOnboardingImage3,
  ];

  late final Gallery3DController _gallery3DController;
  final ValueNotifier<int> currentIndexNotifier = ValueNotifier<int>(0);

  late final AnimationController _animationController;
  late final Animation<double> _fadeInAnimation;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _gallery3DController =
        Gallery3DController(itemCount: imageUrlList.length, autoLoop: false);

    currentIndexNotifier.addListener(() {
      if (currentIndexNotifier.value == 2) {
        Future.delayed(const Duration(seconds: 1))
            .then((value) => _navigateToHomePage());
      }
    });

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeInAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    currentIndexNotifier.dispose();
    super.dispose();
  }

  void _navigateToHomePage() {
    HelperFunctions.navigateToScreen(context, const SelectedAccountTypeView());
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          104.kh,
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Opacity(
                opacity: _fadeInAnimation.value,
                child: Transform.scale(
                  scale: _scaleAnimation.value,
                  child: child,
                ),
              );
            },
            child: const LogoImageWidget(),
          ),
          28.kh,
          Center(
            child: ValueListenableBuilder<int>(
              valueListenable: currentIndexNotifier,
              builder: (context, value, _) {
                return Text(
                  OnboardingSentences.onboardingSentences(context)[value],
                  style: AppStyles.style16w400Grey(context),
                  textAlign: TextAlign.center,
                );
              },
            ),
          ),
          71.kh,
          Gallery3DWidget(
            controller: _gallery3DController,
            imageUrlList: imageUrlList,
            onItemChanged: (index) {
              currentIndexNotifier.value = index;
            },
          ),
          ValueListenableBuilder<int>(
            valueListenable: currentIndexNotifier,
            builder: (context, currentIndex, _) {
              return PageIndicatorWidget(
                controller: PageController(initialPage: currentIndex),
                count: imageUrlList.length,
              );
            },
          ),
          137.kh,
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
            child: BottomButton(
              currentIndexNotifier: currentIndexNotifier,
              onPressedOnSkip: _navigateToHomePage,
            ),
          ),
          20.kh,
        ],
      ),
    );
  }
}
