import 'package:flutter/material.dart';

import 'package:weisro/core/assets_path/image_path.dart';

class LogoImageWidget extends StatelessWidget {
  const LogoImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 74,
        height: 72,
        child: Image.asset(
          ImagePath.imagesLogo,
          width: 74,
          height: 72,
        ));
  }
}
