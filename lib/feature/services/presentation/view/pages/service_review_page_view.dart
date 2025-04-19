import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/core/widgets/material_banner.dart';

import 'package:weisro/feature/auth/register/presentation/manager/worker_day_cubit.dart';
import 'package:weisro/feature/services/data/models/service_model.dart';
import 'package:weisro/feature/services/presentation/managers/add_service_cubit/add_service_cubit.dart';
import 'package:weisro/feature/services/presentation/managers/add_service_to_favorite_cubit/add_service_to_favorite_cubit.dart';
import 'package:weisro/feature/services/presentation/view/pages/services_details_page_view_body.dart';
import 'package:weisro/generated/l10n.dart';

import 'add_loading_page_view.dart';

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
          listener: (context, addServiceState) {
            final messenger = ScaffoldMessenger.of(context);

            if (addServiceState is AddServiceStateSuccess) {
              MaterialBanner materialBanner =
                  CustomMaterialBanner.successMaterialBanner(
                      S.of(context).Successfully,
                      S.of(context).Service_Added_Successfully);
              ScaffoldMessenger.of(context)
                ..hideCurrentMaterialBanner()
                ..showMaterialBanner(materialBanner);
              messenger
                ..hideCurrentMaterialBanner()
                ..showMaterialBanner(materialBanner);
              Future.delayed(const Duration(seconds: 3), () {
                messenger.hideCurrentMaterialBanner();
              });
            } else if (addServiceState is AddServiceStateFailure) {
              MaterialBanner materialBanner =
                  CustomMaterialBanner.failureMaterialBanner(
                      S.of(context).Failed_To_Add_Service,
                      addServiceState.error.errMassage);
              ScaffoldMessenger.of(context)
                ..hideCurrentMaterialBanner()
                ..showMaterialBanner(materialBanner);

              messenger
                ..hideCurrentMaterialBanner()
                ..showMaterialBanner(materialBanner);

              Future.delayed(const Duration(seconds: 3), () {
                messenger.hideCurrentMaterialBanner();
              });
            }
          },
          builder: (context, addServiceState) {
            if (addServiceState is AddServiceStateLoading) {
              return const AddLoadingPage();
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
