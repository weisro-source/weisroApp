import 'package:flutter/material.dart';
import 'package:weisro/feature/home/data/models/category_model.dart';
import 'package:weisro/feature/home/presentation/view/widgets/worker_and_service_item.dart';

class WorkerAndServiceGridView extends StatelessWidget {
  const WorkerAndServiceGridView({
    super.key,
    required this.allCategories,
  });
  final List<Docs> allCategories;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
        itemCount: allCategories.length,
        itemBuilder: (context, index) {
          var categoryItem = allCategories[index];

          return WorkerAndServiceItem(
            categoryDoc: categoryItem,
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 13,
            childAspectRatio: 162 / 160));
  }
}
