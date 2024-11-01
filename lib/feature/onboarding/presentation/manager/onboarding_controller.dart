// onboarding_controller.dart
import 'package:flutter/material.dart';
import 'package:flutter_gallery_3d/gallery3d.dart';

class OnboardingController {
  final Gallery3DController gallery3DController;
  final ValueNotifier<int> currentIndexNotifier;
  final AnimationController animationController;
  late final Animation<double> fadeInAnimation;
  late final Animation<double> scaleAnimation;

  OnboardingController({
    required TickerProvider vsync,
    required int itemCount,
    required Function(int) onItemChanged,
    required VoidCallback onLastIndexReached,
  })  : gallery3DController =
            Gallery3DController(itemCount: itemCount, autoLoop: false),
        currentIndexNotifier = ValueNotifier<int>(0),
        animationController = AnimationController(
          vsync: vsync,
          duration: const Duration(seconds: 2),
        ) {
    // Initialize fadeInAnimation and scaleAnimation in the constructor body
    fadeInAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    );

    scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut,
      ),
    );

    currentIndexNotifier.addListener(() {
      if (currentIndexNotifier.value == itemCount - 1) {
        Future.delayed(const Duration(seconds: 1))
            .then((value) => onLastIndexReached());
      }
    });

    animationController.forward();
  }

  void dispose() {
    animationController.dispose();
    currentIndexNotifier.dispose();
  }
}
