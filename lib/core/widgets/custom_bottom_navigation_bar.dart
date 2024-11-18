import 'package:flutter/material.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/bottom_navigation_bar_item.dart';
import 'package:weisro/generated/l10n.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: HelperFunctions.getScreenHight(context) * .06,
      decoration: const BoxDecoration(
        color: AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
            color: Color(0x35000000),
            blurRadius: 4,
            offset: Offset(0, -1),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          0.kw,
          CustomBottomNavigationBarItem(
            iconPath: IconsPath.iconsFavService,
            title: S.of(context).Favorites,
            index: 0,
          ),
          CustomBottomNavigationBarItem(
            iconPath: IconsPath.iconsTaks,
            title: S.of(context).Orders,
            index: 1,
          ),
          CustomBottomNavigationBarItem(
            iconPath: IconsPath.iconsHome,
            title: S.of(context).Home,
            index: 2,
          ),
          CustomBottomNavigationBarItem(
            iconPath: IconsPath.iconsSearch,
            title: S.of(context).Search,
            index: 3,
          ),
          CustomBottomNavigationBarItem(
            iconPath: IconsPath.iconsProfile,
            title: S.of(context).Profile,
            index: 4,
          ),
          0.kw,
        ],
      ),
    );
  }
}
