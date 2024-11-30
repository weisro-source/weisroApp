part of 'get_favorite_cubit.dart';

@immutable
sealed class GetFavoriteState {}

final class GetFavoriteInitial extends GetFavoriteState {}

final class GetFavoriteLoading extends GetFavoriteState {}

final class GetFavoritePaginationLoading extends GetFavoriteState {}

final class GetFavoriteSuccess extends GetFavoriteState {
  final FavoriteModel favorites;

  GetFavoriteSuccess({required this.favorites});
}

final class GetFavoriteFailures extends GetFavoriteState {
  final Failure error;

  GetFavoriteFailures({required this.error});
}

final class GetFavoritePaginationFailures extends GetFavoriteState {
  final Failure error;

  GetFavoritePaginationFailures({required this.error});
}
