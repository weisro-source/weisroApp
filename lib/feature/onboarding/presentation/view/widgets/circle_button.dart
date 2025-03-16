import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/feature/onboarding/presentation/view/widgets/circle_indicator_painter.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({
    super.key,
    required this.value,
    this.onTap,
  });
  final double value;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CircleIndicatorPainter(value),
      child: GestureDetector(
        onTap: onTap,
        child: Center(
          child: Container(
            width: 32,
            height: 32,
            decoration: const ShapeDecoration(
              shape: OvalBorder(),
              color: AppColors.orangeColor,
            ),
            child: Center(
              child: SvgPicture.asset(IconsPath.iconsArrowLeft),
            ),
          ),
        ),
      ),
    );
  }
}
