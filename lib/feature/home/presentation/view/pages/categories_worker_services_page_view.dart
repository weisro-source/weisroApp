import 'package:flutter/material.dart';
import 'categories_worker_and_services_page_view_body.dart';

class CategoriesWorkerAndServicesPageView extends StatelessWidget {
  const CategoriesWorkerAndServicesPageView({super.key, required this.type});
  final String type;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CategoriesWorkerAndServicesPageViewBody(
          type: type,
        ),
      ),
    );
  }
}
