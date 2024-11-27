import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/feature/home/presentation/managers/services_by_category_id_cubit/services_by_category_id_cubit.dart';
import 'package:weisro/feature/home/presentation/view/pages/service_for_one_category_page_view_body.dart';

class ServiceForOnCategoryPageView extends StatelessWidget {
  const ServiceForOnCategoryPageView({Key? key, required this.categoryId})
      : super(key: key);
  final String categoryId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServicesByCategoryIdCubit()
        ..fetchServicesByCategoryId(categoryId, context),
      child: Scaffold(
          body: ServiceForOneCategoryPageViewBody(
        categoryId: categoryId,
      )),
    );
  }
}
