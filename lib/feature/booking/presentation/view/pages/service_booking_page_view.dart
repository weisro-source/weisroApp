import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/feature/booking/presentation/manager/book_service_cubit/book_service_cubit.dart';
import 'package:weisro/feature/services/data/models/service_model.dart';
import 'package:weisro/feature/services/presentation/managers/service_day_cubit.dart';

import 'book_service_page_view_body.dart';

class BookServicePageView extends StatefulWidget {
  const BookServicePageView(
      {Key? key,
      required this.isDays,
      required this.isHours,
      required this.hours,
      required this.days,
      required this.dayPrice,
      required this.hourPrice,
      required this.serviceId})
      : super(key: key);
  final bool isDays, isHours;
  final Time hours;
  final List<Day>? days;
  final num dayPrice, hourPrice;
  final String serviceId;

  @override
  State<BookServicePageView> createState() => _BookServicePageViewState();
}

class _BookServicePageViewState extends State<BookServicePageView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ServiceDayCubit>(context).state.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookServiceCubit(),
      child: Scaffold(
          body: BookServicePageViewBody(
        isDays: widget.isDays,
        isHours: widget.isHours,
        hours: widget.hours,
        days: widget.days,
        dayPrice: widget.dayPrice,
        hourPrice: widget.hourPrice,
        serviceId: widget.serviceId,
      )),
    );
  }
}
