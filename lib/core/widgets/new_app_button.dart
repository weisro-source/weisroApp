import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';

class NewAppButton extends StatelessWidget {
  const NewAppButton({
    super.key,
    this.onPressed,
    required this.title,
    this.buttonColor,
    this.borderColor,
    this.textStyle,
    this.titleColor,
  });
  final void Function()? onPressed;
  final String title;
  final Color? titleColor;
  final Color? buttonColor;
  final Color? borderColor;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        maximumSize: const Size.fromHeight(35),
        minimumSize: const Size.fromHeight(35),
        backgroundColor: buttonColor ?? AppColors.second1Color.withOpacity(0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: borderColor ?? AppColors.second1Color),
        ),
        elevation: 0,
      ),
      child: Text(
        title,
        style: textStyle ??
            AppStyles.style18w500Grey(context)
                .copyWith(color: titleColor ?? AppColors.orangeColor),
      ),
    );
  }
}
