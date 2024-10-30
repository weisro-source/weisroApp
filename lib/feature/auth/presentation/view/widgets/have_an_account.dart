import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_style.dart';
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
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: TextButton(
              onPressed: onPressed,
              style: TextButton.styleFrom(
                padding: const EdgeInsetsDirectional.only(
                  start: 5,
                ),
                minimumSize: const Size(0, 0),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(S.of(context).Log_in,
                  style: AppStyles.style12w500Orange(context)),
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
