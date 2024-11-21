import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/app_color.dart';

class CustomFlitterButton extends StatelessWidget {
  const CustomFlitterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.second1Color,
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          border: Border.all(width: 0.5, color: AppColors.orangeColor)),
      child: Center(
        child: IconButton(
            onPressed: () {},
            padding: EdgeInsetsDirectional.zero,
            icon: SvgPicture.asset(IconsPath.iconsFilter)),
      ),
    );
  }
}
