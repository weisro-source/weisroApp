import 'package:flutter/material.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/service_item_shimmer.dart';

class ServiceItemListShimmer extends StatelessWidget {
  const ServiceItemListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: 30,
      itemBuilder: (context, index) {
        return const ServiceItemShimmer();
      },
      separatorBuilder: (context, index) {
        return 16.kh;
      },
    );
  }
}
