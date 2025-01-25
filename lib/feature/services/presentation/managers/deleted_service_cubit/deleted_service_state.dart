part of 'deleted_service_cubit.dart';

@immutable
sealed class DeletedServiceState {}

final class DeletedServiceInitial extends DeletedServiceState {}

final class DeletedServiceLoading extends DeletedServiceState {}

final class DeletedServiceSuccess extends DeletedServiceState {
  final String deletedSuccessMessage;

  DeletedServiceSuccess({required this.deletedSuccessMessage});
}

final class DeletedServiceFailures extends DeletedServiceState {
  final Failure error;

  DeletedServiceFailures({required this.error});
}
