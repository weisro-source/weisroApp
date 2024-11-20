import 'package:flutter_bloc/flutter_bloc.dart';

class WorkerDayCubit extends Cubit<List<String>> {
  WorkerDayCubit() : super([]);

  void toggleDay(String day) {
    final currentSelectedDays = List<String>.from(state);

    if (currentSelectedDays.contains(day)) {
      currentSelectedDays.remove(day); // Deselect if already selected
    } else {
      currentSelectedDays.add(day); // Select if not already selected
    }
    emit(currentSelectedDays); // Update state
  }

  bool isSelected(String day) => state.contains(day); // Check if selected
}
