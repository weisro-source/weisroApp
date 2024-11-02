import 'package:flutter/material.dart';
import 'package:weisro/feature/auth/register/data/worker_time.dart';
import 'package:weisro/feature/auth/register/presentation/view/widgets/favorite_time_widget.dart';

class FavoriteTimeGridViewWidget extends StatelessWidget {
  const FavoriteTimeGridViewWidget({
    super.key,
    required this.favoritesTime,
  });
  final List<FavoriteTimeModel> favoritesTime;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
        itemCount: favoritesTime.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 152 / 38,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10),
        itemBuilder: (context, index) {
          return FavoriteTimeWidget(
            favoriteTimeModel: favoritesTime[index],
          );
        });
  }
}
