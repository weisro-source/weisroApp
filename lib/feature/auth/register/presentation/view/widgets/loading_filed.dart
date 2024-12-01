import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/utils/helper_functions.dart';

class LoadingFiled extends StatelessWidget {
  const LoadingFiled({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: AppColors.shimmerBaseColor,
        highlightColor: AppColors.shimmerHighlightColor,
        child: Container(
          height: 30,
          width: HelperFunctions.getScreenWidth(context) * 0.9,
          decoration: BoxDecoration(
              color: AppColors.shimmerBaseColor,
              borderRadius: BorderRadius.circular(4)),
        ));
  }
}
