import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/feature/auth/register/presentation/view/widgets/question_widget.dart';

class OneInformation extends StatelessWidget {
  const OneInformation({
    super.key,
    required this.icon,
    required this.text,
    required this.info,
  });
  final String icon, text, info;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: QuestionWidget(icon: icon, questionText: "$text : "),
        ),
        const Spacer(),
        Text(
          info,
          style: AppStyles.style14w500Orange(context),
        )
      ],
    );
  }
}
