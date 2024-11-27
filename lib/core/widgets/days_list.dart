import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/core/utils/sized_box_extension.dart';
import 'package:weisro/feature/auth/data/worker_time.dart';
import 'package:weisro/feature/auth/register/presentation/manager/worker_day_cubit.dart';
import 'package:weisro/feature/auth/register/presentation/view/widgets/work_day.dart';

class DaysList extends StatelessWidget {
  const DaysList({
    super.key,
  });

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
            final day = WorkerTime.daysSelected(context).values.toList()[index];
            return BlocBuilder<WorkerDayCubit, List<String>>(
              builder: (context, selectedDays) {
                final isSelected =
                    context.read<WorkerDayCubit>().isSelected(day);
                return WorkDay(
                  day: day,
                  onTap: () => context.read<WorkerDayCubit>().toggleDay(day),
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
