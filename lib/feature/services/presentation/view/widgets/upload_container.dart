import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/utils/helper_functions.dart';

class UploadContainer extends StatelessWidget {
  const UploadContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      margin: HelperFunctions.symmetricHorizontalPadding24,
      decoration: const BoxDecoration(
          color: AppColors.second1Color,
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Center(
        child: SvgPicture.asset(IconsPath.iconsPhotoUpload),
      ),
    );
  }
}
