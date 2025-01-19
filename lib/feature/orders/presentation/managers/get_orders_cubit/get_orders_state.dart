part of 'get_orders_cubit.dart';

@immutable
sealed class GetOrdersState {}

final class GetOrdersInitial extends GetOrdersState {}

final class GetOrdersLoading extends GetOrdersState {}

final class GetOrdersLoadingPagination extends GetOrdersState {}

final class GetOrdersSuccess extends GetOrdersState {
  final Orders orders;

  GetOrdersSuccess({required this.orders});
}

final class GetOrdersFailures extends GetOrdersState {
  final Failure error;

  GetOrdersFailures({required this.error});
}

final class GetOrdersFailuresPagination extends GetOrdersState {
  final Failure error;

  GetOrdersFailuresPagination({required this.error});
}
