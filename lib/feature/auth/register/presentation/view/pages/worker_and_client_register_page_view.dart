import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/feature/auth/google_auth/google_auth.dart';
import 'package:weisro/feature/auth/register/presentation/manager/register_cubit/register_cubit.dart';
import 'package:weisro/feature/auth/register/presentation/manager/worker_day_cubit.dart';

import 'worker_and_client_register_page_view_body.dart';

class WorkerAndClientRegisterPageView extends StatelessWidget {
  const WorkerAndClientRegisterPageView(
      {Key? key, required this.isWorkerAuth, this.isGoogleAuth = false})
      : super(key: key);
  final bool isWorkerAuth;
  final bool isGoogleAuth;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
        BlocProvider(
          create: (context) => GoogleAuthCubit(),
        ),
        BlocProvider<WorkerDayCubit>(create: (context) => WorkerDayCubit()),
      ],
      child: Scaffold(
          body: SafeArea(
              child: WorkerAndClientRegisterPageViewBody(
        isWorkerAuth: isWorkerAuth,
        isGoogleAuth: isGoogleAuth,
      ))),
    );
  }
}
