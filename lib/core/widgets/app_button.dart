import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.buttonColor,
    this.child,
    this.text,
    this.onPressed,
  });

  final Color? buttonColor;
  final Widget? child;
  final String? text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 342,
      height: 32,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:
              buttonColor ?? AppColors.orangeColor, // Background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          elevation: 6, // Similar to the shadow's blur radius
          shadowColor: AppColors.shadowColor, // Shadow color
        ),
        onPressed: onPressed, // Button action
        child: child ??
            Center(
              child: Text(
                text ?? "",
                style: AppStyles.style14w500White(context),
              ),
            ),
      ),
    );
  }
}
