import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/feature/auth/data/worker_time.dart';
import 'package:weisro/feature/auth/register/presentation/manager/register_cubit/register_cubit.dart';

class FavoriteTimeCubit extends Cubit<List<FavoriteTimeModel>> {
  FavoriteTimeCubit(List<FavoriteTimeModel> initialFavorites)
      : super(initialFavorites);
  final List<FavoriteTimeModel> _selectedTimes = [];
  void toggleFavoriteTime(
      FavoriteTimeModel timeModel, bool isTime, BuildContext context) {
    timeModel.isSelected = !timeModel.isSelected;

    if (timeModel.isSelected) {
      _selectedTimes.add(timeModel);
      if (isTime) {
        context
            .read<RegisterCubit>()
            .updateFavoriteTimes(timeModel.time ?? "", true);
      } else {
        context
            .read<RegisterCubit>()
            .updateFavoriteTimes(timeModel.hours, true);
      }
    } else {
      _selectedTimes.remove(timeModel);
      if (isTime) {
        context
            .read<RegisterCubit>()
            .updateFavoriteTimes(timeModel.time ?? "", false);
      } else {
        context
            .read<RegisterCubit>()
            .updateFavoriteTimes(timeModel.hours, false);
      }
    }

    emit(List<FavoriteTimeModel>.from(state)); // Update UI
  }

  // Retrieve only the selected favorite times
  List<FavoriteTimeModel> get selectedFavoriteTimes => _selectedTimes;
}
