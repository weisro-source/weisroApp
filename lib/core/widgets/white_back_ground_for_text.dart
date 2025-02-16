import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';

class WhiteBackGroundForText extends StatelessWidget {
  const WhiteBackGroundForText({
    super.key,
    required this.text,
  });

  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 23,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.orangeWithOpacity),
      child: Center(
        child: Text(
          text,
          style: AppStyles.style8w600Orange(context),
        ),
      ),
    );
  }
}
