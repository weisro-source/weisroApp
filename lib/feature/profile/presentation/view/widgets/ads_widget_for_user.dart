import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/feature/ads/data/models/ads_model.dart';

class AdsWidgetForUser extends StatelessWidget {
  const AdsWidgetForUser({
    super.key,
    required this.ad,
  });

  final Docs ad;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: AppColors.orangeColor, width: 1)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          10.kh,
          Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Text(
                ad.text ?? "",
                style: AppStyles.style12w400Grey(context)
                    .copyWith(color: AppColors.grey3Color),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Visibility(
              visible: ad.image != null,
              child: CachedNetworkImage(height: 87, imageUrl: ad.image ?? "")),
          5.kh
        ],
      ),
    );
  }
}
