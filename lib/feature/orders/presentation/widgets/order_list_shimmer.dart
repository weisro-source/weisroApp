import 'package:flutter/material.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/feature/orders/presentation/widgets/order_item_shimmer.dart';

class OrderListShimmer extends StatelessWidget {
  const OrderListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return const OrderItemShimmer();
      },
      separatorBuilder: (context, index) {
        return 16.kh;
      },
      itemCount: 10,
    );
  }
}
