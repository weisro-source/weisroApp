import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/helper_functions.dart';

class HaveAnAccount extends StatelessWidget {
  const HaveAnAccount({
    super.key,
    this.onPressed,
    required this.title,
    required this.buttonTitle,
  });
  final void Function()? onPressed;
  final String title, buttonTitle;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: title, style: AppStyles.style12w400Grey(context)),
          HelperFunctions.textButtonSpan(context, onPressed, buttonTitle)
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
