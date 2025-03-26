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
    this.height,
    this.width,
    this.focusNode,
    this.child,
    this.borderRadius = 20,
  });
  final void Function()? onPressed;
  final String title;
  final Color? titleColor;
  final Color? buttonColor;
  final Color? borderColor;
  final TextStyle? textStyle;
  final double? height, width;
  final FocusNode? focusNode;
  final Widget? child;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      focusNode: focusNode,
      style: ElevatedButton.styleFrom(
        maximumSize: Size.fromHeight(height ?? 35),
        minimumSize: Size.fromHeight(height ?? 35),
        backgroundColor: buttonColor ?? AppColors.second1Color.withOpacity(0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: BorderSide(color: borderColor ?? AppColors.second1Color),
        ),
        elevation: 0,
      ),
      child: child ??
          Text(
            title,
            style: textStyle ??
                AppStyles.style18w500Grey(context)
                    .copyWith(color: titleColor ?? AppColors.orangeColor),
          ),
    );
  }
}
