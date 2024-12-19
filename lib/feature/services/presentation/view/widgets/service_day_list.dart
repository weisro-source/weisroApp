import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weisro/core/assets_path/icons_path.dart';
import 'package:weisro/core/styles/app_color.dart';
import 'package:weisro/core/styles/app_style.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/feature/auth/data/worker_time.dart';
import 'package:weisro/feature/services/presentation/managers/service_day_cubit.dart';
import 'package:weisro/generated/l10n.dart';

class ServiceDayList extends StatefulWidget {
  const ServiceDayList({super.key});

  @override
  State<ServiceDayList> createState() => _ServiceDayListState();
}

class _ServiceDayListState extends State<ServiceDayList> {
  TimeOfDay defaultStartTime = const TimeOfDay(hour: 7, minute: 0);
  TimeOfDay defaultEndTime = const TimeOfDay(hour: 19, minute: 0);

  Future<void> _pickTime(
      BuildContext context, String dayKey, String type) async {
    final currentTime = context.read<ServiceDayCubit>().state[dayKey]?[type];
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime:
          currentTime ?? (type == 'start' ? defaultStartTime : defaultEndTime),
    );
    if (context.mounted) {
      if (newTime != null) {
        if (type == 'start') {
          context
              .read<ServiceDayCubit>()
              .updateTime(dayKey, newTime, defaultEndTime);
          defaultStartTime = newTime;
        } else if (type == 'end') {
          context
              .read<ServiceDayCubit>()
              .updateTime(dayKey, defaultStartTime, newTime);
          defaultEndTime = newTime;
        }
      }
    }
  }

  /// toggle day in
  void _toggleDay(BuildContext context, String dayKey) {
    final cubit = context.read<ServiceDayCubit>();
    final state = cubit.state;

    if (state.containsKey(dayKey)) {
      // If already selected, deselect the day
      cubit.toggleDay(dayKey);
    } else {
      // If not selected, add the day with default times
      cubit.updateTime(dayKey, defaultStartTime, defaultEndTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: WorkerTime.daysSelected(context).length,
      itemBuilder: (context, index) {
        final dayKey = WorkerTime.daysSelected(context).keys.toList()[index];
        final day = WorkerTime.daysSelected(context).values.toList()[index];

        return BlocBuilder<ServiceDayCubit,
            Map<String, Map<String, TimeOfDay?>>>(builder: (context, state) {
          bool isSelected = state.containsKey(dayKey);
          final startTime = state[dayKey]?['start'] ?? defaultStartTime;
          final endTime = state[dayKey]?['end'] ?? defaultEndTime;

          return GestureDetector(
            onTap: () => _toggleDay(context, dayKey),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color:
                    isSelected ? AppColors.orangeColor : AppColors.whiteColor,
                border: Border.all(color: AppColors.orangeColor),
                borderRadius: BorderRadius.circular(8),
                boxShadow: isSelected
                    ? [
                        const BoxShadow(
                          color: AppColors.shadowColor,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        )
                      ]
                    : [],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(IconsPath.iconsFavTime),
                      8.kw,
                      AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 300),
                        style: TextStyle(
                          color: isSelected
                              ? AppColors.whiteColor
                              : AppColors.orangeColor.withOpacity(0.7),
                          fontWeight: FontWeight.bold,
                        ),
                        child: Text(day),
                      ),
                      const Spacer(),
                      if (isSelected) ...[
                        InkWell(
                          onTap: () => _pickTime(context, dayKey, 'start'),
                          child: AnimatedOpacity(
                            opacity: isSelected ? 1 : 0,
                            duration: const Duration(milliseconds: 300),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: AppColors.greyColor,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                  "${S.of(context).Start}: ${startTime.format(context)}",
                                  style: AppStyles.style12w400Black(context)
                                      .copyWith(color: AppColors.whiteColor)),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        InkWell(
                          onTap: () => _pickTime(context, dayKey, 'end'),
                          child: AnimatedOpacity(
                            opacity: isSelected ? 1 : 0,
                            duration: const Duration(milliseconds: 300),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: AppColors.greenColor,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                  "${S.of(context).End}: ${endTime.format(context)}",
                                  style: AppStyles.style12w400Black(context)
                                      .copyWith(color: AppColors.whiteColor)),
                            ),
                          ),
                        ),
                      ]
                    ],
                  ),
                ],
              ),
            ),
          );
        });
      },
      separatorBuilder: (context, index) => const SizedBox(height: 10),
    );
  }
}
