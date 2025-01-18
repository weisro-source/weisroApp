import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:weisro/core/api/api_error_handler.dart';
import 'package:weisro/core/utils/service_locator.dart';
import 'package:weisro/feature/booking/data/booking_repo/booking_repo.dart';

part 'update_booking_statue_state.dart';

class UpdateBookingStatueCubit extends Cubit<UpdateBookingStatueState> {
  UpdateBookingStatueCubit() : super(UpdateBookingStatueInitial());
  Future<void> updateBookingState(String bookingId, String newState) async {
    emit(UpdateBookingStatueLoading());
    Either<Failure, String> result = await getIt
        .get<BookingRepository>()
        .updateBookingStatue(bookingId, newState);
    result.fold(
      (errorInUpdateBookingState) {
        emit(UpdateBookingStatueFailures(error: errorInUpdateBookingState));
      },
      (updated) {
        emit(UpdateBookingStatueSuccess());
      },
    );
  }
}
