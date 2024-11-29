part of 'get_user_info_cubit.dart';

@immutable
sealed class GetUserInfoState {}

final class GetUserInfoInitial extends GetUserInfoState {}

final class GetUserInfoLoading extends GetUserInfoState {}

final class GetUserInfoSuccess extends GetUserInfoState {
  final UserClientModel user;

  GetUserInfoSuccess({required this.user});
}

final class GetUserInfoFailures extends GetUserInfoState {
  final Failure error;

  GetUserInfoFailures({required this.error});
}
