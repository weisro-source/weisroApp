import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/widgets/dashed_line_painter.dart';

class CustomSteeperWidget extends StatelessWidget {
  const CustomSteeperWidget({
    super.key,
    required this.isTowStepActive,
  });
  final bool isTowStepActive;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 100,
        child: Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: const BoxDecoration(
                      color: AppColors.orangeColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                        child: Text(
                      "1",
                      style: AppStyles.style20w500White(context),
                    )),
                  ),
                  CustomPaint(
                    painter: DashedLinePainter(
                      color: AppColors.second2Color,
                      dashWidth: 1.0,
                      dashSpace: 2.0,
                    ),
                    size: const Size(112, 2),
                  ),
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: isTowStepActive
                          ? AppColors.orangeColor
                          : AppColors.second1Color,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                        child: Text(
                      "2",
                      style: AppStyles.style20w500Seconder(context).copyWith(
                          color: isTowStepActive
                              ? AppColors.whiteColor
                              : AppColors.second2Color),
                    )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
