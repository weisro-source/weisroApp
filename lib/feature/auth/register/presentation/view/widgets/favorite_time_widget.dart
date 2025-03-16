import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/feature/auth/data/worker_time.dart';

class FavoriteTimeWidget extends StatelessWidget {
  const FavoriteTimeWidget({super.key, required this.favoriteTimeModel});
  final FavoriteTimeModel favoriteTimeModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: HelperFunctions.getScreenWidth(context) * 0.3,
      height: favoriteTimeModel.time != null ? 38 : 40,
      decoration: ShapeDecoration(
        color: favoriteTimeModel.isSelected
            ? AppColors.orangeColor
            : AppColors.whiteColor,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: AppColors.orangeColor),
          borderRadius: BorderRadius.circular(20),
        ),
        shadows: const [
          BoxShadow(
            color: AppColors.shadow2Color,
            blurRadius: 4,
            offset: Offset(0, 2),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 12.kw,
          // SvgPicture.asset(
          //   favoriteTimeModel.icon,
          // ),
          8.kw,
          Text(
            favoriteTimeModel.time ?? favoriteTimeModel.hours,
            style: AppStyles.style14w400White(context).copyWith(
                color: favoriteTimeModel.isSelected
                    ? AppColors.whiteColor
                    : AppColors.blackColor),
          ),
          // 11.kw,
          // Text(
          //   favoriteTimeModel.hours,
          //   style: AppStyles.style14w500Grey(context).copyWith(
          //       color: favoriteTimeModel.isSelected
          //           ? AppColors.whiteColor
          //           : AppColors.greyColor),
          // )
        ],
      ),
    );
  }
}
// favoriteTimeModel.isSelected
//                       ? AppColors.whiteColor
//                       : AppColors.orangeColor