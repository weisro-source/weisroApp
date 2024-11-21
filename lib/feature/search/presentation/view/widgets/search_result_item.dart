import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';

class SearchResultItem extends StatelessWidget {
  const SearchResultItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        24.kw,
        SvgPicture.asset(IconsPath.iconsLocation),
        4.kw,
        Text("German , Oberamen , 3216",
            style: AppStyles.style12w400Grey(context)),
        const Spacer(),
        IconButton(
            onPressed: () {}, icon: SvgPicture.asset(IconsPath.iconsArrowUp)),
        24.kw,
      ],
    );
  }
}
