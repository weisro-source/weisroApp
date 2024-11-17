import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';

class TitleSectionInHomePage extends StatelessWidget {
  const TitleSectionInHomePage(
      {super.key, required this.title, required this.iconPath});
  final String title, iconPath;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(iconPath),
        6.kw,
        Text(
          title,
          style: AppStyles.style14w400Orange(context),
        )
      ],
    );
  }
}
