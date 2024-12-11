import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/assets_path/image_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/styles/style_functions.dart';
import 'package:weisro/core/utils/constant.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/core/widgets/custom_app_bar.dart';
import 'package:weisro/core/widgets/custom_text_form_filed.dart';
import 'package:weisro/feature/search/presentation/managers/cubit/search_cubit.dart';
import 'package:weisro/feature/search/presentation/view/pages/search_result_page_view.dart';
import 'package:weisro/generated/l10n.dart';

import '../../../../../core/widgets/search_icon.dart';
import '../widgets/search_result_item.dart';

class SearchPageBody extends StatelessWidget {
  const SearchPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          CustomAppBar(title: S.of(context).Search_Page),
          SliverToBoxAdapter(
            child: 28.kh,
          ),
          SliverToBoxAdapter(
            child: Container(
                width: HelperFunctions.getScreenWidth(context),
                height: 36,
                decoration: StyleFunctions.searchContainerDecoration(),
                margin: const EdgeInsetsDirectional.symmetric(horizontal: 24),
                child: CustomTextFormFiled(
                  hintText: S.of(context).Search,
                  borderColor: AppColors.orangeColor,
                  onFieldSubmitted: (_) {
                    HelperFunctions.navigateToScreen(
                        context,
                        (context) => SearchResultPageView(
                              cityName:
                                  context.read<SearchCubit>().searchController.text,
                            ));
                  },
                  prefixIcon: const SearchIcon(),
                )),
          ),
          SliverToBoxAdapter(
            child: 32.kh,
          ),
          SliverToBoxAdapter(
            child: Text(S.of(context).Recent_search,
                style: AppStyles.style14w400Orange(context)),
          ),
          SliverToBoxAdapter(
            child: 13.kh,
          ),
          SliverList.separated(
            itemCount: 5,
            itemBuilder: (context, index) {
              return const SearchResultItem();
            },
            separatorBuilder: (context, index) {
              return 11.kh;
            },
          ),
          SliverToBoxAdapter(
            child: 50.kh,
          ),
          SliverToBoxAdapter(
            child: Row(
              children: [
                24.kw,
                SvgPicture.asset(IconsPath.iconsRecommended),
                8.kw,
                Text(
                  S.of(context).Recommended_Near_You,
                  style: AppStyles.style14w400Orange(context),
                )
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: 10.kh,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 28),
              child: SizedBox(
                height: 130,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
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
                          border: Border.all(
                              color: AppColors.second2Color, width: 1),
                        ),
                        child: Column(
                          children: [
                            10.kh,
                            Padding(
                              padding: const EdgeInsetsDirectional.symmetric(
                                  horizontal: 17),
                              child: Stack(
                                children: [
                                  AspectRatio(
                                    aspectRatio: 138 / 71,
                                    child: CachedNetworkImage(
                                      imageUrl: Constants.imageUrl,
                                      fit: BoxFit.cover,
                                      errorWidget: (context, url, error) {
                                        return Image.asset(
                                            ImagePath.imagesService,
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
                                          icon: SvgPicture.asset(
                                              IconsPath.iconsFavService),
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
                                  "Rent a car digging ",
                                  style: AppStyles.style8w400Grey2(context)
                                      .copyWith(color: AppColors.second2Color),
                                ),
                                const Spacer(),
                                Text(
                                  "4.5",
                                  style: AppStyles.style10w400Grey(context)
                                      .copyWith(color: AppColors.orangeColor),
                                ),
                                5.kw,
                                SvgPicture.asset(IconsPath.iconsStar),
                                17.kw,
                              ],
                            ),
                            12.kh,
                            Row(
                              children: [
                                15.kw,
                                SvgPicture.asset(IconsPath.iconsLocation),
                                3.kw,
                                Text(
                                  "Oberamen , 3216",
                                  style: AppStyles.style8w400Grey2(context)
                                      .copyWith(color: AppColors.greyColor),
                                ),
                                const Spacer(),
                                Text(
                                  "\$600",
                                  style: AppStyles.style8w600Orange(context),
                                ),
                                17.kw,
                              ],
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return 8.kw;
                    },
                    itemCount: 4),
              ),
            ),
          )
        ],
      ),
    );
  }
}
