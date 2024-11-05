import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/helper_functions.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.buttonColor,
    this.child,
    this.text,
    this.onPressed,
    this.height,
    this.width,
    this.borderColor,
    this.textStyle,
  });

  final Color? buttonColor;
  final Color? borderColor;
  final Widget? child;
  final String? text;
  final VoidCallback? onPressed;
  final double? height;
  final double? width;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? HelperFunctions.getScreenWidth(context),
      height: height ?? 32,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor ?? AppColors.orangeColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(
                color: borderColor ?? buttonColor ?? AppColors.orangeColor),
            borderRadius: BorderRadius.circular(4),
          ),
          elevation: 6,
        ),
        onPressed: onPressed,
        child: child ??
            Center(
              child: Text(
                text ?? "",
                style: textStyle ?? AppStyles.style14w500White(context),
              ),
            ),
      ),
    );
  }
}
