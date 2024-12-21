import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/feature/ads/data/models/ads_model.dart';
import 'package:weisro/feature/ads/presentation/managers/get_user_ads_cubit/get_user_ads_cubit.dart';
import 'package:weisro/generated/l10n.dart';

import '../widgets/user_posts_list_view.dart';
import '../widgets/user_posts_list_view_shimmer.dart';

class UserAdsPageViewBody extends StatefulWidget {
  const UserAdsPageViewBody({super.key});

  @override
  State<UserAdsPageViewBody> createState() => _UserAdsPageViewBodyState();
}

@override
class _UserAdsPageViewBodyState extends State<UserAdsPageViewBody> {
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
        await BlocProvider.of<GetUserAdsCubit>(context)
            .getUserAds(pageNumber: nextPage++);
        isLoading = false;
      }
    }
  }

  List<Docs> allAds = [];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: [
          24.kh,
          Padding(
            padding: HelperFunctions.symmetricHorizontalPadding24,
            child: Text(
              S.of(context).YourPosts,
              style: AppStyles.style18w500Grey(context),
            ),
          ),
          24.kh,
          BlocConsumer<GetUserAdsCubit, GetUserAdsState>(
            listener: (context, getUserAdsState) {
              if (getUserAdsState is GetUserAdsSuccess) {
                allAds.addAll(getUserAdsState.allAds.docs ?? []);
                hasNext = getUserAdsState.allAds.hasNextPage ?? false;
              }
            },
            builder: (context, getUserAdsState) {
              if (getUserAdsState is GetUserAdsSuccess ||
                  getUserAdsState is GetUserAdsPaginationLoading ||
                  getUserAdsState is GetUserAdsPaginationFailures) {
                return Padding(
                  padding: HelperFunctions.symmetricHorizontalPadding24,
                  child: UserPostsListView(
                    allUserAds: allAds,
                  ),

                );
              } else if (getUserAdsState is GetUserAdsLoading) {
                return Padding(
                  padding: HelperFunctions.symmetricHorizontalPadding24,
                  child: const UserPostsListViewShimmer(),
                );
              } else {
                return const SizedBox();
              }
            },
          )
        ],
      ),
    );
  }
}
