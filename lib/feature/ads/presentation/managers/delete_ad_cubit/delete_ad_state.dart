part of 'delete_ad_cubit.dart';

@immutable
sealed class DeleteAdState {}

final class DeleteAdInitial extends DeleteAdState {}

final class DeleteAdLoading extends DeleteAdState {}

final class DeleteAdSuccess extends DeleteAdState {
  final String successMessage;

  DeleteAdSuccess({required this.successMessage});
}

final class DeleteAdFailures extends DeleteAdState {
  final Failure error;

  DeleteAdFailures({required this.error});
}
