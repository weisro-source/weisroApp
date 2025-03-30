import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/utils/constant.dart';

class GameAppStyles {
  GameAppStyles._();

  static TextStyle getCustomTextStyle(
      BuildContext context, TextStyle textStyle) {
    String fontFamily = Constants.gameFont2Family;
    return textStyle.copyWith(fontFamily: fontFamily);
  }

  static TextStyle gameTextStyle50w700(context) {
    return getCustomTextStyle(
        context,
        const TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.w700,
          color: AppColors.whiteColor,
        ));
  }

  static TextStyle gameTextStyle16wBlueGameColorW700(context) {
    return getCustomTextStyle(
      context,
      const TextStyle(
          fontSize: 16,
          fontFamily: Constants.gameFont3Family,
          fontWeight: FontWeight.w700,
          color: AppColors.blueGameColor),
    );
  }

  static TextStyle gameTextStyle12wWhiteColorW700(context) {
    return getCustomTextStyle(
      context,
      const TextStyle(
          fontSize: 12,
          fontFamily: Constants.gameFont3Family,
          fontWeight: FontWeight.w700,
          color: AppColors.whiteColor),
    );
  }

  static TextStyle gameTextStyle10wWhiteColorW700(context) {
    return getCustomTextStyle(
      context,
      const TextStyle(
          fontSize: 10,
          fontFamily: Constants.gameFont3Family,
          fontWeight: FontWeight.w700,
          color: AppColors.whiteColor),
    );
  }

  static TextStyle gameTextStyle20wWhiteColorW700(context) {
    return getCustomTextStyle(
      context,
      const TextStyle(
          fontSize: 20,
          fontFamily: Constants.fontFamily,
          fontWeight: FontWeight.w700,
          color: AppColors.whiteColor),
    );
  }
}
