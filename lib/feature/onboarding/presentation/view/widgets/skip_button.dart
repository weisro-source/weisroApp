import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/generated/l10n.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key, this.onPressedOnSkip});
  final void Function()? onPressedOnSkip;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressedOnSkip,
      child: Text(
        S.of(context).Skip,
        style: AppStyles.style18w400Grey(context),
      ),
    );
  }
}
