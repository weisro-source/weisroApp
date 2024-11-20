import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weisro/core/assets_path/image_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/utils/constant.dart';
import 'package:weisro/core/utils/helper_functions.dart';

class AdvertisementWidget extends StatelessWidget {
  const AdvertisementWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = HelperFunctions.getScreenWidth(context);
    final screenHeight = HelperFunctions.getScreenHight(context);

    return CachedNetworkImage(
      imageUrl: Constants.imageUrl,
      height: screenHeight * 0.25,
      width: screenWidth * 0.7,
      fit: BoxFit.cover,
      errorWidget: (context, url, error) {
        return Image.asset(
          ImagePath.imagesAd,
          height: screenHeight * 0.25,
          width: screenWidth * 0.9,
          fit: BoxFit.cover,
        );
      },
      placeholder: (context, url) {
        return Shimmer.fromColors(
          baseColor: AppColors.shimmerBaseColor,
          highlightColor: AppColors.shimmerHighlightColor,
          child: Container(
            height: screenHeight * 0.25,
            width: screenWidth * 0.9,
            color: AppColors.shimmerBaseColor,
          ),
        );
      },
      placeholderFadeInDuration: const Duration(seconds: 2),
    );
  }
}
