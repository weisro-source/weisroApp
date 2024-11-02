import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/feature/auth/register/data/worker_time.dart';

class FavoriteTimeWidget extends StatelessWidget {
  const FavoriteTimeWidget({super.key, required this.favoriteTimeModel});
  final FavoriteTimeModel favoriteTimeModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 152,
      height: 38,
      decoration: ShapeDecoration(
        color: favoriteTimeModel.isSelected
            ? AppColors.orangeColor
            : AppColors.whiteColor,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: AppColors.orangeColor),
          borderRadius: BorderRadius.circular(4),
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
        children: [
          12.kw,
          SvgPicture.asset(
            favoriteTimeModel.icon,
          ),
          8.kw,
          Visibility(
            visible: favoriteTimeModel.time != null,
            child: Text(
              favoriteTimeModel.time ?? "",
              style: AppStyles.style14w400White(context).copyWith(
                  color: favoriteTimeModel.isSelected
                      ? AppColors.whiteColor
                      : AppColors.orangeColor),
            ),
          ),
          11.kw,
          Text(
            favoriteTimeModel.hours,
            style: AppStyles.style14w500Grey(context).copyWith(
                color: favoriteTimeModel.isSelected
                    ? AppColors.whiteColor
                    : AppColors.greyColor),
          )
        ],
      ),
    );
  }
}
