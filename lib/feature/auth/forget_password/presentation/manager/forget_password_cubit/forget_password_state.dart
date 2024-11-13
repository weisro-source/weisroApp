part of 'forget_password_cubit.dart';

@immutable
sealed class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}

final class ForgetPasswordLoading extends ForgetPasswordState {}

final class ForgetPasswordFailures extends ForgetPasswordState {
  final String errMessage;

  ForgetPasswordFailures({required this.errMessage});
}

final class ForgetPasswordSuccess extends ForgetPasswordState {}
