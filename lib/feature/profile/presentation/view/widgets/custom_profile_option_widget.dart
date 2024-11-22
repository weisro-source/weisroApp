import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/feature/profile/data/models/profile_option.dart';

class CustomProfileOptionWidget extends StatelessWidget {
  const CustomProfileOptionWidget({
    super.key,
    required this.item,
  });

  final ProfileOption item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(
        item.icon,
        width: 20,
        height: 20,
        colorFilter:
            const ColorFilter.mode(AppColors.orangeColor, BlendMode.srcIn),
      ),
      title: Text(
        item.title,
        style: AppStyles.style14w400Grey(context),
      ),
      onTap: item.onTap,
    );
  }
}
