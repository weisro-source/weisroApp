part of 'edit_user_info_cubit.dart';

@immutable
sealed class EditUserInfoState {}

final class EditUserInfoInitial extends EditUserInfoState {}

final class EditUserInfoLoading extends EditUserInfoState {}

final class EditUserInfoSuccess extends EditUserInfoState {
  final String message;

  EditUserInfoSuccess({required this.message});
}

final class EditUserInfoFailures extends EditUserInfoState {
  final Failure error;

  EditUserInfoFailures({required this.error});
}
