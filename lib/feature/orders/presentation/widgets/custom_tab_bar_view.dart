import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/core/enums/order_status.dart';
import 'package:weisro/feature/home/presentation/view/widgets/not_found_widget.dart';
import 'package:weisro/feature/orders/presentation/managers/get_all_pending_orders_cubit/get_all_pending_orders_cubit.dart';
import 'package:weisro/feature/orders/presentation/managers/get_all_reject_orders_cubit/get_all_reject_orders_cubit.dart';
import 'package:weisro/feature/orders/presentation/managers/get_completed_order_cubit/get_completed_order_cubit.dart';
import 'package:weisro/feature/orders/presentation/managers/get_in_progress_orders_cubit/get_in_progress_orders_cubit.dart';
import 'package:weisro/feature/orders/presentation/managers/get_orders_cubit/get_orders_cubit.dart';
import 'package:weisro/feature/orders/presentation/widgets/order_list_shimmer.dart';
import 'package:weisro/feature/orders/presentation/widgets/orders_list.dart';
import 'package:weisro/generated/l10n.dart';

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
              return orderState.orders.orders?.isEmpty ?? false
                  ? NotFoundWidget(
                      title: S.of(context).No_Orders_Found,
                    )
                  : OrdersList(
                      orders: orderState.orders,
                      state: OrderStatus.accepted.name,
                    );
            } else {
              return const SizedBox();
            }
          },
        ),
        BlocBuilder<GetCompletedOrderCubit, GetCompletedOrderState>(
          builder: (context, completedOrdersState) {
            if (completedOrdersState is GetCompletedOrderLoading) {
              return const OrderListShimmer();
            } else if (completedOrdersState is GetCompletedOrderSuccess) {
              return completedOrdersState.orders.orders?.isEmpty ?? false
                  ? NotFoundWidget(
                      title: S.of(context).No_Orders_Found,
                    )
                  : OrdersList(
                      orders: completedOrdersState.orders,
                      state: OrderStatus.completed.name);
            } else {
              return const SizedBox();
            }
          },
        ),
        BlocBuilder<GetAllRejectOrdersCubit, GetAllRejectOrdersState>(
          builder: (context, rejectOrderState) {
            if (rejectOrderState is GetAllRejectOrdersLoading) {
              return const OrderListShimmer();
            } else if (rejectOrderState is GetAllRejectOrdersSuccess) {
              return rejectOrderState.orders.orders?.isEmpty ?? false
                  ? NotFoundWidget(
                      title: S.of(context).No_Orders_Found,
                    )
                  : OrdersList(
                      orders: rejectOrderState.orders,
                      state: OrderStatus.rejected.name,
                    );
            } else {
              return const SizedBox();
            }
          },
        ),
        BlocBuilder<GetAllPendingOrdersCubit, GetAllPendingOrdersState>(
          builder: (context, pendingOrdersState) {
            if (pendingOrdersState is GetAllPendingOrdersLoading) {
              return const OrderListShimmer();
            } else if (pendingOrdersState is GetAllPendingOrdersSuccess) {
              return pendingOrdersState.orders.orders?.isEmpty ?? false
                  ? NotFoundWidget(
                      title: S.of(context).No_Orders_Found,
                    )
                  : OrdersList(
                      orders: pendingOrdersState.orders,
                      state: OrderStatus.pending.name,
                    );
            } else {
              return const SizedBox();
            }
          },
        ),
        BlocBuilder<GetInProgressOrdersCubit, GetInProgressOrdersState>(
          builder: (context, pendingOrdersState) {
            if (pendingOrdersState is GetInProgressOrdersLoading) {
              return const OrderListShimmer();
            } else if (pendingOrdersState is GetInProgressOrdersSuccess) {
              return pendingOrdersState.orders.orders?.isEmpty ?? false
                  ? NotFoundWidget(
                      title: S.of(context).No_Orders_Found,
                    )
                  : OrdersList(
                      orders: pendingOrdersState.orders,
                      state: OrderStatus.pending.name,
                    );
            } else {
              return const SizedBox();
            }
          },
        )
      ],
    );
  }
}
