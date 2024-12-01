import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';

class NoDataScreen extends StatelessWidget {
  const NoDataScreen(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.subTitle});
  final String imagePath, title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
        32.kh,
        Text(
          title,
          style: AppStyles.style24w400Orange(context),
        ),
        Text(
          subTitle,
          style: AppStyles.style18w400Grey(context)
              .copyWith(color: AppColors.lightgreyColor),
        ),
      ],
    );
  }
}
