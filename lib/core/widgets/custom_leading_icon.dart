import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/app_color.dart';

class CustomLeadingIcon extends StatelessWidget {
  const CustomLeadingIcon({
    super.key,
    this.iconColor = AppColors.orangeColor,
  });
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          IconsPath.iconsNotification,
          colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
        ));
  }
}
