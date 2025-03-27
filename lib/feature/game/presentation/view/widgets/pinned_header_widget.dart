import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/utils/constant.dart';
import 'package:weisro/core/widgets/my_pinned_header_delegate.dart';

class PinnedHeaderWidget extends StatelessWidget {
  final bool isSelectedRunningSpeculation;
  final Function(bool) onToggle;
  const PinnedHeaderWidget({
    Key? key,
    required this.isSelectedRunningSpeculation,
    required this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SliverPersistentHeader(
      pinned: true,
      delegate: MyPinnedHeaderDelegate(
        height: screenHeight * 0.06,
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
              _buildToggleButton("Running speculation", true),
              _buildToggleButton("Completed speculation", false),
            ],
          ),
        ),
      ),
    );
  }

  Expanded _buildToggleButton(String text, bool isRunningSpeculation) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onToggle(isRunningSpeculation),
        child: Container(
          decoration: BoxDecoration(
            color: isSelectedRunningSpeculation == isRunningSpeculation
                ? AppColors.darkMagentaGameColor
                : AppColors.whiteColor,
            borderRadius: BorderRadius.circular(33),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontFamily: Constants.gameFont3Family,
                fontSize: 13,
                color: isSelectedRunningSpeculation == isRunningSpeculation
                    ? AppColors.whiteColor
                    : AppColors.darkMagentaGameColor.withOpacity(0.3),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
