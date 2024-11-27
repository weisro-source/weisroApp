import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weisro/core/assets_path/image_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/utils/constant.dart';

class ImageListInDetailsPage extends StatelessWidget {
  const ImageListInDetailsPage({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.55,
      child: PageView.builder(
        controller: pageController,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  placeholder: (context, url) {
                    return Shimmer.fromColors(
                      baseColor: AppColors.shimmerBaseColor,
                      highlightColor:
                          AppColors.shimmerHighlightColor,
                      child: Container(
                        width: 341,
                        height: 220,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(4))),
                      ),
                    );
                  },
                  imageUrl: Constants.imageUrl,
                  errorWidget: (context, url, error) {
                    return AspectRatio(
                      aspectRatio: 1.55,
                      child: Image.asset(
                        ImagePath.imagesService3,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
  