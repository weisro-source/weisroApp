import 'package:flutter/material.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/feature/orders/presentation/widgets/order_item_widget.dart';

class OrdersList extends StatelessWidget {
  const OrdersList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return const OrderItemWidget();
      },
      separatorBuilder: (context, index) {
        return 16.kh;
      },
      itemCount: 10,
    );
  }
}
