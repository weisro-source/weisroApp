import 'package:flutter/material.dart';
import 'package:weisro/feature/home/presentation/view/widgets/shimmer_services_widget_in_home_page.dart';

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
