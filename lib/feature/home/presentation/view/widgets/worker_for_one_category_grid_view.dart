import 'package:flutter/material.dart';
import 'package:weisro/core/utils/constant.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/feature/home/presentation/view/widgets/worker_for_one_category.dart';
import 'package:weisro/feature/worker/data/models/workers_for_category_model.dart';

class WorkerForOneCategoryGridView extends StatelessWidget {
  const WorkerForOneCategoryGridView({
    super.key,
    required this.workers,
  });
  final List<Docs> workers;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 13,
          mainAxisSpacing: 13,
          childAspectRatio: 162 / 221),
      itemCount: workers.length,
      itemBuilder: (context, index) {
        var worker = workers[index];
        // todo:Remove const when start write from model
        return WorkerForOneService(
          isAgeVisibility: true,
          isRateVisibility: true,
          type: Constants.categoryTypeWorker,
          id: worker.id ?? "",
          image: HelperFunctions.ensureIsFirstItemOrNull(worker.images ?? []) ??
              "",
          location: worker.user?.address?.city ?? "",
          name: worker.user?.firstName ?? "",
          price: worker.farePerHour.toString(),
          age: "",
          rate: worker.rate.toString(),
          tags: worker.tags,
          images: worker.images,
        );
      },
    );
  }
}
