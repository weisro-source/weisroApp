import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/feature/booking/data/models/your_booking_model.dart';
import 'package:weisro/feature/booking/presentation/manager/update_booking_statue_cubit/update_booking_statue_cubit.dart';
import 'package:weisro/feature/booking/presentation/view/pages/receive_page_view_body.dart';

class ReceivePageView extends StatelessWidget {
  const ReceivePageView({Key? key, required this.booking}) : super(key: key);
  final Docs booking;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateBookingStatueCubit(),
      child: Scaffold(
          body: ReceivePageViewBody(
        booking: booking,
      )),
    );
  }
}
