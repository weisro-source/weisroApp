import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:weisro/core/assets_path/image_path.dart';
import 'package:weisro/core/enums/order_status.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
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
    required this.state,
  });
  final Order order;
  final String state;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: HelperFunctions.getScreenHight(context) * 0.25,
      margin: const EdgeInsetsDirectional.symmetric(horizontal: 24),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: AppColors.second2Color, width: 1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsetsDirectional.only(start: 10),
                child: CachedNetworkImage(
                  imageUrl: HelperFunctions.ensureIsFirstItemOrNull(
                          order.service?.images ?? []) ??
                      "",
                  width: 105,
                  height: 82,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) {
                    return Image.asset(ImagePath.imagesService,
                        width: 105, height: 82, fit: BoxFit.scaleDown);
                  },
                ),
              )),
          10.kw,
          Expanded(
            flex: 3,
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
                      style: AppStyles.style14w400Grey(context),
                    ),
                    const Spacer(),
                  ],
                ),
                8.kh,
                Text("ID:#${order.service?.id ?? ""}",
                    style: AppStyles.style14w400Grey(context)),
                8.kh,
                Text(order.createdAt?.substring(0, 10) ?? "",
                    style: AppStyles.style14w400Grey(context)),
                // const Spacer(),
                10.kh,

                Text(
                  "\$${order.totalPrice}",
                  style: AppStyles.style10w500Orange(context),
                ),
                10.kh,
                // Text(
                //   "Lorem ipsum dolor sit",
                //   style: AppStyles.style8w400Grey2(context),
                // ),
                // 10.kh,
                // Text(
                //   order.address?.id ?? "",
                //   textAlign: TextAlign.start,
                //   style: AppStyles.style12w400Grey(context),
                //   maxLines: 2,
                //   overflow: TextOverflow.ellipsis,
                // ),
                RateWidget(
                  rate: order.service?.rate.toString() ?? "",
                ),
              ],
            ),
          ),
          Visibility(
            visible: state == OrderStatus.inProgress.name,
            child: Expanded(
              flex: 2,
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    if (order.id != null) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return QrDialog(orderId: order.id ?? "");
                        },
                      );
                    }
                  },
                  child: Visibility(
                    visible: order.id != null,
                    child: QrImageView(
                      data: order.id ?? "Unknown ID",
                      version: QrVersions.auto,
                      size: 75.0,
                      eyeStyle: const QrEyeStyle(
                        eyeShape: QrEyeShape.square,
                        color: AppColors.orangeColor,
                      ),
                      errorStateBuilder: (cxt, err) {
                        return const Center(
                          child: Text(
                            "Unable to generate QR code",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.red, fontSize: 10),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
          18.kw,
        ],
      ),
    );
  }
}

class QrDialog extends StatelessWidget {
  const QrDialog({
    super.key,
    required this.orderId,
  });

  final String orderId;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "QR Code",
              style: AppStyles.style16w500Black(context),
            ),
            20.kh,
            QrImageView(
              data: orderId,
              version: QrVersions.auto,
              size: 200.0,
              eyeStyle: const QrEyeStyle(
                eyeShape: QrEyeShape.square,
                color: AppColors.orangeColor,
              ),
              errorStateBuilder: (cxt, err) {
                return const Center(
                  child: Text(
                    "Unable to generate QR code",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.red, fontSize: 10),
                  ),
                );
              },
            ),
            20.kh,
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(
                backgroundColor: AppColors.orangeColor,
                foregroundColor: Colors.white,
              ),
              child: const Text("Close"),
            ),
          ],
        ),
      ),
    );
  }
}
