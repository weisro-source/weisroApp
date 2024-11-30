import 'package:flutter/material.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/feature/home/data/models/last_service_model.dart';
import 'package:weisro/feature/home/presentation/view/pages/categories_worker_services_page_view.dart';
import 'package:weisro/feature/home/presentation/view/widgets/services_widget_in_home_page.dart';

import 'shimmer_services_widget_in_home_page.dart';

class ServicesGridViewInHomePage extends StatelessWidget {
  const ServicesGridViewInHomePage({
    super.key,
    required this.lastServices,
  });
  final List<Docs> lastServices;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: lastServices.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 172 / 162,
          crossAxisSpacing: 10,
          mainAxisSpacing: 20,
          crossAxisCount: 2),
      itemBuilder: (context, index) {
        Docs lastService = lastServices[index];
        return GestureDetector(
            onTap: () {
              HelperFunctions.navigateToScreen(
                  context,
                  (context) => const CategoriesWorkerAndServicesPageView(
                        type: "",
                      ));
            },
            child: ServicesWidgetInHomePage(
              lastService: lastService,
            ));
      },
    );
  }
}

class ShimmerServicesGridViewInHomePage extends StatelessWidget {
  const ShimmerServicesGridViewInHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: 5,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 172 / 162,
          crossAxisSpacing: 10,
          mainAxisSpacing: 20,
          crossAxisCount: 2),
      itemBuilder: (context, index) {
        return GestureDetector(child: const ShimmerServicesWidgetInHomePage());
      },
    );
  }
}
