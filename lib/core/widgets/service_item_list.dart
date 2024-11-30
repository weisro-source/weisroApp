import 'package:flutter/material.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/service_item_shimmer.dart';
import 'package:weisro/feature/favorite/data/models/favorite_model.dart';
import 'package:weisro/feature/services/presentation/view/pages/services_details_page_view.dart';

import 'service_item.dart';

class ServiceItemList extends StatelessWidget {
  const ServiceItemList({
    super.key,
    required this.allFavorite,
  });
  final List<Docs> allFavorite;
  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: allFavorite.length,
      itemBuilder: (context, index) {
        ///handel one favorite service
        var favoriteService = allFavorite[index];
        return GestureDetector(
          onTap: () {
            HelperFunctions.navigateToScreen(
              context,
              (context) => ServicesDetailsPageView(
                  serviceId: favoriteService.service?.id ?? ""),
            );
          },
          child: ServiceItem(
            favoriteService: favoriteService,
          ),
        );
      },
      separatorBuilder: (context, index) {
        return 16.kh;
      },
    );
  }
}

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
