import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
}
