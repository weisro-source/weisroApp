import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/assets_path/image_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';

import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/feature/favorite/data/models/favorite_model.dart';

import 'rate_widget.dart';

class ServiceItem extends StatelessWidget {
  const ServiceItem({
    super.key,
    required this.favoriteService,
    this.image,
    this.name,
    this.rate,
    this.des,
    this.location,
    this.price,
  });
  final Service favoriteService;
  final String? image, name, rate, des, location, price;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 342,
      height: 84,
      margin: const EdgeInsetsDirectional.symmetric(horizontal: 24),
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 11),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: AppColors.second2Color),
          borderRadius: BorderRadius.circular(4),
        ),
        shadows: const [
          BoxShadow(
            color: AppColors.shadow2Color,
            blurRadius: 4,
            offset: Offset(0, 1),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 1,
            child: CachedNetworkImage(
              imageUrl: image ?? "",
              width: 105,
              height: 56,
              fit: BoxFit.scaleDown,
              errorWidget: (context, url, error) {
                return Image.asset(
                  ImagePath.imagesService,
                  width: 105,
                  height: 56,
                  fit: BoxFit.scaleDown,
                );
              },
            ),
          ),
          8.kw,
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsetsDirectional.symmetric(vertical: 11),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        name ?? "",
                        style: AppStyles.style10w400Grey(context),
                      ),
                      const Spacer(),
                      RateWidget(
                        rate: rate ?? "",
                      ),
                      9.kw,
                    ],
                  ),
                  4.kh,
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Text(
                          des ?? "",
                          style: AppStyles.style8w400Grey2(context),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  8.kh,
                  Row(
                    children: [
                      SvgPicture.asset(IconsPath.iconsLocation),
                      2.kw,
                      Text(
                        location ?? "",
                        style: AppStyles.style10w400Grey(context),
                      ),
                      const Spacer(),
                      Text(
                        "\$$price",
                        style: AppStyles.style10w500Red(context)
                            .copyWith(color: AppColors.orangeColor),
                      ),
                      10.kw
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
