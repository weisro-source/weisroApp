import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/feature/auth/register/presentation/manager/worker_day_cubit.dart';

import 'services_details_page_view_body.dart';

class ServicesDetailsPageView extends StatelessWidget {
  const ServicesDetailsPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WorkerDayCubit(),
        ),
      ],
      child: const Scaffold(body: ServicesDetailsPageViewBody()),
    );
  }
}
