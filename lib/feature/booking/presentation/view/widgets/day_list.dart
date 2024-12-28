import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/feature/auth/data/worker_time.dart';
import 'package:weisro/feature/services/data/models/service_model.dart';

class DaysListWidget extends StatefulWidget {
  final List<Day>? days;
  final num dayPrice;
  final Function(num) onPriceChanged;

  const DaysListWidget({
    Key? key,
    required this.days,
    required this.dayPrice,
    required this.onPriceChanged,
  }) : super(key: key);

  @override
  DaysListWidgetState createState() => DaysListWidgetState();
}

class DaysListWidgetState extends State<DaysListWidget> {
  List<String> selectedDayModels = [];
  num totalDayPrice = 0.0;

  @override
  Widget build(BuildContext context) {
    final daysKeys = WorkerTime.daysSelected(context).keys.toList();
    final daysValues = WorkerTime.daysSelected(context).values.toList();

    return ListView.separated(
      key: const ValueKey("days"),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: daysKeys.length,
      separatorBuilder: (context, index) => 10.kh,
      itemBuilder: (context, index) {
        final dayKey = daysKeys[index];
        final dayValue = daysValues[index];
        final isContained =
            widget.days?.any((day) => day.day == dayKey) ?? false;

        final dayDate = HelperFunctions.getDateForDay(dayKey);
        final dayId = widget.days
                ?.firstWhere(
                  (day) => day.day == dayKey,
                  orElse: () => const Day(
                      day: "", start: "", end: "", id: "", available: false),
                )
                .id ??
            "";
        final isDaySelected = selectedDayModels.contains(dayId);

        return GestureDetector(
          onTap: isContained &&
                  (widget.days
                          ?.firstWhere(
                            (day) => day.day == dayKey,
                            orElse: () => const Day(
                                day: "",
                                start: "",
                                end: "",
                                id: "",
                                available: false),
                          )
                          .available ??
                      false)
              ? () {
                  setState(() {
                    if (selectedDayModels.contains(dayId)) {
                      selectedDayModels.remove(dayId);
                    } else {
                      selectedDayModels.add(dayId);
                    }
                  });
                  totalDayPrice = selectedDayModels.length * widget.dayPrice;
                  widget.onPriceChanged(totalDayPrice);
                }
              : null,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isDaySelected
                  ? AppColors.orangeColor
                  : (!isContained ||
                          !(widget.days
                                  ?.firstWhere(
                                    (day) => day.day == dayKey,
                                    orElse: () => const Day(
                                        day: "",
                                        start: "",
                                        end: "",
                                        id: "",
                                        available: false),
                                  )
                                  .available ??
                              false))
                      ? AppColors.redColor
                      : AppColors.whiteColor,
              border: Border.all(color: AppColors.orangeColor),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                20.kw,
                SvgPicture.asset(IconsPath.iconsFavTime),
                8.kw,
                Text(
                  dayValue,
                  style: AppStyles.style12w500Orange(context).copyWith(
                    color: _getTextColor(isContained, isDaySelected, dayKey),
                  ),
                ),
                8.kw,
                Text(
                  dayDate,
                  style: AppStyles.style12w500Orange(context).copyWith(
                    color: _getTextColor(isContained, isDaySelected, dayKey),
                  ),
                ),
                const Spacer(),
                Text(
                  isContained
                      ? "${widget.days?.firstWhere((day) => day.day == dayKey).start} - ${widget.days?.firstWhere((day) => day.day == dayKey).end}"
                      : "",
                  style: AppStyles.style10w400Second2(context).copyWith(
                    color: _getTextColor(isContained, isDaySelected, dayKey),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        );
      },
    );
  }

  Color _getTextColor(bool isContained, bool isDaySelected, String dayKey) {
    final isAvailable = widget.days
            ?.firstWhere(
              (day) => day.day == dayKey,
              orElse: () => const Day(
                  day: "", start: "", end: "", id: "", available: false),
            )
            .available ??
        false;

    if (!isContained || !isAvailable) {
      return AppColors.whiteColor;
    }
    return isDaySelected ? AppColors.whiteColor : AppColors.orangeColor;
  }
}
