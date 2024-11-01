import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/generated/l10n.dart';

class CodeSendSuccessTextWidget extends StatelessWidget {
  const CodeSendSuccessTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
              text: "${S.of(context).The_Code_Has_Been} ",
              style: AppStyles.style18w500Grey(context)),
          TextSpan(
            text: S.of(context).Successfully,
            style: AppStyles.style18w500Green(context),
          ),
          TextSpan(
              text: " ${S.of(context).Verified}",
              style: AppStyles.style18w500Grey(context)),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
