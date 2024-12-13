import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/app_button.dart';
import 'package:weisro/generated/l10n.dart';

class CancelAndButton extends StatelessWidget {
  const CancelAndButton({
    super.key,
    this.onCancelPressed,
    this.onBookPressed,
    required this.secondButton,
  });
  final void Function()? onCancelPressed;
  final void Function()? onBookPressed;
  final String secondButton;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: AppButton(
            borderColor: AppColors.redColor,
            buttonColor: AppColors.redColor,
            text: S.of(context).Cancel,
            onPressed: onCancelPressed,
          ),
        ),
        10.kw,
        Expanded(
          child: AppButton(
            borderColor: AppColors.orangeColor,
            buttonColor: AppColors.whiteColor,
            text: secondButton,
            textStyle: AppStyles.style18w500Grey(context)
                .copyWith(color: AppColors.orangeColor),
            onPressed: onBookPressed,
          ),
        )
      ],
    );
  }
}
