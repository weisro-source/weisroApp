import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';

class TitleFiledEditAccount extends StatelessWidget {
  const TitleFiledEditAccount({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(IconsPath.iconsEdit),
        12.kw,
        Text(
          title,
          style: AppStyles.style16w400Grey(context)
              .copyWith(color: AppColors.darkOrangeColor),
        )
      ],
    );
  }
}
