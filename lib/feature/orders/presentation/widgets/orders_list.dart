import 'package:flutter/material.dart';
import 'package:weisro/core/enums/order_status.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/feature/orders/data/models/order_model.dart';
import 'package:weisro/feature/orders/presentation/view/payment_for_order_page_view.dart';
import 'package:weisro/feature/orders/presentation/widgets/order_item_widget.dart';

class OrdersList extends StatelessWidget {
  const OrdersList({
    super.key,
    required this.orders,
    required this.state,
  });
  final Orders orders;
  final String state;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        Order? order = orders.orders?[index];
        return GestureDetector(
          onTap: () {
            if (state == OrderStatus.accepted.name) {
              HelperFunctions.navigateToScreen(
                context,
                (context) => PaymentForOrderPageView(
                  orderInfo: order ?? Order(),
                ),
              );
            }
          },
          child: OrderItemWidget(
            order: order ?? Order(),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return 16.kh;
      },
      itemCount: orders.orders?.length ?? 0,
    );
  }
}
