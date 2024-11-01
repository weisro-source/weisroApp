import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/generated/l10n.dart';

class CongratulationsWidget extends StatelessWidget {
  const CongratulationsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(IconsPath.iconsLinesRight),
        8.kw,
        Text(
          S.of(context).Congratulations,
          style: AppStyles.style18w500Green(context),
        ),
        8.kw,
        SvgPicture.asset(IconsPath.iconsLinesLeft),
      ],
    );
  }
}
