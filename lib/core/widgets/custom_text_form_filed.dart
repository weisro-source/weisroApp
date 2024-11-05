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
  });
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final String? errorText;
  final String hintText;
  final Color borderColor;
  final int? maxLines;
  final int? minLines;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20.0,
      shadowColor: AppColors.shadowColor,
      child: SizedBox(
        height: height,
        child: TextFormField(
            maxLines: maxLines,
            minLines: minLines,
            onTapOutside: (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: AppStyles.style12w400Second2(context),
              errorText: errorText,
              contentPadding: const EdgeInsetsDirectional.only(
                  start: 15, bottom: 5, top: 10),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(
                  color: borderColor,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(
                  color: borderColor,
                  width: 1,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(
                  color: AppColors.redColor,
                  width: 1,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(
                  color: AppColors.redColor,
                  width: 1,
                ),
              ),
            )),
      ),
    );
  }
}
