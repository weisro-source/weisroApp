import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:weisro/core/styles/app_color.dart';

class CustomLoading extends StatelessWidget {
  final String animationType;
  final Color color;
  final double size;

  const CustomLoading({
    Key? key,
    this.animationType = 'newtonCradle',
    this.color = AppColors.orangeColor,
    this.size = 200.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use a switch case to select the appropriate animation
    Widget loadingWidget;
    switch (animationType) {
      case 'discreteCircular':
        loadingWidget = LoadingAnimationWidget.discreteCircle(
          color: color,
          size: size,
        );
        break;
      case 'staggeredDotsWave':
        loadingWidget = LoadingAnimationWidget.staggeredDotsWave(
          color: color,
          size: size,
        );
        break;
      case 'newtonCradle':
        loadingWidget = LoadingAnimationWidget.newtonCradle(
          color: color,
          size: size,
        );
        break;

      default:
        loadingWidget = LoadingAnimationWidget.newtonCradle(
          color: color,
          size: size,
        );
        break;
    }

    return Center(child: loadingWidget);
  }
}
