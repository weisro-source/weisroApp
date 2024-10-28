import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_style.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key, this.onPressedOnSkip});
  final void Function()? onPressedOnSkip;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressedOnSkip,
      child: Text(
        "Skip",
        style: AppStyles.style18w400Grey(context),
      ),
    );
  }
}
