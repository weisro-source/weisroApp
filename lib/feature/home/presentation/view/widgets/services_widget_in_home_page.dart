import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/constant.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/feature/home/data/models/last_service_model.dart';
import 'package:weisro/feature/services/presentation/managers/add_service_to_favorite_cubit/add_service_to_favorite_cubit.dart';

class ServicesWidgetInHomePage extends StatefulWidget {
  const ServicesWidgetInHomePage({
    super.key,
    required this.lastService,
  });
  final Docs lastService;

  @override
  State<ServicesWidgetInHomePage> createState() =>
      _ServicesWidgetInHomePageState();
}

class _ServicesWidgetInHomePageState extends State<ServicesWidgetInHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 162,
      width: 172,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          image: DecorationImage(
              fit: BoxFit.scaleDown,
              image: CachedNetworkImageProvider(
                  "${Constants.imageUrl}${HelperFunctions.ensureIsFirstItemOrNull(widget.lastService.images ?? []) ?? ""}"))),
      child: Column(
        children: [
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(top: 10, end: 10),
              child: InkWell(
                onTap: () async {
                  await AddServiceToFavoriteCubit.get(context)
                      .addServiceToFavorite(
                          context, widget.lastService.id ?? "");
                },
                child: Container(
                    width: 20,
                    height: 20,
                    decoration: const ShapeDecoration(
                        shape: CircleBorder(
                            side: BorderSide(color: AppColors.orangeColor)),
                        color: AppColors.whiteColor),
                    child: Center(
                        child: SvgPicture.asset(IconsPath.iconsFavService))),
              ),
            ),
          ),
          const Spacer(),
          Container(
            height: 22,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(4), // Add border radius here
              boxShadow: const [
                BoxShadow(
                  color: AppColors.orangeColor,
                  offset: Offset(0, 2),
                  blurRadius: 0,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Row(
              children: [
                10.kw,
                Text(
                  "\$${widget.lastService.price}",
                  style: AppStyles.style10w500Red(context),
                ),
                const Spacer(),
                Row(
                  children: [
                    SvgPicture.asset(IconsPath.iconsLocation),
                    Text(
                      "October ,3322",
                      style: AppStyles.style8w400Grey2(context)
                          .copyWith(color: AppColors.greyColor),
                    ),
                    7.kw,
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
