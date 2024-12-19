import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weisro/generated/l10n.dart';

part 'book_service_state.dart';

class BookServiceCubit extends Cubit<BookServiceState> {
  BookServiceCubit() : super(BookServiceInitial());
  static BookServiceCubit get(context) => BlocProvider.of(context);
  String hourSelected = "Hour";
  String dailySelected = "Day";
  String selectedType(String select, BuildContext context) {
    switch (select) {
      case 'Hour':
        return S.of(context).Rent_per_hour;
      case 'Day':
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
}
