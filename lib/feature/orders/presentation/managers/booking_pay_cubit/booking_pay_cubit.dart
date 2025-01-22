import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weisro/core/api/api_error_handler.dart';
import 'package:weisro/core/utils/service_locator.dart';
import 'package:weisro/feature/orders/data/order_repo/order_repo.dart';

part 'booking_pay_state.dart';

class BookingPayCubit extends Cubit<BookingPayState> {
  BookingPayCubit() : super(BookingPayInitial());

  Future<void> bookingPayment(String orderId) async {
    emit(BookingPayLoading());
    var result = await getIt.get<OrderRepository>().bookingPayApi(orderId);
    result.fold(
      (errorInPayment) {
        emit(BookingPayFailures(error: errorInPayment));
      },
      (paymentLink) {
        emit(BookingPaySuccess(paymentLink: paymentLink));
      },
    );
  }
}
