part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchSuccess extends SearchState {
  final LastServicesModel searchResult;

  SearchSuccess({required this.searchResult});
}

final class SearchFailures extends SearchState {
  final Failure error;

  SearchFailures({required this.error});
}
