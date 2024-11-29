import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/feature/auth/register/presentation/manager/worker_day_cubit.dart';
import 'package:weisro/feature/services/data/models/service_model.dart';
import 'package:weisro/feature/services/presentation/managers/add_service_cubit/add_service_cubit.dart';
import 'package:weisro/feature/services/presentation/view/pages/services_details_page_view_body.dart';
import 'package:weisro/generated/l10n.dart';

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
        ],
        child: Scaffold(
            body: BlocConsumer<AddServiceCubit, AddServiceState>(
          listener: (context, state) {},
          builder: (context, addServiceState) {
            if (addServiceState is AddServiceStateLoading) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Lottie.asset(
                      IconsPath.iconsLoadingAnimation,
                      width: 200,
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                  ),
                  25.kh,
                  Text(
                    S.of(context).please_wait_publishing,
                    style: AppStyles.style18w500Green(context),
                  )
                ],
              );
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
