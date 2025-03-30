import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';

class SliverAppBarWidget extends StatelessWidget {
  const SliverAppBarWidget({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    double screenHeight = HelperFunctions.getScreenHight(context);
    return SliverAppBar(
      backgroundColor: const Color(0xFF101936),
      expandedHeight: screenHeight * 0.15,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsetsDirectional.only(top: 40, start: 10),
          child: Row(
            children: [
              20.kw,
              _buildBackButton(context),
              const Spacer(flex: 3),
              Text(title, style: AppStyles.style20w500White(context)),
              const Spacer(flex: 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: const ShapeDecoration(
        color: AppColors.whiteColor,
        shape: CircleBorder(),
      ),
      child: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        padding: EdgeInsets.zero,
        onPressed: () => HelperFunctions.navigateToBack(context),
      ),
    );
  }
}
