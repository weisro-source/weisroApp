import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({
    super.key,
    this.styleLocationText,
    this.iconWidth,
    this.iconHeight,
    this.space,
    required this.location,
  });

  final TextStyle? styleLocationText;
  final double? iconWidth, iconHeight;
  final Widget? space;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        24.kw,
        SvgPicture.asset(
          IconsPath.iconsLocation,
          height: iconHeight,
          width: iconWidth,
          fit: BoxFit.scaleDown,
        ),
        space ?? 8.kw,
        Expanded(
          child: Text(
            location,
            textAlign: TextAlign.start,
            style: styleLocationText ?? AppStyles.style12w400Grey(context),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
