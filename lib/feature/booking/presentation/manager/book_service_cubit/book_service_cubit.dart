import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weisro/core/api/api_error_handler.dart';
import 'package:weisro/core/utils/constant.dart';
import 'package:weisro/core/utils/service_locator.dart';
import 'package:weisro/feature/booking/data/booking_repo/booking_repo.dart';
import 'package:weisro/generated/l10n.dart';

part 'book_service_state.dart';

class BookServiceCubit extends Cubit<BookServiceState> {
  BookServiceCubit() : super(BookServiceInitial());
  static BookServiceCubit get(context) => BlocProvider.of(context);
  String hourSelected = Constants.hoursKey;
  String dailySelected = Constants.dailyKey;
  String errorValidateMessage = '';
  String selectedType(String select, BuildContext context) {
    switch (select) {
      case Constants.hoursKey:
        return S.of(context).Rent_per_hour;
      case Constants.dailyKey:
        return S.of(context).Rent_per_day;

      default:
        return 'Invalid Selection';
    }
  }

  List<String> generateTimeSlots(String? startTime, String? endTime) {
    if (startTime == null || endTime == null) {
      return [];
    }

    try {
      DateFormat inputFormat = DateFormat.jm(); // Input format: "8:00 AM"
      DateFormat outputFormat =
          DateFormat.Hm(); // Output format: "08:00" To view this

      DateTime start = inputFormat.parse(startTime);
      DateTime end = inputFormat.parse(endTime);

      List<String> slots = [];
      while (start.isBefore(end)) {
        DateTime nextHour = start.add(const Duration(hours: 1));
        slots.add(
            "${outputFormat.format(start)} - ${outputFormat.format(nextHour)}");
        start = nextHour;
      }
      return slots;
    } catch (e) {
      return [];
    }
  }

  num totalDayPrice(int numberOfDays, num dailyPrice) {
    return numberOfDays * dailyPrice;
  }

  bool validateInput(List<String> daysIds, BuildContext context) {
    if (daysIds.isEmpty) {
      errorValidateMessage = S.of(context).Select_At_Least_One_Day;
      return false;
    } else {
      return true;
    }
  }

  Future<void> addServiceBooking(
      String serviceId, List<String> daysIds, String? note) async {
    Map<String, dynamic> bookingServiceBody = {
      "serviceId": serviceId,
      "days": daysIds,
    };

    // Add the note only if it is not null
    if (note != null) {
      bookingServiceBody["notes"] = note;
    }
    emit(BookServiceLoading());
    var result = await getIt
        .get<BookingRepository>()
        .addBookingServiceApi(bookingServiceBody);
    result.fold(
      (errorInAddServiceBooking) {
        emit(BookServiceFailures(error: errorInAddServiceBooking));
      },
      (addedSuccess) {
        emit(BookServiceSuccess());
      },
    );
  }
}
