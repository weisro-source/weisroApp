import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/styles/style_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';

class RentWidget extends StatelessWidget {
  const RentWidget({
    super.key,
    required this.rentTime,
  });
  final String rentTime;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 110,
      decoration: StyleFunctions.decorationRadius8Orange(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          8.kw,
          SvgPicture.asset(IconsPath.iconsTime),
          8.kw,
          Text(
            rentTime,
            style: AppStyles.style14w400Grey(context),
          ),
        ],
      ),
    );
  }
}
