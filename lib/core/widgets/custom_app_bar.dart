import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';

import 'custom_action_widget.dart';
import 'custom_leading_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return SliverSafeArea(
      top: true,
      sliver: SliverAppBar(
        pinned: true,
        backgroundColor: AppColors.whiteColor,
        leading: const CustomLeadingIcon(),
        actions: const [CustomActionWidget()],
        title: Text(
          title,
          style: AppStyles.style18w400Grey(context),
        ),
        centerTitle: true,
      ),
    );
  }
}
