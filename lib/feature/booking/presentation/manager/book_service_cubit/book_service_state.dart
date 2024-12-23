part of 'book_service_cubit.dart';

@immutable
sealed class BookServiceState {}

final class BookServiceInitial extends BookServiceState {}

final class BookServiceLoading extends BookServiceState {}

final class BookServiceSuccess extends BookServiceState {}

final class BookServiceFailures extends BookServiceState {
  final Failure error;

  BookServiceFailures({required this.error});
}
