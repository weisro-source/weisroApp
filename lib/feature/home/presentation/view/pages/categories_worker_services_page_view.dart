import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/feature/home/presentation/managers/categories_cubit/categories_cubit.dart';

import 'categories_worker_and_services_page_view_body.dart';

class CategoriesWorkerAndServicesPageView extends StatelessWidget {
  const CategoriesWorkerAndServicesPageView({super.key, required this.type});
  final String type;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              CategoriesCubit()..fetchCategories(type, context, pageNumber: 1),
        ),
      ],
      child: Scaffold(
        body: SafeArea(
          child: CategoriesWorkerAndServicesPageViewBody(
            type: type,
          ),
        ),
      ),
    );
  }
}
