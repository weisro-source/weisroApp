import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/assets_path/image_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/generated/l10n.dart';

import '../../../../../core/widgets/custom_app_bar.dart';

class FavoritePageViewBody extends StatelessWidget {
  const FavoritePageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomAppBar(
          title: S.of(context).Favorite_page,
        ),
        SliverToBoxAdapter(
          child: 36.kh,
        ),
        SliverList.separated(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              width: 342, // Set a fixed width here
              height: 84,
              margin: const EdgeInsetsDirectional.symmetric(horizontal: 24),
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 11),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side:
                      const BorderSide(width: 1, color: AppColors.second2Color),
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
                mainAxisSize: MainAxisSize.min, // Shrink-wrap the row
                children: [
                  Expanded(
                    flex: 1,
                    child: Image.asset(
                      ImagePath.imagesService,
                      width: 105,
                      height: 56,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  8.kw,
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.symmetric(vertical: 11),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Rent a car digging",
                                style: AppStyles.style10w400Grey(context),
                              ),
                              const Spacer(),
                              Text(
                                "4.5",
                                style: AppStyles.style10w400Grey(context)
                                    .copyWith(color: AppColors.orangeColor),
                              ),
                              5.kw,
                              SvgPicture.asset(IconsPath.iconsStar),
                              9.kw,
                            ],
                          ),
                          4.kh,
                          Row(
                            children: [
                              Text(
                                "Lorem ipsum dolor sit abet connecter.Lorem ipsum sit.",
                                style: AppStyles.style8w400Grey2(context),
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
                                "\$500",
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
          },
          separatorBuilder: (context, index) {
            return 16.kh;
          },
        ),
        SliverToBoxAdapter(
          child: 50.kh,
        )
      ],
    );
  }
}
