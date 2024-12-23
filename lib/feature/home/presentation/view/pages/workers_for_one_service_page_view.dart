import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/feature/home/presentation/managers/services_by_category_id_cubit/services_by_category_id_cubit.dart';

import 'workers_for_one_service_page_view_body.dart';

class WorkersForOneServicePageView extends StatefulWidget {
  const WorkersForOneServicePageView({
    Key? key,
    required this.categoryId,
  }) : super(key: key);
  final String categoryId;
  @override
  State<WorkersForOneServicePageView> createState() =>
      _WorkersForOneServicePageViewState();
}

class _WorkersForOneServicePageViewState
    extends State<WorkersForOneServicePageView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServicesByCategoryIdCubit()
        ..fetchServicesByCategoryId(widget.categoryId, context),
      child: Scaffold(
          body: WorkersForOneServicePageViewBody(
        categoryId: widget.categoryId,
      )),
    );
  }
}
