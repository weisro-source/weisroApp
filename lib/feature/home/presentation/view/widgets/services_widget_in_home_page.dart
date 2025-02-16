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
import 'package:weisro/feature/home/presentation/managers/get_last_services_cubit/get_last_services_cubit.dart';
import 'package:weisro/feature/services/presentation/managers/add_service_to_favorite_cubit/add_service_to_favorite_cubit.dart';
import 'package:weisro/generated/l10n.dart';

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
      height: 184,
      width: 172,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: CachedNetworkImageProvider(
            "${Constants.imageUrl}${HelperFunctions.ensureIsFirstItemOrNull(widget.lastService.images ?? []) ?? ""}",
          ),
        ),
      ),
      child: Column(
        children: [
          //* Fav icon
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(top: 10, end: 10),
              child: InkWell(
                onTap: () async {
                  await AddServiceToFavoriteCubit.get(context)
                      .addServiceToFavorite(
                    context,
                    widget.lastService.id ?? "",
                  );

                  if (context.mounted) {
                    GetLastServicesCubit.get(context)
                        .changeFavorite(widget.lastService.id ?? "");
                  }
                },
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: const ShapeDecoration(
                    shape: CircleBorder(
                      side: BorderSide(color: AppColors.orangeColor),
                    ),
                    color: AppColors.whiteColor,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      height: 10,
                      width: 10,
                      widget.lastService.isFavorite == true
                          ? IconsPath.iconsIsFav
                          : IconsPath.iconsFavService,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          Container(
            height: 22,
            width: 132,
            decoration: BoxDecoration(
              color: AppColors.orangeColor,
              borderRadius: BorderRadius.circular(24),
              // boxShadow: const [
              //   BoxShadow(
              //     color: AppColors.orangeColor,
              //     offset: Offset(0, 2),
              //     blurRadius: 0,
              //     spreadRadius: 0,
              //   ),
              // ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "\$${widget.lastService.price}",
                  style: AppStyles.style10w500Red(context)
                      .copyWith(color: AppColors.whiteColor),
                ),
                20.kw,

                Text(
                  S.of(context).Per_Day,
                  style: AppStyles.style10w500Red(context)
                      .copyWith(color: AppColors.whiteColor),
                ),
                // Row(
                //   children: [
                //     SvgPicture.asset(IconsPath.iconsLocation),
                //     Expanded(
                //       child: Text(
                //         "${widget.lastService.location?.country ?? ""} ${widget.lastService.location?.city ?? ""}",
                //         overflow: TextOverflow.ellipsis,
                //         style: AppStyles.style8w400Grey2(context)
                //             .copyWith(color: AppColors.greyColor),
                //       ),
                //     ),
                //   ],
                // ),
                2.kh
              ],
            ),
          ),
        ],
      ),
    );
  }
}
