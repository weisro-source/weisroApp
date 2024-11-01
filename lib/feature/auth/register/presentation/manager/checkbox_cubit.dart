import 'package:bloc/bloc.dart';

class CheckboxCubit extends Cubit<bool> {
  CheckboxCubit() : super(false);

  // Toggles the checkbox state
  void toggleCheckbox(bool isChecked) => emit(isChecked);
}
