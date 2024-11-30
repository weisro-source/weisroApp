part of 'get_last_services_cubit.dart';

@immutable
sealed class GetLastServicesState {}

final class GetLastServicesInitial extends GetLastServicesState {}

final class GetLastServicesLoading extends GetLastServicesState {}

final class GetLastServicesSuccess extends GetLastServicesState {
  final LastServicesModel lastServices;

  GetLastServicesSuccess({required this.lastServices});
}

final class GetLastServicesFailures extends GetLastServicesState {
  final Failure error;

  GetLastServicesFailures({required this.error});
}
