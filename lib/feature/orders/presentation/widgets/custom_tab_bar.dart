import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/generated/l10n.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: _tabController,
      tabs: [
        Tab(
          text: S.of(context).Accepted,
        ),
        Tab(
          text: S.of(context).Complete,
        ),
        Tab(text: S.of(context).Reject),
        Tab(text: S.of(context).Pending),
      ],
      labelColor: AppColors.orangeColor,
      unselectedLabelColor: AppColors.greyColor,
      indicatorColor: AppColors.orangeColor,
      labelStyle: AppStyles.style12w400Grey(context),
      unselectedLabelStyle: AppStyles.style12w400Grey(context),
    );
  }
}
