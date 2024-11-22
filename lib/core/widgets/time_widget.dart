import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';

class TimeWidget extends StatelessWidget {
  const TimeWidget({super.key, required this.time});
  final String time;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(IconsPath.iconsTime),
        4.kw,
        Text(
          time,
          style: AppStyles.style14w500Orange(context),
        )
      ],
    );
  }
}
