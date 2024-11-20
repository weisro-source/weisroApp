import 'package:flutter/material.dart';
import 'package:weisro/feature/home/presentation/view/widgets/worker_for_one_service.dart';

class WorkerForOneServiceGridView extends StatelessWidget {
  const WorkerForOneServiceGridView({
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
        return const WorkerForOneService();
      },
    );
  }
}
