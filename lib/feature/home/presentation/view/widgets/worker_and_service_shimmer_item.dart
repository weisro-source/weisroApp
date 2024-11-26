import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/widgets/white_back_ground_for_text.dart';

class WorkerAndServiceShimmerItem extends StatelessWidget {
  const WorkerAndServiceShimmerItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Shimmer.fromColors(
          baseColor: AppColors.shimmerBaseColor,
          highlightColor: AppColors.shimmerHighlightColor,
          child: Container(
            width: double.infinity,
            height: 150,
            color: Colors.grey[300],
          ),
        ),
        const Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsetsDirectional.only(bottom: 10),
            child: WhiteBackGroundForText(text: "XXXXX"),
          ),
        ),
      ],
    );
  }
}
