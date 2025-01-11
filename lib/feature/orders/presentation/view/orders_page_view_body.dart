import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/custom_app_bar.dart';
import 'package:weisro/feature/orders/presentation/managers/get_completed_order_cubit/get_completed_order_cubit.dart';
import 'package:weisro/feature/orders/presentation/managers/get_orders_cubit/get_orders_cubit.dart';
import '../widgets/custom_flitter_button.dart';
import '../widgets/custom_search_filed_in_order_view.dart';
import '../widgets/custom_tab_bar.dart';
import '../widgets/custom_tab_bar_view.dart';

class OrdersPageViewBody extends StatefulWidget {
  const OrdersPageViewBody({super.key});

  @override
  State<OrdersPageViewBody> createState() => _OrdersPageViewBodyState();
}

class _OrdersPageViewBodyState extends State<OrdersPageViewBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    BlocProvider.of<GetOrdersCubit>(context).getAllOrders();
    BlocProvider.of<GetCompletedOrderCubit>(context).getAllCompletedOrders();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      const CustomAppBar(title: ""),
      SliverToBoxAdapter(
        child: 28.kh,
      ),
      // SliverToBoxAdapter(
      //   child: Row(
      //     children: [
      //       const CustomSearchFiledInOrderView(),
      //       12.kw,
      //       const Expanded(
      //         child: CustomFlitterButton(),
      //       ),
      //       10.kw,
      //     ],
      //   ),
      // ),
      // SliverToBoxAdapter(
      //   child: 28.kh,
      // ),
      SliverToBoxAdapter(
        child: CustomTabBar(tabController: _tabController),
      ),
      SliverFillRemaining(
        child: CustomTabBarView(tabController: _tabController),
      )
    ]);
  }
}
