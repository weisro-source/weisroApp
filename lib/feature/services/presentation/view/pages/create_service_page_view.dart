import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/feature/auth/register/presentation/manager/worker_day_cubit.dart';
import 'package:weisro/feature/services/presentation/view/pages/create_serive_page_view_body.dart';

class CreateServicePageView extends StatelessWidget {
  const CreateServicePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WorkerDayCubit(),
        ),
      ],
      child: const Scaffold(
        body: CreateServicePageViewBody(),
      ),
    );
  }
}
