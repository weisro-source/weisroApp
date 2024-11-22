import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/widgets/custom_action_widget.dart';
import 'package:weisro/core/widgets/custom_leading_icon.dart';

class CustomAppBarInProfileView extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarInProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        AppBar(
          backgroundColor: AppColors.second2Color,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
          leading: const CustomLeadingIcon(
            iconColor: AppColors.whiteColor,
          ),
          actions: const [
            CustomActionWidget(
              iconColor: AppColors.whiteColor,
            )
          ],
        ),
        const PositionedDirectional(
          top: 160,
          end: 0,
          start: 0,
          child: CircleAvatar(
            minRadius: 50,
            maxRadius: 50,
            backgroundImage: CachedNetworkImageProvider(
              "https://i.pravatar.cc/20",
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(204);
}
