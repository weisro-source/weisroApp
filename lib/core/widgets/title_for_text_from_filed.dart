import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_style.dart';

class TitleForTextFromFiled extends StatelessWidget {
  const TitleForTextFromFiled({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topStart,
      child: Text(title,
          textAlign: TextAlign.center,
          style: AppStyles.style12w400Black(context)),
    );
  }
}
