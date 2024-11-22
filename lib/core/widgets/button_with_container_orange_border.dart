import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weisro/core/styles/app_color.dart';

class ButtonWithContainerOrangeBorder extends StatelessWidget {
  const ButtonWithContainerOrangeBorder({
    super.key,
    this.onPressed,
    required this.icon,
  });
  final void Function()? onPressed;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 27,
      width: 27,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: AppColors.orangeColor),
          borderRadius: BorderRadius.circular(4),
        ),
        shadows: const [
          BoxShadow(
            color: AppColors.shadow2Color,
            blurRadius: 4,
            offset: Offset(0, 2),
            spreadRadius: 0,
          )
        ],
      ),
      child: Center(
        child: IconButton(
            onPressed: onPressed,
            icon: SvgPicture.asset(
              icon,
              colorFilter:
                  const ColorFilter.mode(AppColors.greyColor, BlendMode.srcIn),
            )),
      ),
    );
  }
}
