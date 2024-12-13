import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';

class ChooseWidget extends StatelessWidget {
  const ChooseWidget({
    super.key,
    required this.icon,
    required this.chooseTitle,
    required this.isSelected,
    this.onPressed,
  });

  final String icon, chooseTitle;
  final bool isSelected;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.orangeColor : AppColors.whiteColor,
          border: Border.all(width: 1, color: AppColors.orangeColor),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Row(
          children: [
            12.kw,
            SvgPicture.asset(icon),
            8.kw,
            Text(
              chooseTitle,
              style: AppStyles.style14w400Grey(context).copyWith(
                color:
                    isSelected ? AppColors.whiteColor : AppColors.second2Color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
