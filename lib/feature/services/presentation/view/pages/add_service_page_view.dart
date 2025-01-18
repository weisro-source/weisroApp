import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/core/utils/constant.dart';
import 'package:weisro/feature/auth/register/presentation/manager/worker_day_cubit.dart';
import 'package:weisro/feature/home/presentation/managers/categories_cubit/categories_cubit.dart';
import 'package:weisro/feature/services/presentation/managers/add_service_cubit/add_service_cubit.dart';
import 'package:weisro/feature/services/presentation/view/pages/add_serive_page_view_body.dart';

class CreateServicePageView extends StatelessWidget {
  const CreateServicePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WorkerDayCubit(),
        ),
        BlocProvider(
          create: (context) => AddServiceCubit(),
        ),
        // BlocProvider(
        //   create: (context) => CategoriesCubit()
        //     ..fetchCategories(Constants.categoryTypeServices, context),
        // ),
      ],
      child: const Scaffold(
        body: SafeArea(child: CreateServicePageViewBody()),
      ),
    );
  }
}
