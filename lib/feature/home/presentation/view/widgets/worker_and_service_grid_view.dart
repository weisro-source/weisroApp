import 'package:flutter/material.dart';
import 'package:weisro/feature/home/presentation/view/widgets/worker_and_service_item.dart';

class WorkerAndServiceGridView extends StatelessWidget {
  const WorkerAndServiceGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return const WorkerAndServiceItem();
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 13,
            childAspectRatio: 162 / 160));
  }
}
