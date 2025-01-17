import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_color.dart';

class StyleFunctions {
  StyleFunctions._();
  static BoxDecoration searchContainerDecoration() {
    return const BoxDecoration(boxShadow: [
      BoxShadow(
        color: AppColors.shadow3Color,
        blurRadius: 4,
        offset: Offset(0, -1),
        spreadRadius: 0,
      )
    ]);
  }

  static BoxDecoration flitterContainerDecoration() {
    return BoxDecoration(
      color: AppColors.second1Color,
      border: Border.all(color: AppColors.second2Color, width: 1),
      borderRadius: BorderRadiusDirectional.circular(4),
    );
  }

  static ShapeDecoration decorationRadius8Orange(
      [Color containerColor = AppColors.whiteColor]) {
    return ShapeDecoration(
      color: containerColor,
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 1, color: AppColors.orangeColor),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
