import 'package:flutter/material.dart';
import 'package:weisro/core/assets_path/image_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/utils/constant.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/feature/game/presentation/view/pages/my_coupons_view.dart';

import '../widgets/linear_text.dart';

class MainPageGameBody extends StatelessWidget {
  const MainPageGameBody({super.key});
  @override
  Widget build(BuildContext context) {
    final List<String> order = ["BIG WIN", "600", "200", "100"];

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            width: double.infinity,
            height: 289,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImagePath.imagesHeaderImage),
              ),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "WEISRO",
                  style: TextStyle(
                    fontSize: 96,
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w700,
                    fontFamily: Constants.gameFontFamily,
                  ),
                ),
                Text(
                  "GUESS AND WIN",
                  style: TextStyle(
                    fontSize: 30,
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ),
        ),
        40.sKh,
        SliverList.separated(
          itemCount: order.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                HelperFunctions.navigateToScreen(
                  context,
                  (context) => const MyCouponsPageView(),
                );
              },
              child: Container(
                width: HelperFunctions.getScreenWidth(context),
                height: 220,
                margin: EdgeInsetsDirectional.symmetric(
                    horizontal: HelperFunctions.getScreenWidth(context) * 0.05),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImagePath.imagesCouponPlayer),
                  ),
                ),
                child: Column(
                  children: [
                    20.kh,
                    LinearText(
                      title: order[index],
                      textSize: 66,
                    ),
                    20.kh,
                    Stack(
                      children: [
                        Image.asset(ImagePath.imagesPositionImage),
                        Positioned(
                          top: HelperFunctions.getScreenHight(context) * 0.01,
                          left: HelperFunctions.getScreenWidth(context) * 0.06,
                          child: LinearText(
                            title: "${index + 1}",
                            textSize: 27,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => 25.kh,
        ),
        30.sKh,
      ],
    );
  }
}
