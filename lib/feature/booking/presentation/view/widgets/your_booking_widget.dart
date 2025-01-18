import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weisro/core/assets_path/image_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/feature/booking/data/models/your_booking_model.dart';
import 'package:weisro/generated/l10n.dart';

class YourBookingWidget extends StatelessWidget {
  const YourBookingWidget({
    super.key,
    required this.booking,
  });

  final Docs booking;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: AppColors.orangeColor, width: 1),
        ),
        child: Row(
          children: [
            30.kw,
            SizedBox(
              width: 90.0, // Fixed size for the image
              child: CachedNetworkImage(
                imageUrl: HelperFunctions.ensureIsFirstItemOrNull(
                        booking.service?.images ?? []) ??
                    "",
                errorWidget: (context, url, error) {
                  return Image.asset(ImagePath.imagesService);
                },
              ),
            ),
            20.kw, // Spacer
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.kh,
                  Text(
                    "${S.of(context).ID} : ${booking.id ?? ""}",
                    style: AppStyles.style12w400Second2(context),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  10.kh,
                  Text(
                    "${S.of(context).Total_Price} : ${booking.totalPrice ?? ""}",
                    style: AppStyles.style12w400Second2(context),
                  ),
                  10.kh,
                  Text(
                    "${S.of(context).Payment_Method} : ${booking.paymentMethod ?? ""}",
                    style: AppStyles.style12w400Second2(context),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
