import 'package:flutter/material.dart';
import 'package:weisro/feature/booking/data/models/your_booking_model.dart';
import 'package:weisro/feature/booking/presentation/view/pages/receive_page_view_body.dart';

class ReceivePageView extends StatelessWidget {
  const ReceivePageView({Key? key, required this.booking}) : super(key: key);
  final Docs booking;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ReceivePageViewBody(
      booking: booking,
    ));
  }
}
