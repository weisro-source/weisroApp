import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weisro/core/assets_path/image_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/constant.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/location_widget.dart';
import 'package:weisro/core/widgets/rate_widget.dart';

class OrderItemWidget extends StatelessWidget {
  /// A widget that represents a single order item in a list.
  ///
  /// This widget is designed to display key details of an order, including:
  /// - An image of the service or item.
  /// - The server name and order ID.
  /// - The date, price, and a short description.
  /// - Location and rating widgets.
  ///
  /// Typically used in lists or grids to present summarized information
  /// for an order.
  ///
  /// Requires a parent [Material] widget for proper styling.
  ///
  /// Example usage:
  /// ```dart
  /// OrderItemWidget()
  /// ```
  const OrderItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115,
      margin: const EdgeInsetsDirectional.symmetric(horizontal: 24),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: AppColors.second2Color, width: 1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              child: CachedNetworkImage(
            imageUrl: Constants.imageUrl,
            width: 105,
            height: 82,
            fit: BoxFit.scaleDown,
            errorWidget: (context, url, error) {
              return Image.asset(
                ImagePath.imagesService,
                width: 105,
                height: 82,
                fit: BoxFit.scaleDown,
              );
            },
          )),
          8.kw,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                16.kh,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Server Name",
                      style: AppStyles.style10w400Grey(context),
                    ),
                    const Spacer(),
                    Text("ID:#52596", style: AppStyles.style8w600Grey(context))
                  ],
                ),
                8.kh,
                Row(
                  children: [
                    Text("7/12/2024", style: AppStyles.style8w600Grey(context)),
                    const Spacer(),
                    Text(
                      "\$200",
                      style: AppStyles.style10w500Orange(context),
                    )
                  ],
                ),
                10.kh,
                Text(
                  "Lorem ipsum dolor sit amet",
                  style: AppStyles.style8w400Grey2(context),
                ),
                4.kh,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    LocationWidget(
                      iconHeight: 11,
                      iconWidth: 8,
                      space: 4.kw,
                      styleLocationText: AppStyles.style10w400Grey(context),
                    ),
                    const Spacer(),
                    const RateWidget()
                  ],
                ),
              ],
            ),
          ),
          18.kw,
        ],
      ),
    );
  }
}
