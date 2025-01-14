import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/generated/l10n.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: false,
      decoration: InputDecoration(
          hintText: S.of(context).Search_Here,
          hintStyle: AppStyles.style12w400Grey(context),
          fillColor: AppColors.second1Color,
          filled: true,
          contentPadding: const EdgeInsetsDirectional.only(
              start: 5, end: 0, top: 0, bottom: 0),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 0.5, color: AppColors.orangeColor)),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 0.5, color: AppColors.orangeColor)),
          disabledBorder: const OutlineInputBorder(
              borderSide:
                  BorderSide(width: 0.5, color: AppColors.orangeColor))),
    );
  }
}
