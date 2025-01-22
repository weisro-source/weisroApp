part of 'booking_pay_cubit.dart';

@immutable
sealed class BookingPayState {}

final class BookingPayInitial extends BookingPayState {}

final class BookingPayLoading extends BookingPayState {}

final class BookingPaySuccess extends BookingPayState {
  final String paymentLink;

  BookingPaySuccess({required this.paymentLink});
}

final class BookingPayFailures extends BookingPayState {
  final Failure error;

  BookingPayFailures({required this.error});
}
