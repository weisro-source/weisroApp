import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_color.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: false,
      decoration: const InputDecoration(
          fillColor: AppColors.second1Color,
          filled: true,
          contentPadding:
              EdgeInsetsDirectional.only(start: 5, end: 0, top: 0, bottom: 0),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 0.5, color: AppColors.orangeColor)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 0.5, color: AppColors.orangeColor)),
          disabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 0.5, color: AppColors.orangeColor))),
    );
  }
}
