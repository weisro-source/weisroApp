import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';

class AdsUserWidgetShimmer extends StatelessWidget {
  const AdsUserWidgetShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: AppColors.orangeColor, width: 1),
      ),
      child: Shimmer.fromColors(
        baseColor: AppColors.shimmerBaseColor,
        highlightColor: AppColors.shimmerHighlightColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            10.kh,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Container(
                height: 20,
                width: double.infinity,
                color: Colors.grey,
              ),
            ),
            Container(
              height: 87,
              width: double.infinity,
              color: Colors.grey,
            ),
            5.kh,
          ],
        ),
      ),
    );
  }
}
