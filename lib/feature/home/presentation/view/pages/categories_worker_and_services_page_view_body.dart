import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/custom_error_widget.dart';
import 'package:weisro/feature/home/data/models/category_model.dart';
import 'package:weisro/feature/home/presentation/managers/categories_cubit/categories_cubit.dart';
import 'package:weisro/feature/home/presentation/view/widgets/advertisement_widget.dart';
import 'package:weisro/feature/home/presentation/view/widgets/worker_and_service_grid_shimmer_view.dart';
import '../widgets/search_bar.dart' as search;
import '../widgets/category_for_worker_grid_view.dart';

class CategoriesWorkerAndServicesPageViewBody extends StatefulWidget {
  const CategoriesWorkerAndServicesPageViewBody(
      {super.key, required this.type});
  final String type;

  @override
  State<CategoriesWorkerAndServicesPageViewBody> createState() =>
      _CategoriesWorkerAndServicesPageViewBodyState();
}

class _CategoriesWorkerAndServicesPageViewBodyState
    extends State<CategoriesWorkerAndServicesPageViewBody> {
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
    debugPrint("Listener triggered");

    var currentPositions = _scrollController.position.pixels;
    var maxScrollLength = _scrollController.position.maxScrollExtent;
    debugPrint(
        "Current Position: $currentPositions, Max Scroll: $maxScrollLength");
    if (currentPositions >= 0.3 * maxScrollLength) {
      if (!isLoading && hasNext) {
        isLoading = true;
        await BlocProvider.of<CategoriesCubit>(context)
            .fetchCategories(widget.type, context, pageNumber: nextPage++);
        isLoading = false;
      }
    }
  }

  List<Docs> allCategories = [];
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
        BlocConsumer<CategoriesCubit, CategoriesState>(
          listener: (context, getCategoriesState) {
            if (getCategoriesState is CategoriesSuccess) {
              allCategories.addAll(getCategoriesState.categoryModel.docs ?? []);
              hasNext = getCategoriesState.categoryModel.hasNextPage ?? false;
            }
          },
          builder: (context, getCategoriesState) {
            if (getCategoriesState is CategoriesLoading) {
              return const SliverPadding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 24),
                sliver: WorkerAndServiceGridShimmerView(),
              );
            } else if (getCategoriesState is CategoriesSuccess ||
                getCategoriesState is CategoriesPaginationLoading ||
                getCategoriesState is CategoriesPaginationFailures) {
              return SliverPadding(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 24),
                sliver: CategoryForWorkerAndServiceGridView(
                  allCategories: allCategories,
                  type: widget.type,
                ),
              );
            } else {
              return const SliverToBoxAdapter(
                child: CustomErrorWidgets(),
              );
            }
          },
        ),
        SliverToBoxAdapter(
          child: 30.kh,
        ),
      ],
    );
  }
}
