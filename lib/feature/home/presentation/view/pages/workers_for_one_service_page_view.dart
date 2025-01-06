import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/feature/worker/presentation/manager/get_worker_for_one_category_cubit/get_worker_for_one_category_cubit.dart';

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
      create: (context) => GetWorkerForOneCategoryCubit()
        ..getAllWorkersForOneCategory(widget.categoryId, context),
      child: Scaffold(
          body: WorkersForOneServicePageViewBody(
        categoryId: widget.categoryId,
      )),
    );
  }
}
