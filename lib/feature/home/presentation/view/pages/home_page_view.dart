import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';

import 'home_page_view_body.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        bottomNavigationBar: CustomBottomNavigationBar(),
        body: HomePageViewBody());
  }
}

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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              const Spacer(),
              SvgPicture.asset(IconsPath.iconsTaks),
              Text(
                "Order",
                style: AppStyles.style10w400Second2(context),
              ),
              const Spacer(),
              AnimatedContainer(
                duration: const Duration(milliseconds: 2000),
                curve: Curves.fastLinearToSlowEaseIn,
                width: HelperFunctions.getScreenWidth(context) * 0.09,
                height: HelperFunctions.getScreenHight(context) * 0.005,
                decoration: const BoxDecoration(
                  color: AppColors.orangeColor,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(10),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
