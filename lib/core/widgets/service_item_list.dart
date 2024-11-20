import 'package:flutter/material.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';

import 'service_item.dart';

class ServiceItemList extends StatelessWidget {
  const ServiceItemList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: 10,
      itemBuilder: (context, index) {
        return const ServiceItem();
      },
      separatorBuilder: (context, index) {
        return 16.kh;
      },
    );
  }
}
