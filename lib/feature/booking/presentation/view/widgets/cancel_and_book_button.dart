import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/app_button.dart';
import 'package:weisro/generated/l10n.dart';

class CancelAndBookButton extends StatelessWidget {
  const CancelAndBookButton({
    super.key,
    this.onCancelPressed,
    this.onBookPressed,
  });
  final void Function()? onCancelPressed;
  final void Function()? onBookPressed;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
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
              text: S.of(context).Book_Now,
              textStyle: AppStyles.style18w500Grey(context)
                  .copyWith(color: AppColors.orangeColor),
              onPressed: onBookPressed,
            ),
          )
        ],
      ),
    );
  }
}
