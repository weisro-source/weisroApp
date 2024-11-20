import 'package:flutter/material.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/feature/home/presentation/view/pages/worker_services_page_view.dart';
import 'package:weisro/feature/home/presentation/view/widgets/services_widget_in_home_page.dart';

class ServicesGridViewInHomePage extends StatelessWidget {
  const ServicesGridViewInHomePage({
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
        return GestureDetector(
            onTap: () {
              HelperFunctions.navigateToScreen(
                  context, (context) => const WorkerAndServicesPageView());
            },
            child: const ServicesWidgetInHomePage());
      },
    );
  }
}
