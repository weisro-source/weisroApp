import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weisro/core/api/api_error_handler.dart';
import 'package:weisro/core/utils/service_locator.dart';
import 'package:weisro/feature/services/data/service_repo/service_repo.dart';

part 'add_service_to_favorite_state.dart';

class AddServiceToFavoriteCubit extends Cubit<AddServiceToFavoriteState> {
  AddServiceToFavoriteCubit() : super(AddServiceToFavoriteInitial());
  static AddServiceToFavoriteCubit get(context) => BlocProvider.of(context);
  Future<void> addServiceToFavorite(
      BuildContext context, String serviceId) async {
    emit(AddServiceToFavoriteLoading());
    Either<Failure, String> result = await getIt
        .get<ServiceRepository>()
        .addServiceToFavorite(context, serviceId);
    result.fold(
      (errorInAddServiceToFavorite) {
        emit(AddServiceToFavoriteFailures(error: errorInAddServiceToFavorite));
      },
      (addServiceToFavoriteSuccess) {
        emit(AddServiceToFavoriteSuccess(message: addServiceToFavoriteSuccess));
      },
    );
  }
}
