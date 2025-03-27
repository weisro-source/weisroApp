import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import '../widgets/coupon_contain.dart';
import '../widgets/down_arrows_widget.dart';
import '../widgets/teams_list.dart';
import '../widgets/top_arrows_widget.dart';

class CouponListWidget extends StatefulWidget {
  const CouponListWidget({Key? key}) : super(key: key);

  @override
  State<CouponListWidget> createState() => _CouponListWidgetState();
}

class _CouponListWidgetState extends State<CouponListWidget> {
  List<bool> expandedStates = List.generate(15, (index) => false);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SliverList.separated(
      itemBuilder: (context, index) =>
          _buildCouponItem(screenHeight, screenWidth, index),
      separatorBuilder: (_, __) => 14.kh,
      itemCount: 15,
    );
  }

  Widget _buildCouponItem(double screenHeight, double screenWidth, int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      height: expandedStates[index]
          ? screenHeight * (0.18 + expandedStates.where((e) => e).length * 0.4)
          : screenHeight * 0.18,
      width: screenWidth,
      padding: EdgeInsetsDirectional.zero,
      margin: EdgeInsetsDirectional.symmetric(horizontal: screenWidth * 0.05),
      decoration: const BoxDecoration(
        color: AppColors.darkMagentaGameColor,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Column(
        children: [
          _buildCouponContain(screenHeight, screenWidth),
          5.kh,
          GestureDetector(
            onTap: () =>
                setState(() => expandedStates[index] = !expandedStates[index]),
            child: expandedStates[index]
                ? const TopArrowsWidget()
                : const DownArrowsWidget(),
          ),
          if (expandedStates[index]) ...[
            10.kh,
            const Expanded(child: TeamsList()),
            10.kh,
          ]
        ],
      ),
    );
  }

  Widget _buildCouponContain(double screenHeight, double screenWidth) {
    return Container(
      height: screenHeight * 0.13,
      width: screenWidth,
      decoration: const BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: const CouponContain(),
    );
  }
}
