import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:weisro/core/utils/helper_functions.dart';

class FullScreenImageGallery extends StatelessWidget {
  const FullScreenImageGallery({
    super.key,
    required this.imageList,
    required this.initialIndex,
    required this.isReview,
  });

  final List<String> imageList;
  final int initialIndex;
  final bool isReview;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: PhotoViewGallery.builder(
        scrollPhysics: const BouncingScrollPhysics(),
        itemCount: imageList.length,
        builder: (context, index) {
          String oneImageUrl = imageList[index];
          return PhotoViewGalleryPageOptions(
            imageProvider: isReview
                ? FileImage(File(oneImageUrl))
                : CachedNetworkImageProvider(
                    HelperFunctions.addImageNameForUrl(oneImageUrl),
                  ),
            heroAttributes: PhotoViewHeroAttributes(tag: oneImageUrl),
          );
        },
        backgroundDecoration: const BoxDecoration(color: Colors.black),
        pageController: PageController(initialPage: initialIndex),
        onPageChanged: (index) {
          // Optional: Handle page change if needed.
        },
      ),
    );
  }
}
