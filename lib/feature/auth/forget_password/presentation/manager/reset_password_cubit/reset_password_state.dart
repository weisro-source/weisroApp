part of 'reset_password_cubit.dart';

@immutable
sealed class ResetPasswordState {}

final class ResetPasswordInitial extends ResetPasswordState {}

final class ResetPasswordLoading extends ResetPasswordState {}

final class ResetPasswordSuccess extends ResetPasswordState {
  final String successMessage;

  ResetPasswordSuccess({required this.successMessage});
}

final class ResetPasswordFailures extends ResetPasswordState {
  final String errMessage;

  ResetPasswordFailures({required this.errMessage});
}
