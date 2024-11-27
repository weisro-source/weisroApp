import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/custom_error_widget.dart';
import 'package:weisro/feature/home/presentation/managers/services_by_category_id_cubit/services_by_category_id_cubit.dart';
import 'package:weisro/feature/home/presentation/view/widgets/advertisement_widget.dart';
import 'package:weisro/feature/home/presentation/view/widgets/worker_and_service_grid_shimmer_view.dart';
import '../widgets/search_bar.dart' as search;
import '../widgets/worker_for_one_category_grid_view.dart';

class WorkersForOneServicePageViewBody extends StatefulWidget {
  const WorkersForOneServicePageViewBody({super.key, required this.categoryId});
  final String categoryId;

  @override
  State<WorkersForOneServicePageViewBody> createState() =>
      _WorkersForOneServicePageViewBodyState();
}

class _WorkersForOneServicePageViewBodyState
    extends State<WorkersForOneServicePageViewBody> {
  late final ScrollController _scrollController;
  var nextPage = 2;

  var isLoading = false;
  bool hasNext = true;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() async {
    var currentPositions = _scrollController.position.pixels;
    var maxScrollLength = _scrollController.position.maxScrollExtent;
    if (currentPositions >= 0.5 * maxScrollLength) {
      if (!isLoading && hasNext) {
        isLoading = true;
        await BlocProvider.of<ServicesByCategoryIdCubit>(context)
            .fetchServicesByCategoryId(widget.categoryId, context,
                pageNumber: nextPage++);
        isLoading = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
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
        BlocConsumer<ServicesByCategoryIdCubit, ServicesByCategoryIdState>(
          listener: (context, state) {},
          builder: (context, getServicesByCategoryIdState) {
            if (getServicesByCategoryIdState
                    is ServicesByCategoryIdPaginationLoading ||
                getServicesByCategoryIdState
                    is ServicesByCategoryIdPaginationFailures ||
                getServicesByCategoryIdState is ServicesByCategoryIdSuccess) {
              return const SliverPadding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 24),
                sliver: WorkerForOneCategoryGridView(),
              );
            } else if (getServicesByCategoryIdState
                is ServicesByCategoryIdLoading) {
              return const WorkerAndServiceGridShimmerView();
            } else {
              return const SliverToBoxAdapter(
                child: CustomErrorWidgets(),
              );
            }
          },
        ),
        SliverToBoxAdapter(
          child: 65.kh,
        )
      ],
    );
  }
}
