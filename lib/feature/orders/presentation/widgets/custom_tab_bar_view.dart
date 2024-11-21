import 'package:flutter/material.dart';
import 'package:weisro/feature/orders/presentation/widgets/orders_list.dart';

class CustomTabBarView extends StatelessWidget {
  const CustomTabBarView({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      clipBehavior: Clip.none,
      controller: _tabController,
      children: const [OrdersList(), OrdersList(), OrdersList(), OrdersList()],
    );
  }
}
