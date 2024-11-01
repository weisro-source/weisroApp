import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/generated/l10n.dart';

class HaveAnAccount extends StatelessWidget {
  const HaveAnAccount({
    super.key,
    this.onPressed,
  });
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
              text: S.of(context).Have_Account,
              style: AppStyles.style12w400Grey(context)),
          HelperFunctions.textButtonSpan(
              context, onPressed, S.of(context).Log_in)
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
