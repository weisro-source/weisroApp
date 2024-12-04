import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/feature/auth/register/presentation/manager/register_cubit/register_cubit.dart';
import 'package:weisro/feature/auth/register/presentation/manager/worker_day_cubit.dart';

import 'worker_and_client_register_page_view_body.dart';

class WorkerAndClientRegisterPageView extends StatelessWidget {
  const WorkerAndClientRegisterPageView({Key? key, required this.isWorkerAuth})
      : super(key: key);
  final bool isWorkerAuth;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
      
      
        BlocProvider<WorkerDayCubit>(create: (context) => WorkerDayCubit()),
      ],
      child: Scaffold(
          body: SafeArea(
              child: WorkerAndClientRegisterPageViewBody(
        isWorkerAuth: isWorkerAuth,
      ))),
    );
  }
}
