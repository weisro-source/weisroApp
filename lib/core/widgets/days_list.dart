import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weisro/core/utils/sized_box_extension.dart';
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
        height: 40,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          clipBehavior: Clip.none,
          itemBuilder: (context, index) {
            final dayKey =
                WorkerTime.daysSelected(context).keys.toList()[index];
            final day = WorkerTime.daysSelected(context).values.toList()[index];
            return BlocBuilder<WorkerDayCubit, List<String>>(
              builder: (context, selectedDays) {
                bool isSelected = false;

                if (oneServiceDays != null && isReview != null && isReview!) {
                  isSelected = oneServiceDays?.contains(dayKey) ?? false;
                } else if (oneServiceDays != null) {
                  isSelected = oneServiceDays!.contains(dayKey);
                } else {
                  isSelected =
                      context.read<WorkerDayCubit>().isSelected(dayKey);
                }
                return WorkDay(
                  day: day,
                  onTap: () => oneServiceDays != null
                      ? null
                      : context.read<WorkerDayCubit>().toggleDay(dayKey),
                  isSelected: isSelected,
                );
              },
            );
          },
          separatorBuilder: (context, index) => 10.kw,
          itemCount: WorkerTime.daysSelected(context).length,
        ),
      ),
    );
  }
}
