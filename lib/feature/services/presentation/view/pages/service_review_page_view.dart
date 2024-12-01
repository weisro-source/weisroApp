import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weisro/feature/auth/register/presentation/manager/worker_day_cubit.dart';
import 'package:weisro/feature/services/data/models/service_model.dart';
import 'package:weisro/feature/services/presentation/managers/add_service_cubit/add_service_cubit.dart';
import 'package:weisro/feature/services/presentation/managers/add_service_to_favorite_cubit/add_service_to_favorite_cubit.dart';
import 'package:weisro/feature/services/presentation/view/pages/services_details_page_view_body.dart';

import 'add_service_loading_page_view.dart';

class ServiceReviewPageView extends StatelessWidget {
  const ServiceReviewPageView({Key? key, required this.oneService})
      : super(key: key);
  final ServiceModel oneService;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => WorkerDayCubit(),
          ),
          BlocProvider(
            create: (context) => AddServiceToFavoriteCubit(),
          ),
        ],
        child: Scaffold(
            body: BlocConsumer<AddServiceCubit, AddServiceState>(
          listener: (context, state) {},
          builder: (context, addServiceState) {
            if (addServiceState is AddServiceStateLoading) {
              return const AddServiceLoadingPage();
            } else {
              return ServicesDetailsPageViewBody(
                serviceId: "-404",
                oneService: oneService,
                isReview: true,
              );
            }
          },
        )));
  }
}
