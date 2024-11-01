import 'package:flutter/material.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';

class LabeledBorderBox extends StatelessWidget {
  final String label;

  const LabeledBorderBox({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 30,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            // Calculate text width
            final textPainter = TextPainter(
              text: TextSpan(
                text: label,
                style: AppStyles.style16w500Black(context),
              ),
              maxLines: 1,
              textDirection: TextDirection.ltr,
            )..layout();

            final double textWidth = textPainter.width;

            return Stack(
              children: [
                // Left Vertical Line
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: 2.0,
                    height: 28.0,
                    color: AppColors.orangeColor,
                  ),
                ),
                // Left Horizontal Line
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: 28,
                    height: 2.0,
                    color: AppColors.orangeColor,
                  ),
                ),
                // Right Vertical Line (positioned dynamically)
                Positioned(
                  left: textWidth + 20, // Dynamic position based on text width
                  top: 0,
                  child: Container(
                    width: 2.0,
                    height: 28.0,
                    color: AppColors.orangeColor,
                  ),
                ),
                // Right Horizontal Line (positioned dynamically)
                Positioned(
                  left:
                      textWidth + 20 - 26, // Dynamic position minus line width
                  bottom: 0,
                  child: Container(
                    width: 28,
                    height: 2.0,
                    color: AppColors.orangeColor,
                  ),
                ),
                // Text Widget
                Padding(
                  padding:
                      const EdgeInsetsDirectional.only(start: 10.0, top: 1),
                  child: Text(
                    label,
                    style: AppStyles.style16w500Black(context),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
