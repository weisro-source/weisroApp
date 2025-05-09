import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/assets_path/image_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/feature/home/data/models/last_service_model.dart';
import 'package:weisro/feature/services/presentation/view/pages/services_details_page_view.dart';

class RecommendedServicesList extends StatelessWidget {
  const RecommendedServicesList({
    super.key,
    required this.lastServices,
  });
  final List<Docs> lastServices;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var service = lastServices[index];
          return GestureDetector(
            onTap: () => HelperFunctions.navigateToScreen(
              context,
              (context) => ServicesDetailsPageView(
                serviceId: service.id ?? "",
              ),
            ),
            child: Container(
              width: 172,
              height: 126,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.shadow2Color,
                    blurRadius: 4,
                    offset: Offset(0, 1),
                    spreadRadius: 0,
                  )
                ],
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: AppColors.second2Color, width: 1),
              ),
              child: Column(
                children: [
                  10.kh,
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.symmetric(horizontal: 17),
                    child: Stack(
                      children: [
                        AspectRatio(
                          aspectRatio: 138 / 71,
                          child: CachedNetworkImage(
                            imageUrl: service.images?.first ?? "",
                            fit: BoxFit.cover,
                            errorWidget: (context, url, error) {
                              return Image.asset(ImagePath.imagesService,
                                  fit: BoxFit.cover);
                            },
                          ),
                        ),
                        Positioned(
                            right: 0,
                            top: 2,
                            child: Container(
                              height: 18,
                              width: 18,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.shadow2Color,
                                    blurRadius: 4,
                                    offset: Offset(0, 1),
                                  )
                                ],
                              ),
                              child: IconButton(
                                padding: EdgeInsetsDirectional.zero,
                                onPressed: () {},
                                icon:
                                    SvgPicture.asset(IconsPath.iconsFavService),
                              ),
                            )),
                      ],
                    ),
                  ),
                  5.kh,
                  Row(
                    children: [
                      17.kw,
                      Text(
                        service.name ?? "",
                        style: AppStyles.style8w400Grey2(context)
                            .copyWith(color: AppColors.second2Color),
                      ),
                      // const Spacer(),
                      // Text(
                      //  service.name,
                      //   style: AppStyles.style10w400Grey(context)
                      //       .copyWith(color: AppColors.orangeColor),
                      // ),
                      // 5.kw,
                      // SvgPicture.asset(IconsPath.iconsStar),
                      // 17.kw,
                    ],
                  ),
                  12.kh,
                  Row(
                    children: [
                      15.kw,
                      SvgPicture.asset(IconsPath.iconsLocation),
                      3.kw,
                      Text(
                        service.location?.city ?? "",
                        style: AppStyles.style8w400Grey2(context)
                            .copyWith(color: AppColors.greyColor),
                      ),
                      const Spacer(),
                      Text(
                        "\$${service.price}",
                        style: AppStyles.style8w600Orange(context),
                      ),
                      17.kw,
                    ],
                  )
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return 8.kw;
        },
        itemCount: lastServices.length);
  }
}
