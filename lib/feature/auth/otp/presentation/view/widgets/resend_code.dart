import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/generated/l10n.dart';

class ResendCode extends StatelessWidget {
  const ResendCode({
    super.key,
    this.onTapResend,
  });
  final void Function()? onTapResend;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(TextSpan(children: [
        TextSpan(
            text: S.of(context).Code_not_received,
            style: AppStyles.style12w400Grey(context)),
        HelperFunctions.textButtonSpan(
            context, onTapResend, S.of(context).Resend)
      ])),
    );
  }
}
