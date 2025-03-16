import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/generated/l10n.dart';

class IAgreeCheckbox extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool?> onChanged;
  final VoidCallback? onTermsPressed;
  final String agreeText;
  final FocusNode? focusNode;

  const IAgreeCheckbox({
    Key? key,
    required this.isChecked,
    required this.onChanged,
    this.onTermsPressed,
    required this.agreeText,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: AppColors.orangeColor,
        ),
      ),
      child: Align(
        alignment: AlignmentDirectional.topStart,
        child: Row(
          children: [
            Focus(
              focusNode: focusNode,
              child: Checkbox.adaptive(
                value: isChecked,
                side: const BorderSide(color: AppColors.orangeColor),
                checkColor: AppColors.whiteColor,
                activeColor: AppColors.orangeColor,
                onChanged: onChanged,
                // focusNode: focusNode,
                focusColor: AppColors.orangeColor,
              ),
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: S.of(context).I_agree_to_the,
                    style: AppStyles.style12w400Grey(context),
                  ),
                  HelperFunctions.textButtonSpan(
                      context, onTermsPressed, agreeText)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
