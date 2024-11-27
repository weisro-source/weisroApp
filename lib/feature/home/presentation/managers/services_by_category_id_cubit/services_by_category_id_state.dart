part of 'services_by_category_id_cubit.dart';

@immutable
sealed class ServicesByCategoryIdState {}

final class ServicesByCategoryIdInitial extends ServicesByCategoryIdState {}

final class ServicesByCategoryIdLoading extends ServicesByCategoryIdState {}

final class ServicesByCategoryIdPaginationLoading
    extends ServicesByCategoryIdState {}

final class ServicesByCategoryIdSuccess extends ServicesByCategoryIdState {
  final AllServicesModel services;

  ServicesByCategoryIdSuccess({required this.services});
}

final class ServicesByCategoryIdFailures extends ServicesByCategoryIdState {
  final Failure failure;

  ServicesByCategoryIdFailures({required this.failure});
}

final class ServicesByCategoryIdPaginationFailures
    extends ServicesByCategoryIdState {
  final Failure failure;

  ServicesByCategoryIdPaginationFailures({required this.failure});
}
