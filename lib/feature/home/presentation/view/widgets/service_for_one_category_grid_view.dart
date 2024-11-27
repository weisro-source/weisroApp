import 'package:flutter/material.dart';
import 'package:weisro/core/utils/constant.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/feature/home/data/models/all_services_model.dart';
import 'package:weisro/feature/home/presentation/view/widgets/worker_for_one_category.dart';

class ServicesForOneCategoryGridView extends StatelessWidget {
  const ServicesForOneCategoryGridView({
    super.key,
    required this.allServicesForOneCategory,
  });
  final List<Docs> allServicesForOneCategory;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 13,
          mainAxisSpacing: 13,
          childAspectRatio: 162 / 221),
      itemCount: allServicesForOneCategory.length,
      itemBuilder: (context, index) {
        Docs oneService = allServicesForOneCategory[index];
        return WorkerForOneService(
          isAgeVisibility: false,
          isRateVisibility: false,
          id: oneService.id ?? "",
          type: Constants.categoryTypeServices,
          image: HelperFunctions.ensureIsFirstItemOrNull(
                  oneService.images ?? []) ??
              "",
          location: "",
          name: oneService.name ?? "",
          price: "",
        );
      },
    );
  }
}
