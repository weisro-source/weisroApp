part of 'get_in_progress_orders_cubit.dart';

@immutable
sealed class GetInProgressOrdersState {}

final class GetInProgressOrdersInitial extends GetInProgressOrdersState {}

final class GetInProgressOrdersLoading extends GetInProgressOrdersState {}

final class GetInProgressOrdersSuccess extends GetInProgressOrdersState {
  final Orders orders;

  GetInProgressOrdersSuccess({required this.orders});
}

final class GetInProgressOrdersFailures extends GetInProgressOrdersState {}
