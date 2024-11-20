import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/feature/home/presentation/managers/bottom_nav_bar_cubit.dart';

class CustomBottomNavigationBarItem extends StatelessWidget {
  const CustomBottomNavigationBarItem({
    super.key,
    required this.title,
    required this.iconPath,
    required this.index,
  });

  final String title, iconPath;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, int>(
      builder: (context, currentIndex) {
        final isSelected = currentIndex == index;
        return GestureDetector(
          onTap: () {
            context.read<BottomNavCubit>().changeIndex(index);
          },
          child: Column(
            children: [
              const Spacer(),
              SvgPicture.asset(
                iconPath,
                height: 26,
                width: 26,
                colorFilter: ColorFilter.mode(
                    isSelected ? AppColors.orangeColor : AppColors.greyColor,
                    BlendMode.srcIn),
              ),
              Text(
                title,
                style: AppStyles.style10w400Second2(context).copyWith(
                  color:
                      isSelected ? AppColors.orangeColor : AppColors.greyColor,
                ),
              ),
              const Spacer(),
              AnimatedContainer(
                duration: const Duration(milliseconds: 2000),
                curve: Curves.fastLinearToSlowEaseIn,
                width: isSelected
                    ? HelperFunctions.getScreenWidth(context) * 0.09
                    : 0,
                height: isSelected
                    ? HelperFunctions.getScreenHight(context) * 0.005
                    : 0,
                decoration: const BoxDecoration(
                  color: AppColors.orangeColor,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
