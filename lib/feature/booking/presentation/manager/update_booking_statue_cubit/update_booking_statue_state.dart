part of 'update_booking_statue_cubit.dart';

@immutable
sealed class UpdateBookingStatueState {}

final class UpdateBookingStatueInitial extends UpdateBookingStatueState {}

final class UpdateBookingStatueLoading extends UpdateBookingStatueState {}

final class UpdateBookingStatueSuccess extends UpdateBookingStatueState {}

final class UpdateBookingStatueFailures extends UpdateBookingStatueState {
  final Failure error;

  UpdateBookingStatueFailures({required this.error});
}
