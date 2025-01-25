import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weisro/core/assets_path/image_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/location_widget.dart';
import 'package:weisro/core/widgets/rate_widget.dart';
import 'package:weisro/feature/orders/data/models/order_model.dart';

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
    required this.order,
  });
  final Order order;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: HelperFunctions.getScreenHight(context) * 0.16,
      margin: const EdgeInsetsDirectional.symmetric(horizontal: 24),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: AppColors.second2Color, width: 1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              child: CachedNetworkImage(
            imageUrl: HelperFunctions.ensureIsFirstItemOrNull(
                    order.service?.images ?? []) ??
                "",
            width: 105,
            height: 82,
            fit: BoxFit.scaleDown,
            errorWidget: (context, url, error) {
              return Image.asset(ImagePath.imagesService,
                  width: 105, height: 82, fit: BoxFit.scaleDown);
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
                      order.service?.name ?? "",
                      style: AppStyles.style10w400Grey(context),
                    ),
                    const Spacer(),
                  ],
                ),
                8.kh,
                Text("ID:#${order.service?.id ?? ""}",
                    style: AppStyles.style8w600Grey(context)),
                8.kh,
                Row(
                  children: [
                    Text(order.createdAt?.substring(0, 10) ?? "",
                        style: AppStyles.style8w600Grey(context)),
                    const Spacer(),
                    Text(
                      "\$${order.totalPrice}",
                      style: AppStyles.style10w500Orange(context),
                    )
                  ],
                ),
                // 10.kh,
                // Text(
                //   "Lorem ipsum dolor sit",
                //   style: AppStyles.style8w400Grey2(context),
                // ),
                10.kh,
                Text(
                  order.address?.id ?? "",
                  textAlign: TextAlign.start,
                  style: AppStyles.style12w400Grey(context),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                RateWidget(
                  rate: order.service?.rate.toString() ?? "",
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
