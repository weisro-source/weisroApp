import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/assets_path/image_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/constant.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/feature/home/presentation/view/widgets/advertisement_widget.dart';
import '../widgets/search_bar.dart' as search;

class WorkersForOneServicePageViewBody extends StatelessWidget {
  const WorkersForOneServicePageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: AdvertisementWidget(),
        ),
        SliverToBoxAdapter(
          child: 28.kh,
        ),
        const SliverToBoxAdapter(
          child: search.SearchBar(isNotificationShow: false),
        ),
        SliverToBoxAdapter(
          child: 30.kh,
        ),
        SliverPadding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 24),
          sliver: SliverGrid.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 13,
                mainAxisSpacing: 13,
                childAspectRatio: 162 / 221),
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    border: Border.all(width: 1, color: AppColors.orangeColor)),
                child: Column(
                  children: [
                    13.kh,
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        CachedNetworkImage(
                          imageUrl: Constants.imageUrl,
                          width: 136,
                          height: 99,
                          fit: BoxFit.scaleDown,
                          errorWidget: (context, url, error) {
                            return Image.asset(
                              ImagePath.imagesWorker2,
                              width: 136,
                              height: 99,
                              fit: BoxFit.scaleDown,
                            );
                          },
                        ),
                        Positioned.directional(
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
                                  "4.5",
                                  style: AppStyles.style10w500Red(context)
                                      .copyWith(color: AppColors.orangeColor),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    6.kh,
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.symmetric(horizontal: 13),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Name Worker",
                            style: AppStyles.style10w500Red(context)
                                .copyWith(color: AppColors.greyColor),
                          ),
                          Text(
                            "36 Years",
                            style: AppStyles.style10w500Red(context)
                                .copyWith(color: AppColors.orangeColor),
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
                          "Oberamen German , 3216",
                          style: AppStyles.style10w400Grey(context),
                        )
                      ],
                    ),
                    10.kh,
                    Container(
                      width: 132,
                      height: 24,
                      decoration: BoxDecoration(
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
                        "\$5572 in ST",
                        style: AppStyles.style12w500Orange(context),
                      )),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        SliverToBoxAdapter(
          child: 65.kh,
        )
      ],
    );
  }
}