import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServiceDayCubit extends Cubit<Map<String, Map<String, TimeOfDay?>>> {
  ServiceDayCubit() : super({});

  void toggleDay(String day) {
    final currentSelectedDays =
        Map<String, Map<String, TimeOfDay?>>.from(state);

    if (currentSelectedDays.containsKey(day)) {
      currentSelectedDays.remove(day); // Deselect if already selected
    } else {
      currentSelectedDays[day] = {
        'start': null,
        'end': null
      }; // Add with no time initially
    }
    emit(currentSelectedDays); // Update state
  }

  bool isSelected(String day) => state.containsKey(day);

  void updateTime(String day, TimeOfDay? startTime, TimeOfDay? endTime) {
    final updatedDays = Map<String, Map<String, TimeOfDay?>>.from(state);

    if (updatedDays.containsKey(day)) {
      updatedDays[day] = {'start': startTime, 'end': endTime};
    } else {
      updatedDays[day] = {'start': startTime, 'end': endTime};
    }

    emit(updatedDays); // Update the map with start and end times for that day
  }

  Map<String, Map<String, TimeOfDay?>> getSelectedDays() => state;
}
