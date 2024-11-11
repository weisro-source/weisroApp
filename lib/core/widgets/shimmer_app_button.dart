import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weisro/core/utils/helper_functions.dart';

class ShimmerAppButton extends StatelessWidget {
  final double height;
  final ShapeBorder shapeBorder;

  const ShimmerAppButton.rectangular({
    Key? key,
    this.height = 32,
    this.shapeBorder = const RoundedRectangleBorder(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: HelperFunctions.getScreenWidth(context),
        height: height,
        decoration: ShapeDecoration(
          color: Colors.grey[300]!,
          shape: shapeBorder,
        ),
      ),
    );
  }
}
