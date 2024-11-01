import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/generated/l10n.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({
    super.key,
    this.onPressed,
  });
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        S.of(context).Forget_Password,
        style: AppStyles.style10w400Red(context),
      ),
    );
  }
}
