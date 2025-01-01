import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/feature/orders/data/models/order_model.dart';
import 'package:weisro/feature/orders/presentation/managers/get_orders_cubit/get_orders_cubit.dart';
import 'package:weisro/feature/orders/presentation/widgets/order_list_shimmer.dart';
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
      children: [
        BlocBuilder<GetOrdersCubit, GetOrdersState>(
          builder: (context, orderState) {
            if (orderState is GetOrdersLoading) {
              return const OrderListShimmer();
            } else if (orderState is GetOrdersSuccess) {
              return OrdersList(
                orders: orderState.orders,
              );
            } else {
              return const SizedBox();
            }
          },
        ),
        OrdersList(
          orders: Orders(),
        ),
        OrdersList(orders: Orders()),
        OrdersList(orders: Orders())
      ],
    );
  }
}
