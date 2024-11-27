import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:weisro/core/styles/app_color.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.newtonCradle(
        color: AppColors.orangeColor,
        size: 200,
      ),
    );
  }
}
