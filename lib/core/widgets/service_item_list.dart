import 'package:flutter/material.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
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
      itemCount: length,
      itemBuilder: (context, index) {
        // Safely access list elements with null and range checks
        String getValueOrEmpty(List<String>? list, int idx) {
          return (list != null && idx < list.length) ? list[idx] : '';
        }

        return GestureDetector(
          onTap: () {
            HelperFunctions.navigateToScreen(
              context,
              (context) => ServicesDetailsPageView(
                serviceId: getValueOrEmpty(id, index),
              ),
            );
          },
          child: ServiceItem(
            favoriteService: const Service(),
            des: getValueOrEmpty(des, index),
            image: getValueOrEmpty(image, index),
            location: getValueOrEmpty(location, index),
            name: getValueOrEmpty(name, index),
            price: getValueOrEmpty(price, index),
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
