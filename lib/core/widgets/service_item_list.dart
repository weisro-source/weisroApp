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
    this.image,
    this.name,
    this.rate,
    this.des,
    this.location,
    this.price,
    required this.length,
    this.id,
  });
  final List<String>? image, name, rate, des, location, price, id;
  final int length;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      // itemCount: allFavorite.length,
      itemCount: length,
      itemBuilder: (context, index) {
        ///handel one favorite service
        // var favoriteService = allFavorite[index];
        return GestureDetector(
          onTap: () {
            HelperFunctions.navigateToScreen(
              context,
              (context) => ServicesDetailsPageView(serviceId: id?[index] ?? ""),
            );
          },
          child: ServiceItem(
            favoriteService: const Service(),
            des: des?[index],
            image: image?[index],
            location: location?[index],
            name: name?[index],
            price: price?[index],
            rate: "",
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
