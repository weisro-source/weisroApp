import 'package:flutter/material.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/feature/orders/data/models/order_model.dart';
import 'package:weisro/feature/orders/presentation/widgets/order_item_widget.dart';

class OrdersList extends StatelessWidget {
  const OrdersList({
    super.key,
    required this.orders,
  });
  final Orders orders;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        Order? order = orders.orders?[index];
        return OrderItemWidget(
          order: order ?? Order(),
        );
      },
      separatorBuilder: (context, index) {
        return 16.kh;
      },
      itemCount: orders.orders?.length ?? 0,
    );
  }
}
