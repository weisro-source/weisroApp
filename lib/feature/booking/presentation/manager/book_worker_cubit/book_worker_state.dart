part of 'book_worker_cubit.dart';

@immutable
sealed class BookWorkerState {}

final class BookWorkerInitial extends BookWorkerState {}

final class BookWorkerLoading extends BookWorkerState {}

final class BookWorkerSuccess extends BookWorkerState {}

final class BookWorkerFailures extends BookWorkerState {
  final Failure error;

  BookWorkerFailures({required this.error});
}
