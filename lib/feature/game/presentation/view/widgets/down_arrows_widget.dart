import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weisro/core/assets_path/icons_path.dart';

class DownArrowsWidget extends StatelessWidget {
  const DownArrowsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(IconsPath.iconsArrowDownSmallGame),
        SvgPicture.asset(IconsPath.iconsArrowDownBigGame),
      ],
    );
  }
}
