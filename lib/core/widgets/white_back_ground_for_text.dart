import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';

class WhiteBackGroundForText extends StatelessWidget {
  const WhiteBackGroundForText({
    super.key,
    required this.text,
    this.color,
    this.textColor,
    this.width = 80.0,
    this.padding = 0,
  });

  final String text;
  final Color? color;
  final Color? textColor;
  final double? width, padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 23,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: color ?? AppColors.orangeWithOpacity),
      child: Center(
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: padding ?? 0),
          child: Text(
            text,
            style:
                AppStyles.style8w600Orange(context).copyWith(color: textColor),
          ),
        ),
      ),
    );
  }
}
