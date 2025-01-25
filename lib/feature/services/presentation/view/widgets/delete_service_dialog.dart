import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/widgets/custom_loading.dart';
import 'package:weisro/core/widgets/material_banner.dart';
import 'package:weisro/feature/home/presentation/view/pages/home_page_view.dart';
import 'package:weisro/feature/services/presentation/managers/deleted_service_cubit/deleted_service_cubit.dart';
import 'package:weisro/generated/l10n.dart';

void showDeleteConfirmationDialog(BuildContext context, String serviceId) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.warning_rounded,
                color: AppColors.redColor,
                size: 48.0,
              ),
              const SizedBox(height: 16),
              Text(
                S.of(context).Delete_Service,
                style: AppStyles.style20w500Grey(context).copyWith(
                    color: AppColors.redColor, fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                S.of(context).Delete_Service_Confirmation,
                style: AppStyles.style16w400Grey(context),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              BlocProvider(
                create: (context) => DeletedServiceCubit(),
                child: BlocConsumer<DeletedServiceCubit, DeletedServiceState>(
                  listener: (context, deleteState) {
                    final messenger = ScaffoldMessenger.of(context);

                    if (deleteState is DeletedServiceSuccess) {
                      MaterialBanner materialBanner =
                          CustomMaterialBanner.successMaterialBanner(
                              S.of(context).Service_Deleted,
                              S.of(context).Service_Deleted_Message);

                      messenger
                        ..hideCurrentMaterialBanner()
                        ..showMaterialBanner(materialBanner);

                      Future.delayed(const Duration(seconds: 3), () {
                        messenger.hideCurrentMaterialBanner();
                        if (context.mounted) {
                          HelperFunctions.navigateToScreenAndRemove(
                            context,
                            (context) => const HomePageView(),
                          );
                        }
                      });
                    } else if (deleteState is DeletedServiceFailures) {
                      MaterialBanner materialBanner =
                          CustomMaterialBanner.failureMaterialBanner(
                              S.of(context).Deletion_Failed,
                              S.of(context).Deletion_Failed_Message);

                      messenger
                        ..hideCurrentMaterialBanner()
                        ..showMaterialBanner(materialBanner);

                      Future.delayed(const Duration(seconds: 3), () {
                        messenger.hideCurrentMaterialBanner();
                      });
                    }
                  },
                  builder: (context, deleteState) {
                    if (deleteState is DeletedServiceLoading) {
                      return const Center(child: CustomLoading());
                    } else {
                      return Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    AppColors.greyColor.withOpacity(0.2),
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                              child: Text(
                                S.of(context).Cancel,
                                style: AppStyles.style16w500Black(context),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () async {
                                final cubit =
                                    BlocProvider.of<DeletedServiceCubit>(
                                        context);
                                await cubit.deleteService(serviceId, context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.redColor,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                              child: Text(
                                S.of(context).Ok,
                                style: AppStyles.style16w500White(context)
                                    .copyWith(
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
