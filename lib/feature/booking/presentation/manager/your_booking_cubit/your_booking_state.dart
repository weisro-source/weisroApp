part of 'your_booking_cubit.dart';

@immutable
sealed class YourBookingState {}

final class YourBookingInitial extends YourBookingState {}

final class YourBookingLoading extends YourBookingState {}

final class YourBookingPaginationLoading extends YourBookingState {}

final class YourBookingSuccess extends YourBookingState {
  final YourBookingModel bookingModel;

  YourBookingSuccess({required this.bookingModel});
}

final class YourBookingPaginationFailures extends YourBookingState {
  final Failure error;

  YourBookingPaginationFailures({required this.error});
}

final class YourBookingFailures extends YourBookingState {
  final Failure error;

  YourBookingFailures({required this.error});
}
