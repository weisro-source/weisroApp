import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:weisro/core/api/api_error_handler.dart';
import 'package:weisro/core/utils/service_locator.dart';
import 'package:weisro/feature/booking/data/booking_repo/booking_repo.dart';
import 'package:weisro/feature/booking/data/models/your_booking_model.dart';

part 'your_booking_state.dart';

class YourBookingCubit extends Cubit<YourBookingState> {
  YourBookingCubit() : super(YourBookingInitial());

  Future<void> getAllYourBooking() async {
    emit(YourBookingLoading());
    Either<Failure, YourBookingModel> result =
        await getIt.get<BookingRepository>().yourBookingApi();
    result.fold(
      (errorInGetAllBooking) {
        emit(YourBookingPaginationFailures(error: errorInGetAllBooking));
      },
      (allBooking) {
        emit(YourBookingSuccess(bookingModel: allBooking));
      },
    );
  }
}
