import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/core/api/api_error_handler.dart';
import 'package:weisro/core/utils/service_locator.dart';
import 'package:weisro/feature/booking/data/booking_repo/booking_repo.dart';

part 'book_worker_state.dart';

class BookWorkerCubit extends Cubit<BookWorkerState> {
  BookWorkerCubit() : super(BookWorkerInitial());

  static BookWorkerCubit get(context) => BlocProvider.of(context);
  TextEditingController noteController = TextEditingController();
  Future<void> bookWorker(
    String workerId,
    List<String> days,
  ) async {
    Map<String, dynamic> data = {
      "workerId": workerId,
      "days": days,
      "note": noteController.text
    };
    emit(BookWorkerLoading());
    var result = await getIt.get<BookingRepository>().addBookingWorkerApi(data);
    result.fold(
      (errorInBook) {
        emit(BookWorkerFailures(error: errorInBook));
      },
      (booked) {
        emit(BookWorkerSuccess());
      },
    );
  }
}
