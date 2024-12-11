import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/feature/booking/presentation/manager/book_service_cubit/book_service_cubit.dart';
import 'package:weisro/feature/services/data/models/service_model.dart';

import 'book_service_page_view_body.dart';

class BookServicePageView extends StatelessWidget {
  const BookServicePageView(
      {Key? key,
      required this.isDays,
      required this.isHours,
      required this.hours,
      required this.days})
      : super(key: key);
  final bool isDays, isHours;
  final Time hours;
  final List<String> days;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookServiceCubit(),
      child: Scaffold(
          body: BookServicePageViewBody(
        isDays: isDays,
        isHours: isHours,
        hours: hours,
        days: days,
      )),
    );
  }
}
