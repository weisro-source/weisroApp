import 'package:flutter/material.dart';
import 'package:weisro/core/utils/constant.dart';
import 'package:weisro/core/styles/app_color.dart';

abstract class AppStyles {
  static String getFontFamily(BuildContext context) {
    return Constants.fontFamily;
  }

  static TextStyle getCustomTextStyle(
      BuildContext context, TextStyle textStyle) {
    String fontFamily = getFontFamily(context);
    return textStyle.copyWith(fontFamily: fontFamily);
  }

  static TextStyle style10w400Red(context) {
    return getCustomTextStyle(
      context,
      const TextStyle(
        fontWeight: FontWeight.w400,
        color: AppColors.redColor,
        fontSize: 10,
      ),
    );
  }

  static TextStyle style12w400Black(context) {
    return getCustomTextStyle(
      context,
      const TextStyle(
        fontWeight: FontWeight.w400,
        color: AppColors.blackColor,
        fontSize: 12,
      ),
    );
  }

  static TextStyle style12w400Second2(context) {
    return getCustomTextStyle(
      context,
      const TextStyle(
        fontWeight: FontWeight.w400,
        color: AppColors.second2Color,
        fontSize: 12,
      ),
    );
  }

  static TextStyle style12w400Grey(context) {
    return getCustomTextStyle(
      context,
      const TextStyle(
        fontWeight: FontWeight.w400,
        color: AppColors.greyColor,
        fontSize: 12,
      ),
    );
  }

  static TextStyle style12w400Orange(context) {
    return getCustomTextStyle(
      context,
      const TextStyle(
        fontWeight: FontWeight.w400,
        color: AppColors.orangeColor,
        fontSize: 12,
      ),
    );
  }

  static TextStyle style12w500Grey(context) {
    return getCustomTextStyle(
      context,
      const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 12,
          color: AppColors.greyColor),
    );
  }

  static TextStyle style12w500Orange(context) {
    return getCustomTextStyle(
      context,
      const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 12,
          color: AppColors.orangeColor),
    );
  }

  static TextStyle style14w400Grey(context) {
    return getCustomTextStyle(
      context,
      const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: AppColors.second2Color),
    );
  }

  static TextStyle style14w500Grey(context) {
    return getCustomTextStyle(
      context,
      const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: AppColors.second2Color),
    );
  }

  static TextStyle style14w400White(context) {
    return getCustomTextStyle(
      context,
      const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: AppColors.whiteColor),
    );
  }

  static TextStyle style14w500White(context) {
    return getCustomTextStyle(
      context,
      const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: AppColors.whiteColor),
    );
  }

  static TextStyle style14w400Orange(context) {
    return getCustomTextStyle(
      context,
      const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: AppColors.orangeColor),
    );
  }

  static TextStyle style14w500Orange(context) {
    return getCustomTextStyle(
      context,
      const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: AppColors.orangeColor),
    );
  }

  static TextStyle style16w400Grey(context) {
    return getCustomTextStyle(
      context,
      const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: AppColors.greyColor),
    );
  }

  static TextStyle style16w500White(context) {
    return getCustomTextStyle(
      context,
      const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: AppColors.whiteColor),
    );
  }

  static TextStyle style16w500Black(context) {
    return getCustomTextStyle(
      context,
      const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: AppColors.blackColor),
    );
  }

  static TextStyle style18w400Grey(context) {
    return getCustomTextStyle(
      context,
      const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: AppColors.greyColor),
    );
  }

  static TextStyle style18w500Grey(context) {
    return getCustomTextStyle(
      context,
      const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: AppColors.greyColor),
    );
  }

  static TextStyle style18w500Green(context) {
    return getCustomTextStyle(
      context,
      const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: AppColors.greenColor),
    );
  }

  static TextStyle style20w500Grey(context) {
    return getCustomTextStyle(
      context,
      const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
          color: AppColors.greyColor),
    );
  }

  static TextStyle style20w500Seconder(context) {
    return getCustomTextStyle(
      context,
      const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
          color: AppColors.second2Color),
    );
  }

  static TextStyle style20w500White(context) {
    return getCustomTextStyle(
      context,
      const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
          color: AppColors.whiteColor),
    );
  }

  static TextStyle style20w400Grey(context) {
    return getCustomTextStyle(
      context,
      const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 20,
          color: AppColors.greyColor),
    );
  }
}
