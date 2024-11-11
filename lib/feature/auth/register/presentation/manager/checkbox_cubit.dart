import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

class CheckboxCubit extends Cubit<Map<String, bool>> {
  CheckboxCubit() : super({});

  // Initialize the cubit with a given list of checkbox IDs, all set to false
  void initializeCheckboxes(List<String> checkboxIds) {
    emit({
      for (var id in checkboxIds) id: false,
    });
  }

  // Toggles a specific checkbox by its ID
  void toggleCheckbox(String checkboxId) {
    final currentState = state;
    if (currentState.containsKey(checkboxId)) {
      emit({
        ...currentState,
        checkboxId: !currentState[checkboxId]!,
      });
    }
  }

  // Retrieves the state of a specific checkbox
  bool isChecked(String checkboxId) {
    return state[checkboxId] ?? false;
  }
}
