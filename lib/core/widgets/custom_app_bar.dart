import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/app_style.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      pinned: true,
      leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(IconsPath.iconsNotification)),
      title: Text(
        title,
        style: AppStyles.style18w400Grey(context),
      ),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () {}, icon: SvgPicture.asset(IconsPath.iconsMenu))
      ],
    );
  }
}
