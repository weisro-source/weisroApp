part of 'add_service_to_favorite_cubit.dart';

@immutable
sealed class AddServiceToFavoriteState {}

final class AddServiceToFavoriteInitial extends AddServiceToFavoriteState {}

final class AddServiceToFavoriteLoading extends AddServiceToFavoriteState {}

final class AddServiceToFavoriteSuccess extends AddServiceToFavoriteState {
  final String message;

  AddServiceToFavoriteSuccess({required this.message});
}

final class AddServiceToFavoriteFailures extends AddServiceToFavoriteState {
  final Failure error;

  AddServiceToFavoriteFailures({required this.error});
}
