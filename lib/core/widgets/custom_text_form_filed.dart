import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled({
    super.key,
    this.controller,
    this.borderColor = AppColors.greyColor,
    this.prefixIcon,
    this.errorText,
    this.minLines,
    this.maxLines = 1,
    required this.hintText,
    this.height = 32,
    this.focusNode,
    this.keyboardType,
    this.onFieldSubmitted,
    this.suffixIcon,
    this.enabled,
    this.validator,
    this.textInputAction,
    this.maxLength,
    this.topPadding = 0,
    this.fillColor,
    this.filled,
    this.readOnly,
    this.borderRadius = 4,
    this.bottomPadding = 0,
  });

  final TextEditingController? controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? errorText;
  final String hintText;
  final Color borderColor;
  final int? maxLines;
  final int? minLines;
  final double? height;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final void Function(String)? onFieldSubmitted;
  final bool? enabled;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final int? maxLength;
  final double topPadding;
  final double bottomPadding;
  final Color? fillColor;
  final bool? filled;
  final bool? readOnly;
  final double? borderRadius;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0.0,
      shadowColor: AppColors.shadowColor,
      child: TextFormField(
        readOnly: readOnly ?? false,
        textInputAction: textInputAction,
        maxLines: maxLines,
        minLines: minLines,
        maxLength: maxLength,
        enabled: enabled,
        keyboardType: keyboardType,
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        onFieldSubmitted: onFieldSubmitted,
        controller: controller,
        focusNode: focusNode,
        validator: validator,
        decoration: InputDecoration(
          fillColor: fillColor,
          filled: filled,
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintStyle: AppStyles.style12w400Second2(context),
          errorText: errorText,
          contentPadding: EdgeInsetsDirectional.only(
              start: 15, top: topPadding, bottom: bottomPadding, end: 0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 4),
            borderSide: BorderSide(
              color: borderColor,
              width: 1,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 4),
            borderSide: BorderSide(
              color: borderColor,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 4),
            borderSide: BorderSide(
              color: borderColor,
              width: 1,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 4),
            borderSide: const BorderSide(
              color: AppColors.redColor,
              width: 1,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 4),
            borderSide: const BorderSide(
              color: AppColors.redColor,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
