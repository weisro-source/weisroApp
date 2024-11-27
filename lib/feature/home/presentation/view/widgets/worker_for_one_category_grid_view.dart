import 'package:flutter/material.dart';
import 'package:weisro/core/utils/constant.dart';
import 'package:weisro/feature/home/presentation/view/widgets/worker_for_one_category.dart';

class WorkerForOneCategoryGridView extends StatelessWidget {
  const WorkerForOneCategoryGridView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 13,
          mainAxisSpacing: 13,
          childAspectRatio: 162 / 221),
      itemCount: 10,
      itemBuilder: (context, index) {
        // todo:Remove const when start write from model
        return const WorkerForOneService(
          isAgeVisibility: true,
          isRateVisibility: true,
          type: Constants.categoryTypeWorker,
          id: "",
          image: "",
          location: "",
          name: "",
          price: "",
          age: "",
        );
      },
    );
  }
}
