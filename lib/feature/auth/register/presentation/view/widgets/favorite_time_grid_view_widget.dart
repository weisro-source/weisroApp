import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/feature/auth/data/worker_time.dart';
import 'package:weisro/feature/auth/register/presentation/manager/favorite_time_cubit.dart';
import 'package:weisro/feature/auth/register/presentation/view/widgets/favorite_time_widget.dart';

class FavoriteTimeGridViewWidget extends StatelessWidget {
  const FavoriteTimeGridViewWidget({
    super.key,
    required this.favoritesTime,
    required this.isTime,
  });
  final List<FavoriteTimeModel> favoritesTime;
  final bool isTime;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteTimeCubit(favoritesTime),
      child: BlocBuilder<FavoriteTimeCubit, List<FavoriteTimeModel>>(
        builder: (context, favoriteTimes) {
          return SliverGrid.builder(
            itemCount: favoriteTimes.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 152 / 38,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  context.read<FavoriteTimeCubit>().toggleFavoriteTime(
                      favoriteTimes[index], isTime, context);
                },
                child: FavoriteTimeWidget(
                  favoriteTimeModel: favoriteTimes[index],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
