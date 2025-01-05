part of 'get_all_worker_tags_cubit.dart';

@immutable
sealed class GetAllWorkerTagsState {}

final class GetAllWorkerTagsInitial extends GetAllWorkerTagsState {}

final class GetAllWorkerTagsLoading extends GetAllWorkerTagsState {}

final class GetAllWorkerTagsSuccess extends GetAllWorkerTagsState {
  final WorkerTags allTags;

  GetAllWorkerTagsSuccess({required this.allTags});
}

final class GetAllWorkerTagsFailures extends GetAllWorkerTagsState {
  final Failure failure;

  GetAllWorkerTagsFailures({required this.failure});
}
