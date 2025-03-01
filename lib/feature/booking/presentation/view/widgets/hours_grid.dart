import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';

class HoursGridWidget extends StatelessWidget {
  final List<String> timeSlots;
  final List<String> selectedHours;
  final Function(String) onHourSelected;

  const HoursGridWidget({
    Key? key,
    required this.timeSlots,
    required this.selectedHours,
    required this.onHourSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      key: const ValueKey("hours"),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 123 / 28,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: timeSlots.length,
      itemBuilder: (context, index) {
        final timeSlot = timeSlots[index];
        final isSelected = selectedHours.contains(timeSlot);

        return GestureDetector(
          onTap: () {
            onHourSelected(timeSlot);
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.orangeColor : AppColors.whiteColor,
              border: Border.all(color: AppColors.orangeColor),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(IconsPath.iconsFavTime),
                8.kw,
                Text(
                  timeSlot,
                  style: TextStyle(
                    color: isSelected
                        ? AppColors.whiteColor
                        : AppColors.orangeColor.withOpacity(0.7),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
