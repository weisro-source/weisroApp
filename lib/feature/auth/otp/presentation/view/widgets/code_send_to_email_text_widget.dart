import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/generated/l10n.dart';

class CodeSendToEmailTextWidget extends StatelessWidget {
  const CodeSendToEmailTextWidget({
    super.key,
    required this.email,
  });
  final String email;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
        textAlign: TextAlign.center,
        TextSpan(children: [
          TextSpan(
              text: S.of(context).Code_sent_to_email,
              style: AppStyles.style12w400Grey(context)),
          TextSpan(
              text: "  $email ", style: AppStyles.style12w400Orange(context)),
          TextSpan(
              text: "Enter the code",
              style: AppStyles.style12w400Grey(context)),
        ]));
  }
}
