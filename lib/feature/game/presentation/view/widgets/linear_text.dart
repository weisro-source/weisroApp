import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/utils/constant.dart';

class LinearText extends StatelessWidget {
  const LinearText({
    super.key,
    required this.title,
    required this.textSize,
  });
  final String title;
  final double textSize;
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: [
          AppColors.textColor1, // #F8C300
          AppColors.textColor2 // #CB5000
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(bounds),
      child: Text(
        title,
        style: TextStyle(
          fontSize: textSize,
          color: AppColors.whiteColor,
          fontFamily: Constants.gameFont2Family,
        ),
      ),
    );
  }
}
