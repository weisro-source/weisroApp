import 'package:flutter/material.dart';
import 'package:weisro/feature/home/presentation/view/widgets/worker_and_service_shimmer_item.dart';

class WorkerAndServiceGridShimmerView extends StatelessWidget {
  const WorkerAndServiceGridShimmerView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return const WorkerAndServiceShimmerItem();
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 13,
            childAspectRatio: 162 / 160));
  }
}
