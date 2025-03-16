import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weisro/core/assets_path/image_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/widgets/full_screen_image.dart';

class ImageListInDetailsPage extends StatelessWidget {
  const ImageListInDetailsPage({
    super.key,
    required this.pageController,
    required this.imageList,
    required this.isReview,
  });

  final PageController pageController;
  final List<String> imageList;
  final bool isReview;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.55,
      child: PageView.builder(
        controller: pageController,
        itemCount: imageList.length,
        itemBuilder: (context, index) {
          String oneImageUrl = imageList[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => FullScreenImageGallery(
                    imageList: imageList,
                    initialIndex: index,
                    isReview: isReview,
                  ),
                ),
              );
            },
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: isReview
                      ? Image.file(
                          File(oneImageUrl),
                          width: 341,
                          height: 220,
                          fit: BoxFit.cover,
                        )
                      : CachedNetworkImage(
                          fit: BoxFit.cover,
                          placeholder: (context, url) {
                            return Shimmer.fromColors(
                              baseColor: AppColors.shimmerBaseColor,
                              highlightColor: AppColors.shimmerHighlightColor,
                              child: Container(
                                width: 341,
                                height: 220,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4))),
                              ),
                            );
                          },
                          width: 341,
                          height: 220,
                          imageUrl:
                              HelperFunctions.addImageNameForUrl(oneImageUrl),
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
            ),
          );
        },
      ),
    );
  }
}
