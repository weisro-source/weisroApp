import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/utils/helper_functions.dart';

class CustomLeadingIcon extends StatelessWidget {
  const CustomLeadingIcon({
    super.key,
    this.iconColor = AppColors.orangeColor,
    this.onPressed,
  });
  final Color iconColor;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          HelperFunctions.navigateToBack(context);
          onPressed;
        },
        icon: SvgPicture.asset(
          IconsPath.iconsArrowRight,
          colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
        ));
  }
}
