import 'package:flutter/material.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/feature/ads/data/models/ads_model.dart';
import 'package:weisro/feature/profile/presentation/view/widgets/ads_widget_for_user.dart';

class UserPostsListView extends StatelessWidget {
  const UserPostsListView({
    super.key,
    required this.allUserAds,
  });
  final List<Docs> allUserAds;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => 20.kh,
      itemCount: allUserAds.length,
      // itemCount: 100,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        Docs ad = allUserAds[index];
        return AdsWidgetForUser(ad: ad);
      },
    );
  }
}

class UserPostsListViewShimmer extends StatelessWidget {
  const UserPostsListViewShimmer({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => 20.kh,
      itemCount: 5,
      // itemCount: 100,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return const AdsUserWidgetShimmer();
      },
    );
  }
}
