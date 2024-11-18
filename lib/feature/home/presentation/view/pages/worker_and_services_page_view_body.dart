import 'package:flutter/material.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/feature/home/presentation/view/widgets/advertisement_widget.dart';
import '../widgets/search_bar.dart' as search;
import '../widgets/worker_and_service_grid_view.dart';

class WorkerAndServicesPageViewBody extends StatelessWidget {
  const WorkerAndServicesPageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: AdvertisementWidget(),
        ),
        SliverToBoxAdapter(
          child: 28.kh,
        ),
        const SliverToBoxAdapter(
          child: search.SearchBar(isNotificationShow: false),
        ),
        SliverToBoxAdapter(
          child: 30.kh,
        ),
        const SliverPadding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 24),
          sliver: WorkerAndServiceGridView(),
        )
      ],
    );
  }
}