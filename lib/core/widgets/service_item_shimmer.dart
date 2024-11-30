import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weisro/core/styles/app_color.dart';

class ServiceItemShimmer extends StatelessWidget {
  const ServiceItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.shadow2Color.withOpacity(0.3),
      highlightColor: AppColors.shadow2Color.withOpacity(0.1),
      child: Container(
        width: 342,
        height: 84,
        margin: const EdgeInsetsDirectional.symmetric(horizontal: 24),
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 11),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: AppColors.second2Color),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: 105,
                height: 56,
                color: AppColors.shadow2Color.withOpacity(0.5),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsetsDirectional.symmetric(vertical: 11),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 120,
                          height: 12,
                          color: AppColors.shadow2Color.withOpacity(0.5),
                        ),
                        const Spacer(),
                        Container(
                          width: 50,
                          height: 12,
                          color: AppColors.shadow2Color.withOpacity(0.5),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Container(
                      width: double.infinity,
                      height: 10,
                      color: AppColors.shadow2Color.withOpacity(0.5),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          width: 20,
                          height: 12,
                          color: AppColors.shadow2Color.withOpacity(0.5),
                        ),
                        const SizedBox(width: 4),
                        Container(
                          width: 100,
                          height: 12,
                          color: AppColors.shadow2Color.withOpacity(0.5),
                        ),
                        const Spacer(),
                        Container(
                          width: 50,
                          height: 12,
                          color: AppColors.shadow2Color.withOpacity(0.5),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
