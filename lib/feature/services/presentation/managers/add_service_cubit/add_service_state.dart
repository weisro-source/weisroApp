part of 'add_service_cubit.dart';

@immutable
sealed class AddServiceState {}

final class AddServiceInitial extends AddServiceState {}

final class AddServiceStateChanged extends AddServiceState {}

final class AddServiceStateLoading extends AddServiceState {}

final class AddServiceStateSuccess extends AddServiceState {}

final class AddServiceStateFailure extends AddServiceState {
  final Failure error;

  AddServiceStateFailure({required this.error});
}
