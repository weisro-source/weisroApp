import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/generated/l10n.dart';

class OrTextWidget extends StatelessWidget {
  const OrTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        S.of(context).OR,
        style: AppStyles.style14w400Grey(context)
            .copyWith(color: AppColors.second2Color),
      ),
    );
  }
}
