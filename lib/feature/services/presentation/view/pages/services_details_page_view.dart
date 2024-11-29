import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/core/widgets/custom_error_widget.dart';
import 'package:weisro/core/widgets/custom_loading.dart';
import 'package:weisro/feature/auth/register/presentation/manager/worker_day_cubit.dart';
import 'package:weisro/feature/services/presentation/managers/get_service_by_id_cubit/get_service_by_id_cubit.dart';

import 'services_details_page_view_body.dart';

class ServicesDetailsPageView extends StatelessWidget {
  const ServicesDetailsPageView({Key? key, required this.serviceId})
      : super(key: key);
  final String serviceId;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WorkerDayCubit(),
        ),
        BlocProvider(
          create: (context) =>
              GetServiceByIdCubit()..getServiceById(context, serviceId),
        ),
      ],
      child: Scaffold(
          body: BlocConsumer<GetServiceByIdCubit, GetServiceByIdState>(
        listener: (context, getServiceByIdState) {},
        builder: (context, getServiceByIdState) {
          if (getServiceByIdState is GetServiceByIdLoading) {
            return const CustomLoading();
          } else if (getServiceByIdState is GetServiceByIdSuccess) {
            return ServicesDetailsPageViewBody(
              serviceId: serviceId,
              oneService: getServiceByIdState.oneService,
              isReview: false,
            );
          } else {
            return const CustomErrorWidgets();
          }
        },
      )),
    );
  }
}
