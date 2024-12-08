import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/custom_app_bar.dart';
import 'package:weisro/core/widgets/service_item_list.dart';
import 'package:weisro/feature/search/presentation/managers/cubit/search_cubit.dart';
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
            .search(context, pageNumber: nextPage);

        isLoading = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomAppBar(title: S.of(context).Search_Page),
        SliverToBoxAdapter(
          child: 44.kh,
        ),
        SliverPadding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 24),
          sliver: SliverToBoxAdapter(
            child: Text(
              "12 ${S.of(context).Result_Found}",
              style: AppStyles.style14w500Orange(context),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: 10.kh,
        ),
        const ServiceItemList(
          allFavorite: [],
        )
      ],
    );
  }
}
