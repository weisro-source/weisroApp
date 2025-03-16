import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/core/utils/helper_functions.dart';
import 'package:weisro/feature/auth/data/worker_time.dart';
import 'package:weisro/feature/auth/register/presentation/manager/worker_day_cubit.dart';
import 'package:weisro/feature/auth/register/presentation/view/widgets/work_day.dart';

class DaysList extends StatelessWidget {
  const DaysList({
    super.key,
    this.oneServiceDays,
    this.isReview,
  });

  final List<String>? oneServiceDays;
  final bool? isReview;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        width: HelperFunctions.getScreenWidth(context) * 0.9,
        height: 40,
        child: BlocBuilder<WorkerDayCubit, List<String>>(
          builder: (context, selectedDays) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: WorkerTime.daysSelected(context).entries.map((entry) {
                  final dayKey = entry.key;
                  final day = entry.value;

                  bool isSelected = false;
                  if (oneServiceDays != null && isReview != null && isReview!) {
                    isSelected = oneServiceDays?.contains(dayKey) ?? false;
                  } else if (oneServiceDays != null) {
                    isSelected = oneServiceDays!.contains(dayKey);
                  } else {
                    isSelected =
                        context.read<WorkerDayCubit>().isSelected(dayKey);
                  }

                  return Padding(
                    padding: const EdgeInsetsDirectional.only(end: 3),
                    child: WorkDay(
                      day: day,
                      onTap: oneServiceDays != null
                          ? null
                          : () =>
                              context.read<WorkerDayCubit>().toggleDay(dayKey),
                      isSelected: isSelected,
                    ),
                  );
                }).toList(),
              ),
            );
          },
        ),
      ),
    );
  }
}
