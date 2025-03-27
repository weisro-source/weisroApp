import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weisro/core/assets_path/icons_path.dart';

class TopArrowsWidget extends StatelessWidget {
  const TopArrowsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(IconsPath.iconsArrowTopBigGame),
        SvgPicture.asset(IconsPath.iconsArrowTopSmallGame),
      ],
    );
  }
}
