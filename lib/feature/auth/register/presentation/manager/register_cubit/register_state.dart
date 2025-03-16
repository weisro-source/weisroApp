part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterSuccess extends RegisterState {
  final SuccessRegisterModel successRegister;

  RegisterSuccess({required this.successRegister});
}

final class RegisterGoogleSuccess extends RegisterState {
  final SuccessLoginModel successLoginModel;

  RegisterGoogleSuccess({required this.successLoginModel});
}

final class RegisterFailures extends RegisterState {
  final String errMessage;

  RegisterFailures({required this.errMessage});
}

class RegisterUpdated extends RegisterState {
  final List<String> selectedDays;
  RegisterUpdated(this.selectedDays);
}
