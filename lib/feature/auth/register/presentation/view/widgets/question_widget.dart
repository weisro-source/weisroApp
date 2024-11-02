import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weisro/core/styles/app_style.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget(
      {super.key, required this.icon, required this.questionText});
  final String icon;
  final String questionText;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(icon),
        Text(
          questionText,
          style: AppStyles.style12w500Grey(context),
        )
      ],
    );
  }
}
