import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';

class AccountType extends StatelessWidget {
  const AccountType({
    super.key,
    required this.isSelected,
    required this.iconPath,
    required this.title,
    required this.onTap,
  });

  final bool isSelected;
  final String iconPath;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 163,
        height: 195,
        decoration: ShapeDecoration(
          color: isSelected ? AppColors.orangeColor : AppColors.whiteColor,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFF58595B)),
            borderRadius: BorderRadius.circular(8),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 6,
              offset: Offset(0, 2),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconPath,
              colorFilter: ColorFilter.mode(
                isSelected ? AppColors.greyColor : AppColors.orangeColor,
                BlendMode.srcIn,
              ),
            ),
            16.kh,
            Text(
              title,
              style: AppStyles.style20w500Grey(context).copyWith(
                color: isSelected ? AppColors.greyColor : AppColors.orangeColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NewAccountTypeWidget extends StatelessWidget {
  const NewAccountTypeWidget({
    super.key,
    required this.isSelected,
    required this.iconPath,
    required this.title,
    required this.onTap,
  });

  final bool isSelected;
  final String iconPath;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(
            iconPath,
            width: 36,
            height: 36,
            colorFilter: ColorFilter.mode(
                isSelected ? AppColors.orangeColor : AppColors.greyColor,
                BlendMode.srcIn),
          ),
          10.kw,
          Container(
            height: 55,
            width: 218,
            decoration: ShapeDecoration(
              color: isSelected ? AppColors.orangeColor : AppColors.whiteColor,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(0xFF58595B)),
                borderRadius: BorderRadius.circular(60),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 6,
                  offset: Offset(0, 2),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Center(
              child: Text(
                title,
                style: AppStyles.style20w500Grey(context).copyWith(
                    color: isSelected
                        ? AppColors.whiteColor
                        : AppColors.orangeColor),
              ),
            ),
          )
        ],
      ),
    );
  }
}
// decoration: ShapeDecoration(
//             color: isSelected ? AppColors.orangeColor : AppColors.whiteColor,
//             shape: RoundedRectangleBorder(
//               side: const BorderSide(width: 1, color: Color(0xFF58595B)),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             shadows: const [
//               BoxShadow(
//                 color: Color(0x3F000000),
//                 blurRadius: 6,
//                 offset: Offset(0, 2),
//                 spreadRadius: 0,
//               ),
//             ],
//           ),