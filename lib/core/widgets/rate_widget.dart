import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';

class RateWidget extends StatelessWidget {
  const RateWidget({
    super.key,
    required this.rate,
  });
  final String rate;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          rate,
          style: AppStyles.style10w400Grey(context)
              .copyWith(color: AppColors.orangeColor),
        ),
        5.kw,
        SvgPicture.asset(IconsPath.iconsStar),
      ],
    );
  }
}
