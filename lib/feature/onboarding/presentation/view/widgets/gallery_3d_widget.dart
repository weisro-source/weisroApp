import 'package:flutter/material.dart';
import 'package:flutter_gallery_3d/gallery3d.dart';

class Gallery3DWidget extends StatelessWidget {
  final Gallery3DController controller;
  final List<String> imageUrlList;
  final Function(int) onItemChanged;

  const Gallery3DWidget({
    Key? key,
    required this.controller,
    required this.imageUrlList,
    required this.onItemChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Gallery3D(
      controller: controller,
      width: MediaQuery.of(context).size.width,
      height: 280,
      isClip: true,
      itemConfig: const GalleryItemConfig(
        width: 193,
        height: 270,
        radius: 8,
        shadows: [],
        isShowTransformMask: false,
      ),
      onItemChanged: onItemChanged,
      itemBuilder: (context, index) {
        return Image.asset(
          imageUrlList[index],
          fit: BoxFit.fill,
        );
      },
    );
  }
}
