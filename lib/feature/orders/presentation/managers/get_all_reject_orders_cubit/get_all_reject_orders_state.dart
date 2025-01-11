part of 'get_all_reject_orders_cubit.dart';

@immutable
sealed class GetAllRejectOrdersState {}

final class GetAllRejectOrdersInitial extends GetAllRejectOrdersState {}

final class GetAllRejectOrdersLoading extends GetAllRejectOrdersState {}

final class GetAllRejectOrdersFailures extends GetAllRejectOrdersState {}

final class GetAllRejectOrdersSuccess extends GetAllRejectOrdersState {}
