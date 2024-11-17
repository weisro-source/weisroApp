import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/feature/home/presentation/view/widgets/custom_search_text_field.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        25.kw,
        const Expanded(
          flex: 3,
          child: SizedBox(
            height: 33,
            child: CustomSearchTextField(),
          ),
        ),
        33.kw,
        SvgPicture.asset(
          IconsPath.iconsNotification,
          colorFilter:
              const ColorFilter.mode(AppColors.greyColor, BlendMode.srcIn),
        ),
        25.kw,
      ],
    );
  }
}
