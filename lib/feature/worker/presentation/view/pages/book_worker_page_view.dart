import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/feature/auth/register/presentation/manager/worker_day_cubit.dart';
import 'package:weisro/feature/booking/presentation/manager/book_worker_cubit/book_worker_cubit.dart';
import 'package:weisro/feature/services/data/models/service_model.dart';
import 'package:weisro/feature/worker/presentation/view/pages/book_worker_page_view_body.dart';

class BookWorkerPageView extends StatelessWidget {
  const BookWorkerPageView(
      {Key? key, required this.days, required this.workerId})
      : super(key: key);
  final List<Day> days;
  final String workerId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WorkerDayCubit(),
        ),
        BlocProvider(
          create: (context) => BookWorkerCubit(),
        ),
      ],
      child: Scaffold(
          body: BookWorkerPageViewBody(
        days: days,
        workerId: workerId,
      )),
    );
  }
}
