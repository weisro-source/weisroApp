import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/custom_app_bar.dart';
import 'package:weisro/core/widgets/service_item_list.dart';
import 'package:weisro/feature/home/data/models/last_service_model.dart';
import 'package:weisro/feature/home/presentation/view/widgets/not_found_widget.dart';
import 'package:weisro/feature/search/presentation/managers/search_cubit/search_cubit.dart';
import 'package:weisro/generated/l10n.dart';

class SearchResultPageViewBody extends StatefulWidget {
  const SearchResultPageViewBody({super.key, required this.cityName});
  final String cityName;
  @override
  State<SearchResultPageViewBody> createState() =>
      _SearchResultPageViewBodyState();
}

class _SearchResultPageViewBodyState extends State<SearchResultPageViewBody> {
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
        await BlocProvider.of<SearchCubit>(context)
            .search(context, pageNumber: nextPage++);

        isLoading = false;
      }
    }
  }

  List<Docs> searchResult = [];
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        CustomAppBar(title: S.of(context).Search_Page),
        SliverToBoxAdapter(
          child: 44.kh,
        ),
        BlocBuilder<SearchCubit, SearchState>(
          builder: (context, searchState) {
            if (searchState is SearchSuccess ||
                searchState is SearchPaginationLoading ||
                searchState is SearchPaginationFailures) {}
            return SliverPadding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 24),
              sliver: SliverToBoxAdapter(
                child: Text(
                  "${context.read<SearchCubit>().searchResult} ${S.of(context).Result_Found}",
                  style: AppStyles.style14w500Orange(context),
                ),
              ),
            );
          },
        ),
        SliverToBoxAdapter(
          child: 10.kh,
        ),
        BlocConsumer<SearchCubit, SearchState>(
          listener: (context, searchState) {
            if (searchState is SearchSuccess) {
              searchResult.addAll(searchState.searchResult.docs ?? []);
              hasNext = searchState.searchResult.hasNextPage ?? false;
            }
          },
          builder: (context, searchState) {
            if (searchState is SearchLoading) {
              return const ServiceItemListShimmer();
            } else if (searchState is SearchSuccess ||
                searchState is SearchPaginationLoading ||
                searchState is SearchPaginationFailures) {
              if (searchResult.isEmpty) {
                return const SliverFillRemaining(
                  child: Center(child: NotFoundWidget()),
                );
              } else {
                final descriptions =
                    searchResult.map((doc) => doc.name as String).toList();
                final name =
                    searchResult.map((doc) => doc.name as String).toList();
                final ids =
                    searchResult.map((doc) => doc.id as String).toList();
                final prices =
                    searchResult.map((doc) => doc.price.toString()).toList();
                final firstImages = searchResult
                    .map((doc) => (doc.images?.isNotEmpty ?? false)
                        ? doc.images!.first
                        : '')
                    .toList();

                return ServiceItemList(
                  length: searchResult.length,
                  des: descriptions,
                  name: name,
                  price: prices,
                  image: firstImages,
                  location: const [],
                  rate: const [],
                  id: ids,
                );
              }
            } else {
              return const SliverToBoxAdapter(
                child: SizedBox(),
              );
            }
          },
        )
      ],
    );
  }
}
