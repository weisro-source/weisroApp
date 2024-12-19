import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';

class WorkDay extends StatelessWidget {
  const WorkDay({
    super.key,
    required this.day,
    this.onTap,
    required this.isSelected,
  });
  final String day;
  final void Function()? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector( 
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: ShapeDecoration(
            color: isSelected ? AppColors.orangeColor : Colors.white,
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
          child: Center(
            child: Text(
              day,
              style: AppStyles.style14w400Grey(context).copyWith(
                color: isSelected ? AppColors.whiteColor : AppColors.greyColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
