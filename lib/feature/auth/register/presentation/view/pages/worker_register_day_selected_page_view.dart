import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/feature/auth/register/presentation/manager/worker_day_cubit.dart';

import 'worker_register_day_selected_body.dart';

class WorkerRegisterDaySelectedPageView extends StatelessWidget {
  const WorkerRegisterDaySelectedPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WorkerDayCubit(),
        ),
      ],
      child: const WorkerRegisterDaySelectedBody(),
    ));
  }
}
