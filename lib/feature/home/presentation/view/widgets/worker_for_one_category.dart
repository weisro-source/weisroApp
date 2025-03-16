import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/assets_path/image_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/constant.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/feature/services/data/models/service_model.dart';
import 'package:weisro/feature/services/presentation/view/pages/services_details_page_view.dart';
import 'package:weisro/feature/worker/data/models/workers_for_category_model.dart';
import 'package:weisro/feature/worker/presentation/view/pages/worker_details_page_view.dart';

class WorkerForOneService extends StatelessWidget {
  const WorkerForOneService({
    super.key,
    required this.isRateVisibility,
    required this.isAgeVisibility,
    required this.image,
    required this.name,
    required this.location,
    required this.price,
    this.age,
    this.rate,
    required this.id,
    required this.type,
    this.tags,
    this.images,
    this.days,
    this.description,
  });
  final bool isRateVisibility, isAgeVisibility;
  final String image, name, location, price, id, type;
  final String? age, rate, description;
  final List<Tag>? tags;
  final List<String>? images;
  final List<Day>? days;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HelperFunctions.navigateToScreen(
            context,
            (context) => type == Constants.categoryTypeServices
                ? ServicesDetailsPageView(
                    serviceId: id,
                  )
                : WorkerDetailsPageView(
                    id: id,
                    location: location,
                    name: name,
                    price: price,
                    type: type,
                    image: image,
                    age: age ?? "",
                    rate: rate ?? "",
                    tags: tags,
                    images: images,
                    description: description,
                  ));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            border: Border.all(width: 1, color: AppColors.orangeColor)),
        child: Column(
          children: [
            13.kh,
            Stack(
              alignment: Alignment.center,
              children: [
                CachedNetworkImage(
                  imageUrl: HelperFunctions.addImageNameForUrl(image),
                  width: 136,
                  height: 99,
                  fit: BoxFit.cover,
                  placeholder: (context, url) {
                    return Shimmer.fromColors(
                        baseColor: AppColors.shimmerBaseColor,
                        highlightColor: AppColors.shimmerHighlightColor,
                        child: const SizedBox(
                          width: 136,
                          height: 99,
                        ));
                  },
                  errorWidget: (context, url, error) {
                    return Image.asset(
                      ImagePath.imagesService3,
                      width: 136,
                      height: 99,
                      fit: BoxFit.scaleDown,
                    );
                  },
                ),
                Visibility(
                  visible: isRateVisibility,
                  child: Positioned.directional(
                    textDirection: TextDirection.rtl,
                    top: 5,
                    end: 90,
                    child: Container(
                      width: 37,
                      height: 22,
                      decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4)),
                          border: Border.all(
                              width: 0.5, color: AppColors.orangeColor)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            IconsPath.iconsStar,
                            colorFilter: const ColorFilter.mode(
                                AppColors.orangeColor, BlendMode.srcIn),
                          ),
                          3.kw,
                          Text(
                            rate ?? "",
                            style: AppStyles.style10w500Red(context)
                                .copyWith(color: AppColors.orangeColor),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            6.kh,
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: AppStyles.style10w500Red(context)
                        .copyWith(color: AppColors.greyColor),
                  ),
                  Visibility(
                    visible: isAgeVisibility,
                    child: Text(
                      "36 Years",
                      style: AppStyles.style10w500Red(context)
                          .copyWith(color: AppColors.orangeColor),
                    ),
                  ),
                ],
              ),
            ),
            9.kh,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(IconsPath.iconsLocation),
                Text(
                  location,
                  style: AppStyles.style10w400Grey(context),
                )
              ],
            ),
            10.kh,
            Container(
              width: 132,
              height: 24,
              decoration: const BoxDecoration(
                  color: AppColors.whiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x35000000),
                      blurRadius: 4,
                      offset: Offset(0, -1),
                      spreadRadius: 0,
                    )
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              child: Center(
                  child: Text(
                "\$$price",
                style: AppStyles.style12w500Orange(context),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
