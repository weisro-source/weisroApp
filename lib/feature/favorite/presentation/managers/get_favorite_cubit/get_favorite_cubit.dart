import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:weisro/core/api/api_error_handler.dart';
import 'package:weisro/core/utils/service_locator.dart';
import 'package:weisro/feature/favorite/data/favorite_repo/favorite_repo.dart';
import 'package:weisro/feature/favorite/data/models/favorite_model.dart';

part 'get_favorite_state.dart';

class GetFavoriteCubit extends Cubit<GetFavoriteState> {
  GetFavoriteCubit() : super(GetFavoriteInitial());
  Future<void> getAllFavorites(BuildContext context,
      {int pageNumber = 1}) async {
    if (pageNumber == 1) {
      emit(GetFavoriteLoading());
    } else {
      emit(GetFavoritePaginationLoading());
    }
    Either<Failure, FavoriteModel> result =
        await getIt.get<FavoriteRepository>().getUserFavoriteApi(pageNumber);
    result.fold(
      (errorInGetUserFavorite) {
        if (pageNumber == 1) {
          emit(GetFavoriteFailures(error: errorInGetUserFavorite));
        } else {
          emit(GetFavoritePaginationFailures(error: errorInGetUserFavorite));
        }
      },
      (getAllFavorites) {
        emit(GetFavoriteSuccess(favorites: getAllFavorites));
      },
    );
  }
}
