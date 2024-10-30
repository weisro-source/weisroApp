import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/widgets/dashed_line_painter.dart';

class CustomSteeperWidget extends StatelessWidget {
  const CustomSteeperWidget({
    super.key,
  });

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
                      dashWidth: 2.0,
                      dashSpace: 1.0,
                    ),
                    size: const Size(112, 2),
                  ),
                  Container(
                    width: 32,
                    height: 32,
                    decoration: const BoxDecoration(
                      color: AppColors.second1Color,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                        child: Text(
                      "2",
                      style: AppStyles.style20w500Seconder(context),
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
