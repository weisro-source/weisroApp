part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginFailures extends LoginState {
  final String errMessage;

  LoginFailures({required this.errMessage});
}

final class LoginSuccess extends LoginState {
  final SuccessLoginModel successLoginModel;

  LoginSuccess({required this.successLoginModel});
}
