import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/feature/orders/data/models/order_model.dart';
import 'package:weisro/feature/orders/presentation/managers/booking_pay_cubit/booking_pay_cubit.dart';
import 'package:weisro/feature/orders/presentation/view/payment_for_order_page_view_body.dart';

class PaymentForOrderPageView extends StatelessWidget {
  const PaymentForOrderPageView({Key? key, required this.orderInfo})
      : super(key: key);
  final Order orderInfo;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookingPayCubit(),
      child: Scaffold(
          body: SafeArea(
              child: PaymentForOrderPageViewBody(
        orderInfo: orderInfo,
      ))),
    );
  }
}
