import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/constant.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';

class MyCouponsPageViewBody extends StatefulWidget {
  const MyCouponsPageViewBody({super.key});

  @override
  State<MyCouponsPageViewBody> createState() => _MyCouponsPageViewBodyState();
}

class _MyCouponsPageViewBodyState extends State<MyCouponsPageViewBody> {
  bool isSelectedRunningSpeculation = true; // Track which tab is selected

  @override
  Widget build(BuildContext context) {
    double screenHeight = HelperFunctions.getScreenHight(context);
    double screenWidth = HelperFunctions.getScreenWidth(context);

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: const Color(0xFF101936),
          expandedHeight: screenHeight * 0.15,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Padding(
              padding: const EdgeInsetsDirectional.only(top: 40, start: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  20.kw,
                  Container(
                    height: 30,
                    width: 30,
                    decoration: const ShapeDecoration(
                      color: AppColors.whiteColor,
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      icon:
                          const Icon(Icons.arrow_back_ios, color: Colors.black),
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        HelperFunctions.navigateToBack(context);
                      },
                    ),
                  ),
                  const Spacer(flex: 3),
                  Text(
                    "My Coupons",
                    style: AppStyles.style20w500White(context),
                  ),
                  const Spacer(flex: 4),
                ],
              ),
            ),
          ),
        ),
        28.sKh,
        SliverToBoxAdapter(
          child: Container(
            height: screenHeight * 0.06,
            width: screenWidth,
            margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(33),
            ),
            child: Row(
              children: [
                // First tab
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isSelectedRunningSpeculation = true;
                      });
                    },
                    child: Container(
                      height: screenHeight * 0.06,
                      decoration: BoxDecoration(
                        color: isSelectedRunningSpeculation
                            ? AppColors.darkMagentaGameColor
                            : AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(33),
                      ),
                      child: Center(
                        child: Text(
                          "Running speculation",
                          style: TextStyle(
                            fontFamily: Constants.gameFont3Family,
                            fontSize: 13,
                            color: isSelectedRunningSpeculation
                                ? AppColors.whiteColor
                                : AppColors.darkMagentaGameColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // Second tab
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isSelectedRunningSpeculation = false;
                      });
                    },
                    child: Container(
                      height: screenHeight * 0.06,
                      decoration: BoxDecoration(
                        color: isSelectedRunningSpeculation
                            ? AppColors.whiteColor
                            : AppColors.darkMagentaGameColor,
                        borderRadius: BorderRadius.circular(33),
                      ),
                      child: Center(
                        child: Text(
                          "Completed speculation",
                          style: TextStyle(
                            fontFamily: Constants.gameFont3Family,
                            fontSize: 13,
                            color: isSelectedRunningSpeculation
                                ? AppColors.darkMagentaGameColor
                                    .withOpacity(0.3)
                                : AppColors.whiteColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        21.sKh,
        SliverList.separated(
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: screenHeight * 0.178,
              width: screenWidth,
              padding: EdgeInsetsDirectional.zero,
              margin: EdgeInsetsDirectional.symmetric(
                  horizontal: screenWidth * 0.05),
              decoration: const BoxDecoration(
                  color: AppColors.darkMagentaGameColor,
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              child: Column(
                children: [
                  Container(
                    height: screenHeight * 0.13,
                    width: screenWidth,
                    decoration: const BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                  )
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return 14.kh;
          },
          itemCount: 15,
        )
      ],
    );
  }
}
