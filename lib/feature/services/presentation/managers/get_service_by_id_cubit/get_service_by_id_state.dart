part of 'get_service_by_id_cubit.dart';

@immutable
sealed class GetServiceByIdState {}

final class GetServiceByIdInitial extends GetServiceByIdState {}

final class GetServiceByIdLoading extends GetServiceByIdState {}

final class GetServiceByIdSuccess extends GetServiceByIdState {
  final ServiceModel oneService;

  GetServiceByIdSuccess({required this.oneService});
}

final class GetServiceByIdFailures extends GetServiceByIdState {
  final Failure error;

  GetServiceByIdFailures({required this.error});
}
