import 'package:flutter/material.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/feature/profile/presentation/view/widgets/ads_user_widget_shimmer.dart';

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
