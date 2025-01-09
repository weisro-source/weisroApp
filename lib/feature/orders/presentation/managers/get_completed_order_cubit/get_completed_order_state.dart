part of 'get_completed_order_cubit.dart';

@immutable
sealed class GetCompletedOrderState {}

final class GetCompletedOrderInitial extends GetCompletedOrderState {}

final class GetCompletedOrderLoading extends GetCompletedOrderState {}

final class GetCompletedOrderSuccess extends GetCompletedOrderState {}

final class GetCompletedOrderFailure extends GetCompletedOrderState {}
