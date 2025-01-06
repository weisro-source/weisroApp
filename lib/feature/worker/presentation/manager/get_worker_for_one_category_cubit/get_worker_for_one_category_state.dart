part of 'get_worker_for_one_category_cubit.dart';

@immutable
sealed class GetWorkerForOneCategoryState {}

final class GetWorkerForOneCategoryInitial
    extends GetWorkerForOneCategoryState {}

final class GetWorkerForOneCategoryLoading
    extends GetWorkerForOneCategoryState {}

final class GetWorkerForOneCategoryLoadingPagination
    extends GetWorkerForOneCategoryState {}

final class GetWorkerForOneCategorySuccess
    extends GetWorkerForOneCategoryState {
  final WorkersForCategory workers;

  GetWorkerForOneCategorySuccess({required this.workers});
}

final class GetWorkerForOneCategoryFailures
    extends GetWorkerForOneCategoryState {
  final Failure error;

  GetWorkerForOneCategoryFailures({required this.error});
}

final class GetWorkerForOneCategoryFailuresPagination
    extends GetWorkerForOneCategoryState {
  final Failure error;

  GetWorkerForOneCategoryFailuresPagination({required this.error});
}
