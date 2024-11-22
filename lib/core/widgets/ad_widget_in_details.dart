import 'package:flutter/material.dart';
import 'package:weisro/core/assets_path/image_path.dart';

class AdWidgetInDetails extends StatelessWidget {
  const AdWidgetInDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 344 / 191,
      child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(0)),
          child: Image.asset(
            ImagePath.imagesAd,
            fit: BoxFit.cover,
          )),
    );
  }
}
