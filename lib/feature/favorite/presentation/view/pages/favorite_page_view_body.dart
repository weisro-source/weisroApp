import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/core/assets_path/image_path.dart';

import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/custom_error_widget.dart';
import 'package:weisro/core/widgets/no_data_screen.dart';
import 'package:weisro/core/widgets/service_item_list.dart';
import 'package:weisro/feature/favorite/data/models/favorite_model.dart';
import 'package:weisro/feature/favorite/presentation/managers/get_favorite_cubit/get_favorite_cubit.dart';
import 'package:weisro/generated/l10n.dart';

import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../../../core/widgets/service_item_list_shimmer.dart';

class FavoritePageViewBody extends StatefulWidget {
  const FavoritePageViewBody({super.key});

  @override
  State<FavoritePageViewBody> createState() => _FavoritePageViewBodyState();
}

class _FavoritePageViewBodyState extends State<FavoritePageViewBody> {
//todo: add favorite Empty page I translate the empty page
  late final ScrollController _scrollController;

  var nextPage = 2;

  var isLoading = false;
  bool hasNext = true;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetFavoriteCubit>(context).getAllFavorites(context);
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() async {
    var currentPositions = _scrollController.position.pixels;
    var maxScrollLength = _scrollController.position.maxScrollExtent;
    if (currentPositions >= 0.5 * maxScrollLength) {
      if (!isLoading && hasNext) {
        isLoading = true;
        await BlocProvider.of<GetFavoriteCubit>(context)
            .getAllFavorites(context, pageNumber: nextPage++);
        isLoading = false;
      }
    }
  }

  List<Docs> allFavorite = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        controller: _scrollController,
        slivers: [
          CustomAppBar(
            title: S.of(context).Favorite_page,
          ),
          SliverToBoxAdapter(
            child: 36.kh,
          ),
          BlocConsumer<GetFavoriteCubit, GetFavoriteState>(
            listener: (context, getFavoriteState) {
              if (getFavoriteState is GetFavoriteSuccess) {
                allFavorite.addAll(getFavoriteState.favorites.docs ?? []);
                hasNext = getFavoriteState.favorites.hasNextPage ?? false;
              }
            },
            builder: (context, getFavoriteState) {
              if (getFavoriteState is GetFavoriteLoading) {
                return const ServiceItemListShimmer();
              } else if (getFavoriteState is GetFavoriteSuccess ||
                  getFavoriteState is GetFavoritePaginationLoading ||
                  getFavoriteState is GetFavoritePaginationFailures) {
                if (allFavorite.isEmpty) {
                  return SliverFillRemaining(
                    child: NoDataScreen(
                        imagePath: ImagePath.imagesNoFavorite,
                        title: S.of(context).NO_Favorite_Yet,
                        subTitle: S.of(context).You_havent_marked_any_favorite),
                  );
                } else {
                  final descriptions = allFavorite
                      .map((doc) =>
                          doc.service?.name ??
                          '') // If name is null, use an empty string
                      .toList();
                  final ids = allFavorite
                      .map((doc) =>
                          doc.service?.id ??
                          '') // If name is null, use an empty string
                      .toList();
                  final name = allFavorite
                      .map((doc) =>
                          doc.service?.name ??
                          '') // If name is null, use an empty string
                      .toList();
                  final prices = allFavorite
                      .map((doc) =>
                          doc.service?.price?.toString() ??
                          '') // If price is null, use an empty string
                      .toList();
                  final firstImages = allFavorite
                      .map((doc) => (doc.service?.images?.isNotEmpty ?? false)
                          ? doc.service?.images!.first
                          : '')
                      .toList();
                  final locationList = allFavorite.map(
                    (doc) {
                      final city = doc.service?.location?.city ?? "";
                      final country = doc.service?.location?.country ?? "";
                      return "$city, $country"
                          .trim()
                          .replaceAll(RegExp(r'^, |, $'), '');
                    },
                  ).toList();
                  return ServiceItemList(
                    length: allFavorite.length,
                    des: descriptions,
                    image: firstImages.whereType<String>().toList(),
                    location: locationList,
                    name: name,
                    price: prices.whereType<String>().toList(),
                    rate: const [],
                    id: ids,
                  );
                }
              } else {
                return const SliverToBoxAdapter(child: CustomErrorWidgets());
              }
            },
          ),
          SliverToBoxAdapter(
            child: 50.kh,
          )
        ],
      ),
    );
  }
}
