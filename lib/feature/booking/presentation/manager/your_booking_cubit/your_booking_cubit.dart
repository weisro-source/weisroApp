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

  Future<void> getAllYourBooking({int pageNumber = 1}) async {
    if (pageNumber == 1) {
      emit(YourBookingLoading());
    } else {
      emit(YourBookingPaginationLoading());
    }
    Either<Failure, YourBookingModel> result =
        await getIt.get<BookingRepository>().yourBookingApi(pageNumber);
    result.fold(
      (errorInGetAllBooking) {
        if (pageNumber == 1) {
          emit(YourBookingFailures(error: errorInGetAllBooking));
        } else {
          emit(YourBookingPaginationFailures(error: errorInGetAllBooking));
        }
      },
      (allBooking) {
        emit(YourBookingSuccess(bookingModel: allBooking));
      },
    );
  }
}
