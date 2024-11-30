import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weisro/core/styles/app_color.dart';

class ShimmerServicesWidgetInHomePage extends StatelessWidget {
  const ShimmerServicesWidgetInHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.greyColor.withOpacity(0.3), // Base shimmer color
      highlightColor: AppColors.whiteColor.withOpacity(0.6), // Highlight color
      child: Container(
        height: 162,
        width: 172,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: AppColors.greyColor.withOpacity(0.3),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(top: 10, end: 10),
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.greyColor.withOpacity(0.5),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Container(
              height: 22,
              decoration: BoxDecoration(
                color: AppColors.greyColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(4),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 8),
            ),
          ],
        ),
      ),
    );
  }
}
