import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/assets_path/image_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/constant.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/feature/favorite/data/models/favorite_model.dart';

import 'rate_widget.dart';

class ServiceItem extends StatelessWidget {
  const ServiceItem({
    super.key,
    required this.favoriteService,
  });
  final Service favoriteService;
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
              imageUrl:
                  "${Constants.imageUrl}${HelperFunctions.ensureIsFirstItemOrNull(favoriteService.images ?? []) ?? ""}",
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
                        favoriteService.name ?? "",
                        style: AppStyles.style10w400Grey(context),
                      ),
                      const Spacer(),
                      RateWidget(
                        rate: favoriteService.rate.toString(),
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
                          "Lorem ipsum dolor sit abet connecter. Lorem ipsum sit.",
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
                        "Oberamen , 3216",
                        style: AppStyles.style10w400Grey(context),
                      ),
                      const Spacer(),
                      Text(
                        "\$${favoriteService.price.toString()}",
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
