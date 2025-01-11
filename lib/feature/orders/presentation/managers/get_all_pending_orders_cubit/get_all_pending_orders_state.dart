part of 'get_all_pending_orders_cubit.dart';

@immutable
sealed class GetAllPendingOrdersState {}

final class GetAllPendingOrdersInitial extends GetAllPendingOrdersState {}

final class GetAllPendingOrdersLoading extends GetAllPendingOrdersState {}

final class GetAllPendingOrdersSuccess extends GetAllPendingOrdersState {}

final class GetAllPendingOrdersFailures extends GetAllPendingOrdersState {}
