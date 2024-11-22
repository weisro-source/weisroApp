import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_color.dart';

class CustomDashedLine extends StatelessWidget {
  const CustomDashedLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        30,
        (index) => Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Container(
              color: AppColors.second2Color,
              height: 2,
            ),
          ),
        ),
      ),
    );
  }
}
